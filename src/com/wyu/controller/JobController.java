package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.domain.Dept;
import com.wyu.domain.Job;
import com.wyu.domain.User;
import com.wyu.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class JobController {
    @Autowired
    private JobService jobService;

    @RequestMapping(value = "selectJob.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectJob(int page,int limit){
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
        List<Job> list = jobService.selectJob();
        PageInfo<Job> pageInfo = new PageInfo<>(list);
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

    @RequestMapping(value = "deleteByJid.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String deleteByJid(int jid){
        System.out.println("要删除的id："+jid);
        int i = jobService.deleteByJid(jid);
        return i+"";
    }

    @RequestMapping(value = "updateJob.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String updateJob(String json){
        System.out.println("要修改的数据："+json);
        Job job = JSON.parseObject(json,Job.class);
        int i = jobService.updateUser(job);
        return i+"";
    }

    @RequestMapping(value = "selectByWhereJob.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectByWhereDept(Job job) {
        System.out.println("条件查询的数据：" + job);
        if (job != null) {
//            PageHelper.startPage(1,10);
            List<Job> list = jobService.selectByWhereJob(job);
//            PageInfo<User> pageInfo = new PageInfo<>(list);
//            long total = pageInfo.getTotal();
//            System.out.println("总条数："+total);
            list.forEach(li -> System.out.println(li));
            Map<String, Object> map = new HashMap<>();
            map.put("code", 0);
            map.put("msg", "");
            map.put("count", list.size());
            map.put("data", list);
            String json = JSON.toJSONString(map);
            return json;
        }
        return "";
    }

    @RequestMapping("/jobCheck.do")
    @ResponseBody
    public String jobCheck(String jname){
        System.out.println("验证的部门名称为： "+jname);
        int i = jobService.jobCheck(jname);
        return i+"";
    }

    @RequestMapping(value ="addJob.do",produces = "text/html;charset=UTF-8;") //使用value不能加/号
    @ResponseBody
    public String addJob(String json){
        String msg;
        int i = jobService.addJob(json);
        if (i>0){
            msg = "1"; //注册成功
            System.out.println("添加成功");
        }else {
            msg = "0"; //注册失败
            System.out.println("添加失败");
        }
        return msg;
    }
}
