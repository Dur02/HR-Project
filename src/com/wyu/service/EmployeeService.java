package com.wyu.service;

import com.wyu.domain.Dept;
import com.wyu.domain.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> selectEmployee();

    int deleteByeid(int id);

    int updateEmployee(Employee employee);

    List<Employee> selectByWhereEmployee(Employee employee);

    int nameCheck(String name);

    int phonecheck2(String phone);

    int addEmployee(String json);
}
