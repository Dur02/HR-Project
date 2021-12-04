package com.wyu.service;

import com.wyu.domain.Dept;
import com.wyu.domain.User;

import java.util.List;

public interface DeptService {
    List<Dept> selectDept();

    int deleteByDid(int did);

    int updateDept(Dept dept);

    List<Dept> selectByWhereDept(Dept dept);

    int deptCheck(String dname);

    int addDept(String json);
}
