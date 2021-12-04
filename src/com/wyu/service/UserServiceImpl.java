package com.wyu.service;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.wyu.domain.Count;
import com.wyu.domain.User;
import com.wyu.domain.UserExample;
import com.wyu.mapper.CountMapper;
import com.wyu.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
//spring管理对象
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CountMapper countMapper;

    @Override
    public User loginByUsername(String id, String password) {
        //调用逆向工程完成查询操作(dao层）
        //前端->web层(controller)->service层->dao层(mapper)
        int i = 0;
        try {
            i = Integer.parseInt(id);
        } catch (Exception e) {

        }
        //User user = userMapper.selectByPrimaryKey(i);
        UserExample example = new UserExample();
        example.or().andIdEqualTo(i);
        example.or().andPhoneEqualTo(id);
        List<User> users = userMapper.selectByExample(example);
        //判断用户是否为空
        if (users != null && users.size() > 0) {
            if (users.get(0) != null) {
                if (password.equals(users.get(0).getPassword())) {
                    //说明用户不为空
                    return users.get(0);
                }
                System.out.println("密码错误");
            }
        }
        return null;
    }

    @Override
    public int phoneCheck(String phone) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<User> users = userMapper.selectByExample(example);
        if(users!=null&&users.size()>0){
            return 1;
        }
        return 0;
    }

    @Override
    public int insertUser(String json) {
        User user = JSON.parseObject(json, User.class);
        user.setRoleId(1);
        user.setCreatedate(new Date());
        System.out.println("user对象" + user);

        int i = userMapper.insertSelective(user);
        return i;
    }

    @Override
    public Count selectCount() {
        //查询用户等表所包含的数据个数
        return countMapper.selectCount();
    }

    @Override
    public List<User> selectUsers() {
        //调用dao查询数据
        UserExample example = new UserExample();
        return userMapper.selectByExample(example);
    }

    @Override
    public int updateUser(User user) {
        //修改数据
        int i = userMapper.updateByPrimaryKeySelective(user);
        return i;
    }

    @Override
    public int deleteById(int id) {
        int i = userMapper.deleteByPrimaryKey(id);
        return i;
    }

    @Override
    public List<User> selectByWhereUsers(User user) {
        UserExample ue = new UserExample();
        //逆向工程完成模糊条件查询
        UserExample.Criteria criteria = ue.createCriteria();
        if(user.getId()!=null&&user.getId()!=0){
            ue.or().andIdEqualTo(user.getId());
        }
        if(!"".equals(user.getUsername())&&user.getUsername()!=null){
            ue.or().andUsernameLike("%"+user.getUsername()+"%");
        }
        if(!"".equals(user.getPhone())&&user.getPhone()!=null){
            ue.or().andPhoneLike("%"+user.getPhone()+"%");
        }
        if(user.getRoleId()!=null && user.getRoleId()!=0){
            ue.or().andRoleIdEqualTo(user.getRoleId());
        }
        List<User> users = userMapper.selectByExample(ue);
        return users;
    }
}
