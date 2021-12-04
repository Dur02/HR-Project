package com.wyu.service;

import com.alibaba.fastjson.JSON;
import com.wyu.domain.Dept;
import com.wyu.domain.DeptExample;
import com.wyu.domain.User;
import com.wyu.domain.UserExample;
import com.wyu.mapper.DeptMapper;
import com.wyu.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService{

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> selectDept() {
        DeptExample example = new DeptExample();
        return deptMapper.selectByExample(example);
    }

    @Override
    public int deleteByDid(int did) {
        int i = deptMapper.deleteByPrimaryKey(did);
        return i;
    }

    @Override
    public int updateDept(Dept dept) {
        int i = deptMapper.updateByPrimaryKeySelective(dept);
        return i;
    }

    @Override
    public List<Dept> selectByWhereDept(Dept dept) {
        DeptExample de = new DeptExample();
//        DeptExample.Criteria criteria = de.createCriteria();   可利用criteria更改各个搜索框的逻辑，以下注释可把符合所有搜索框条件的结果输出
        if(dept.getDid()!=null&&dept.getDid()!=0){
            de.or().andDidEqualTo(dept.getDid());
//            criteria.andDidEqualTo()
        }
        if (!"".equals(dept.getDname())&&dept.getDname()!=null){
            de.or().andDnameLike("%"+dept.getDname()+"%");
//            criteria.andDnameLike("%"+dept.getDname()+"%");
        }
        List<Dept> depts = deptMapper.selectByExample(de);
        return depts;
    }

    @Override
    public int deptCheck(String dname) {
        DeptExample example = new DeptExample();
        DeptExample.Criteria criteria = example.createCriteria();
        criteria.andDnameEqualTo(dname);
        List<Dept> depts = deptMapper.selectByExample(example);
        if(depts!=null&&depts.size()>0){
            return 1;
        }
        return 0;
    }

    @Override
    public int addDept(String json) {
        Dept dept = JSON.parseObject(json,Dept.class);
        System.out.println("dept对象："+dept);
        int i =deptMapper.insertSelective(dept);
        return i;
    }


}
