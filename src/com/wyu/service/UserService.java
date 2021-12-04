package com.wyu.service;

import com.wyu.domain.Count;
import com.wyu.domain.User;

import java.util.List;

public interface UserService {

    //登录
    User loginByUsername(String id, String password);

    //检测是否注册过
    int phoneCheck(String phone);

    //注册功能
    int insertUser(String json);

    //查询各个表的数量
    Count selectCount();

    //查询用户
    List<User> selectUsers();

    //修改数据
    int updateUser(User user);

    int deleteById(int id);

    List<User> selectByWhereUsers(User user);
}
