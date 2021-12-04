package com.wyu.service;

import com.alibaba.fastjson.JSON;
import com.wyu.domain.Dept;
import com.wyu.domain.DeptExample;
import com.wyu.domain.Role;
import com.wyu.domain.RoleExample;
import com.wyu.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> selectRole() {
        RoleExample example = new RoleExample();
        return roleMapper.selectByExample(example);
    }

    @Override
    public int deleteByrid(int rid) {
        int i = roleMapper.deleteByPrimaryKey(rid);
        return i;
    }

    @Override
    public int updateRole(Role role) {
        int i = roleMapper.updateByPrimaryKeySelective(role);
        return i;
    }

    @Override
    public List<Role> selectByWhereRole(Role role) {
        RoleExample re = new RoleExample();
//        DeptExample.Criteria criteria = de.createCriteria();   可利用criteria更改各个搜索框的逻辑，以下注释可把符合所有搜索框条件的结果输出
        if(role.getRid()!=null&& role.getRid()!=0){
            re.or().andRidEqualTo(role.getRid());
//            criteria.andDidEqualTo()
        }
        if (!"".equals(role.getRname())&&role.getRname()!=null){
            re.or().andRnameLike("%"+role.getRname()+"%");
//            criteria.andDnameLike("%"+dept.getDname()+"%");
        }
        List<Role> roles = roleMapper.selectByExample(re);
        return roles;
    }

    @Override
    public int roleCheck(String rname) {
        RoleExample example = new RoleExample();
        RoleExample.Criteria criteria = example.createCriteria();
        criteria.andRnameEqualTo(rname);
        List<Role> roles = roleMapper.selectByExample(example);
        if(roles!=null&&roles.size()>0){
            return 1;
        }
        return 0;
    }

    @Override
    public int addRole(String json) {
        Role role = JSON.parseObject(json,Role.class);
        System.out.println("dept对象："+role);
        int i =roleMapper.insertSelective(role);
        return i;
    }
}
