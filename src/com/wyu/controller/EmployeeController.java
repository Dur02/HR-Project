package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyu.domain.Dept;
import com.wyu.domain.Employee;
import com.wyu.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "selectEmployee.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectEmployee(int page,int limit){
        System.out.println("当前页："+page+"，显示条数："+limit);
        PageHelper.startPage(page,limit);
        List<Employee> list = employeeService.selectEmployee();
        PageInfo<Employee> pageInfo = new PageInfo<>(list);
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

    @RequestMapping(value = "deleteByeid.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String deleteByeid(int id){
        System.out.println("要删除的did："+id);
        int i = employeeService.deleteByeid(id);
        return i+"";
    }

    @RequestMapping(value = "updateEmployee.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String updateEmployee(String json){
        System.out.println("要修改的数据："+json);
        Employee employee = JSON.parseObject(json,Employee.class);
        int i = employeeService.updateEmployee(employee);
        return i+"";
    }

    @RequestMapping(value = "selectByWhereEmployee.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectByWhereDept(Employee employee){
        System.out.println("条件查询的数据："+employee);
        if (employee!=null){
//            PageHelper.startPage(1,10);
            List<Employee> list = employeeService.selectByWhereEmployee(employee);
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

    @RequestMapping("/nameCheck.do")
    @ResponseBody
    public String nameCheck(String name){
        System.out.println("验证的员工为： "+name);
        int i = employeeService.nameCheck(name);
        return i+"";
    }

    @RequestMapping("/checkphone.do")
    @ResponseBody
    public String phonecheck2(String phone){
        System.out.println("验证的员工手机为： "+phone);
        int i = employeeService.phonecheck2(phone);
        return i+"";
    }

    @RequestMapping(value ="addEmployee.do",produces = "text/html;charset=UTF-8;") //使用value不能加/号
    @ResponseBody
    public String addEmployee(String json){
        String msg;
        int i = employeeService.addEmployee(json);
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
