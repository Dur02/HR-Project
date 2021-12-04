package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.domain.Dept;
import com.wyu.domain.User;
import com.wyu.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping(value = "selectDept.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectDept(int page,int limit){
        System.out.println("当前页："+page+"，显示条数："+limit);
        PageHelper.startPage(page,limit);
        List<Dept> list = deptService.selectDept();
        PageInfo<Dept> pageInfo = new PageInfo<>(list);
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

    @RequestMapping(value = "deleteBydid.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String deleteBydid(int did){
        System.out.println("要删除的did："+did);
        int i = deptService.deleteByDid(did);
        return i+"";
    }

    @RequestMapping(value = "updateDept.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String updateDept(String json){
        System.out.println("要修改的数据："+json);
        Dept dept = JSON.parseObject(json,Dept.class);
        int i = deptService.updateDept(dept);
        return i+"";
    }

    @RequestMapping(value = "selectByWhereDept.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectByWhereDept(Dept dept){
        System.out.println("条件查询的数据："+dept);
        if (dept!=null){
//            PageHelper.startPage(1,10);
            List<Dept> list = deptService.selectByWhereDept(dept);
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

    @RequestMapping("/deptCheck.do")
    @ResponseBody
    public String deptCheck(String dname){
        System.out.println("验证的部门名称为： "+dname);
        int i = deptService.deptCheck(dname);
        return i+"";
    }

    @RequestMapping(value ="addDept.do",produces = "text/html;charset=UTF-8;") //使用value不能加/号
    @ResponseBody
    public String addDept(String json){
        String msg;
        int i = deptService.addDept(json);
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
