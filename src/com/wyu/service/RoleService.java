package com.wyu.service;

import com.wyu.domain.Dept;
import com.wyu.domain.Role;

import java.util.List;

public interface RoleService {
    List<Role> selectRole();

    int deleteByrid(int rid);

    int updateRole(Role role);

    List<Role> selectByWhereRole(Role role);

    int roleCheck(String rname);

    int addRole(String json);
}
