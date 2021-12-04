package com.wyu.controller;

import cn.hutool.db.Session;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.domain.Count;
import com.wyu.domain.User;
import com.wyu.mapper.UserMapper;
import com.wyu.service.UserService;
import com.wyu.service.UserServiceImpl;
import org.aspectj.apache.bcel.classfile.Code;
import org.aspectj.apache.bcel.classfile.SourceFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sun.misc.Request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Delayed;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/test1")
    public ModelAndView test1(String number) {
        ModelAndView mv = new ModelAndView();
        System.out.println("number===" + number);
        mv.addObject("user", "随便");
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping("/login.do")
    public String login(String id, String password, String checkcode, HttpSession session, HttpServletResponse response, RedirectAttributes model) throws IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
        //接受用户提交过来的用户名和密码
        System.out.println("用户名：" + id + "，密码：" + password + "，验证码：" +checkcode);
        //判断验证码是否为空
        if (!"".equals(checkcode) && checkcode != null) {
            //比较验证码
            //获取session中的验证码
            String code = (String) session.getAttribute("code");
            if (checkcode.equalsIgnoreCase(code)) {
                //验证成功，去完成登录功能
                //调用service层完成查询操作
                User user = userService.loginByUsername(id, password);
                if (user != null) {
                    //去数据库查找各个表的数据的数量
                    Count count = userService.selectCount();
                    System.out.println("各表数量："+count);  //首页显示所有表的功能
                    session.setAttribute("count",count);
                    //登陆成功,将用户信息保存到session中
                    session.setAttribute("user", user);
                    return "redirect:/index.jsp"; //跳转到index.jsp页面
                } else {
                    model.addFlashAttribute("loginMsg","账号或密码错误，请重新尝试");
                }
            } else {
                model.addFlashAttribute("loginMsg","验证码错误");
            }
        }
        //使用requset.seattribute("loginMsg","验证码错误")和框架return "login"会导致刷新页面时表单会重新提交和错误提醒信息会再次显示，使用重定向解决
        //数据可放到requsest域中在前端获取，但是使用重定向之后不能用request传递数据
        //return "login";
        //SpringMVC提供对象RedirectAttributes,跳转后销毁，不会像session中存活这么久
        //直接return "redirect:/login.do";不能直接在前端获取，新建forward.do，转发一次解决
        return "redirect:/forward.do";
    }

    @RequestMapping("/forward.do")
    public String forward(@ModelAttribute("loginMsg") String loginMsg,Model model){
        System.out.println("登录信息==" +loginMsg);
        model.addAttribute("loginMsg",loginMsg);
        return "login";
    }

    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/login.jsp";
    }

    @RequestMapping("/phoneCheck.do")
    @ResponseBody
    public String phoneCheck(String phone){
        System.out.println("验证的手机号为： "+phone);
        int i = userService.phoneCheck(phone);
        return i+"";
    }

    @RequestMapping(value ="register.do",produces = "text/html;charset=UTF-8;") //使用value不能加/号
    @ResponseBody
    public String register(String checkcode,String json,HttpSession session){
        System.out.println("注册验证码："+checkcode+ " , 注册的数据："+json);
        String regString = "-1"; //验证码错误
        String code = (String)session.getAttribute("code");
        if(checkcode != null&&!"".equals(checkcode)){  //checkcode即验证码，不会为空，肯定进入此分支，前端设置了必须输入
            if(checkcode.equalsIgnoreCase(code)){
                System.out.println("验证码正确");
                int i = userService.insertUser(json);
                if (i>0){
                    regString = "1"; //注册成功
                    System.out.println("注册成功");
                }else {
                    regString = "0"; //注册失败
                    System.out.println("注册失败");
                }
            }else {
                System.out.println("验证码错误");
            }
        }
        return regString;
    }

    @RequestMapping(value = "selectUser.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectUser(int page,int limit){
        System.out.println("当前页："+page+"，显示条数："+limit);
//        int start = (page-1)*limit;
//        System.out.println("start: "+start);
        //使用mybatis分页插件
        PageHelper.startPage(page,limit);  //待解决
        //老师说上面的page应该用上面注释的start代替，但实际操作发现在23条数据的每10条一页的显示中，第一页可正常显示0~9的数据，但第二页会显示20~22的数据，第三页仍是20~22的数据，切换到20条数据一页的模式中却能分两页全部显示，尚不清楚原因，用page则正常
        //此分页插件是否和sql语句一样的原理，第一个参数表示开始取值的地方，而第二个参数表示要取得的数据个数呢，如果原理一样，正常运行的应该是start而不是page
        //设置写出start并没有发现start有所变化，控制台显示也没获取到10~19的数据，按理应该不是前端的问题，但仍然需要尝试

        //查询数据库，调用service层
//        System.out.println("start: "+start);
        List<User> list = userService.selectUsers();
        PageInfo<User> pageInfo = new PageInfo<>(list);
        long total = pageInfo.getTotal();//获得数量
        System.out.println("总条数："+total);
//        System.out.println("start: "+start);

        //开始构建json数据，提供给前端显示
        //"code":  解析接口的状态
        //"msg":   解析提示文本
        //"count":   解析数据长度
        //"data":    解析数据列表
        Map<String,Object> map =new HashMap<>();
        map.put("code",0);
        map.put("msg","拼命加载中");
        map.put("count",total);
        map.put("data",list);
        String json = JSON.toJSONString(map);
        System.out.println("构建的json数据："+json);
        return json;
    }

    @RequestMapping(value = "updateUser.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String updateUser(String json){
        System.out.println("要修改的数据："+json);
        User user = JSON.parseObject(json,User.class);
        int i = userService.updateUser(user);
        return i+"";
    }

    @RequestMapping(value = "deleteById.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String deleteById(int id){
        System.out.println("要删除的id："+id);
        int i = userService.deleteById(id);
        return i+"";
    }

    @RequestMapping(value = "selectByWhereUsers.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectByWhereUsers(User user){
        System.out.println("条件查询的数据："+user);
        if (user!=null){
//            PageHelper.startPage(1,10);
            List<User> list = userService.selectByWhereUsers(user);
//            PageInfo<User> pageInfo = new PageInfo<>(list);
//            long total = pageInfo.getTotal();
//            System.out.println("总条数："+total);
            list.forEach(li-> System.out.println(li));
            Map<String,Object> map = new HashMap<>();
            map.put("code",0);
            map.put("msg","");
            map.put("count",list.size());
            map.put("data",list);
            String json = JSON.toJSONString(map);
            return json;
        }
        return "";
    }

//    @RequestMapping("/checkPhone.do")
//    public String checkPhone(String phoneString){
//        System.out.println("验证的手机号: "+phoneString);
//        int i = userService.checkPhone(phoneString);
//        return i + "";
//    }



}

