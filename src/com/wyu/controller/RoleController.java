package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.domain.Dept;
import com.wyu.domain.Role;
import com.wyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "selectRole.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectRole(int page,int limit){
        System.out.println("当前页："+page+"，显示条数："+limit);
        PageHelper.startPage(page,limit);
        List<Role> list = roleService.selectRole();
        PageInfo<Role> pageInfo = new PageInfo<>(list);
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

    @RequestMapping(value = "deleteByrid.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String deleteByrid(int rid){
        System.out.println("要删除的rid："+rid);
        int i = roleService.deleteByrid(rid);
        return i+"";
    }

    @RequestMapping(value = "updateRole.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String updateRole(String json){
        System.out.println("要修改的数据："+json);
        Role role = JSON.parseObject(json,Role.class);
        int i = roleService.updateRole(role);
        return i+"";
    }

    @RequestMapping(value = "selectByWhereRole.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectByWhereRole(Role role){
        System.out.println("条件查询的数据："+role);
        if (role!=null){
//            PageHelper.startPage(1,10);
            List<Role> list = roleService.selectByWhereRole(role);
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

    @RequestMapping("/roleCheck.do")
    @ResponseBody
    public String deptCheck(String rname){
        System.out.println("验证的部门名称为： "+rname);
        int i = roleService.roleCheck(rname);
        return i+"";
    }

    @RequestMapping(value ="addRole.do",produces = "text/html;charset=UTF-8;") //使用value不能加/号
    @ResponseBody
    public String addRole(String json){
        String msg;
        int i = roleService.addRole(json);
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
