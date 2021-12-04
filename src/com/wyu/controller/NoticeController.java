package com.wyu.controller;

import cn.hutool.db.Session;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.domain.Dept;
import com.wyu.domain.Notice;
import com.wyu.domain.User;
import com.wyu.service.NoticeService;
import com.wyu.service.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value ="selectByTop5Notice.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectByTop5Notice(){
        List<Notice> notice = noticeService.selectByTop5Notice();
        notice.forEach(li-> System.out.println(li));
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",0);
        map.put("data",notice);
        String json = JSON.toJSONString(map);
        return json;
    }

    @RequestMapping("/addNotice.do")
    @ResponseBody
    public  String addNotice(String json, HttpSession session){
        System.out.println("公告数据："+json);
        Notice notice = JSON.parseObject(json, Notice.class);
        User user = (User) session.getAttribute("user");
        if (user!=null){
            System.out.println("user不为空");
            System.out.println("封装后的对象："+user);
            notice.setUserid(user.getId());
            int i = noticeService.addNotice(notice);
            return i+"";
        }
        return 0+"";
    }

    @RequestMapping(value = "selectNotice.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectNotice(int page,int limit){
        System.out.println("当前页："+page+"，显示条数："+limit);
        PageHelper.startPage(page,limit);
        List<Notice> list = noticeService.selectNotice();
        list.forEach(li-> System.out.println(li));
        PageInfo<Notice> pageInfo = new PageInfo<>(list);
        long total = pageInfo.getTotal();
        System.out.println("总条数："+total);
        Map<String,Object> map =new HashMap<>();
        map.put("code",0);
        map.put("msg","拼命加载中");
        map.put("count",total);
        map.put("data",list);
        String json = JSON.toJSONString(map);
        System.out.println("构建的json数据："+json);
        return json;
    }

    @RequestMapping(value = "deleteBynid.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String deleteBynid(int id){
        System.out.println("要删除的did："+id);
        int i = noticeService.deleteByNid(id);
        return i+"";
    }

    @RequestMapping(value = "updateNotice.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String updateNotice(String json){
        System.out.println("要修改的数据："+json);
        Notice notice = JSON.parseObject(json,Notice.class);
        int i = noticeService.updateNotice(notice);
        return i+"";
    }

    @RequestMapping(value = "selectByWhereNotice.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectByWhereNotice(Notice notice){
        System.out.println("条件查询的数据："+notice);
        if (notice!=null){
//            PageHelper.startPage(1,10);
            List<Notice> list = noticeService.selectByWhereDept(notice);
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
}
