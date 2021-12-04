package com.wyu.service;

import com.alibaba.fastjson.JSON;
import com.wyu.domain.Dept;
import com.wyu.domain.DeptExample;
import com.wyu.domain.Employee;
import com.wyu.domain.EmployeeExample;
import com.wyu.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService{
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> selectEmployee() {
        EmployeeExample example = new EmployeeExample();
        return employeeMapper.selectByExample(example);
    }

    @Override
    public int deleteByeid(int id) {
        int i = employeeMapper.deleteByPrimaryKey(id);
        return i;
    }

    @Override
    public int updateEmployee(Employee employee) {
        int i = employeeMapper.updateByPrimaryKeySelective(employee);
        return i;
    }

    @Override
    public List<Employee> selectByWhereEmployee(Employee employee) {
        EmployeeExample ee = new EmployeeExample();
        if(employee.getId()!=null&&employee.getId()!=0){
            ee.or().andIdEqualTo(employee.getId());
        }
        if (!"".equals(employee.getName())&&employee.getName()!=null){
            ee.or().andNameLike("%"+employee.getName()+"%");
        }
        if (!"".equals(employee.getCardId())&&employee.getCardId()!=null){
            ee.or().andCardIdLike("%"+employee.getCardId()+"%");
        }
        List<Employee> employees = employeeMapper.selectByExample(ee);
        return employees;
    }

    @Override
    public int nameCheck(String name) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        List<Employee> employees = employeeMapper.selectByExample(example);
        if(employees!=null&&employees.size()>0){
            return 1;
        }
        return 0;
    }

    @Override
    public int phonecheck2(String phone) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<Employee> employees = employeeMapper.selectByExample(example);
        if(employees!=null&&employees.size()>0){
            return 1;
        }
        return 0;
    }

    @Override
    public int addEmployee(String json) {
        Employee employee = JSON.parseObject(json,Employee.class);
        employee.setCreateDate(new Date());
        System.out.println("employee对象："+employee);
        int i =employeeMapper.insertSelective(employee);
        return i;
    }
}
