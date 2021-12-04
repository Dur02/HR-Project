//package com.wyu.test;
//
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//import org.junit.Test;
//
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.List;
//import java.util.Scanner;
//
//public class test1 {
//    public SqlSession getSession() throws IOException {
//        String resource = "mybatis-config.xml";
//        InputStream inputStream = Resources.getResourceAsStream(resource);
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//        return sqlSessionFactory.openSession(true);
//    }
//
//    @Test
//    public void test1() throws IOException {
//        SqlSession session = getSession();
//        User user = session.selectOne("test.selectById", 3);
//        System.out.println(user);
//        session.close();
//    }
//
//    @Test
//    public void test2() throws IOException {
//        SqlSession session = getSession();
//        List<User> list = session.selectList("test.selectUsers");
//        list.forEach(li-> System.out.println(li));
//        session.close();
//    }
//
//    @Test
//    public void test3() throws IOException {
//        SqlSession session = getSession();
//        System.out.println("请输入用户名或手机号和密码: ");
//        Scanner sc = new Scanner(System.in);
//        String input = sc.next();
//        String password = sc.next();
//        User user = session.selectOne("test.selectByUsernameOrPhone",input);
//        if(user!=null){
//            if(password.equals(user.getPassword())){
//                System.out.println("登录成功");
//                return;
//            }else{
//                System.out.println("密码错误");
//            }
//            return;
//        }
//        System.out.println("没有这个用户");
//        session.close();
//    }
//
//    @Test
//    public void test4() throws IOException {
//        SqlSession session = getSession();
//        User user = new User();
//        System.out.println("请输入新的用户名: ");
//        Scanner sc = new Scanner(System.in);
//        String name = sc.next();
//        System.out.println("请输入要修改的id: ");
//        int id = sc.nextInt();
//        user.setName(name);
//        user.setId(id);
//        int i = session.update("test.updateById",user);
//        //增删改一定要提交事务
//        session.commit();
//        if(i>0){
//            System.out.println("修改成功");
//        }else{
//            System.out.println("修改失败");
//        }
//        session.close();
//    }
//
//    //类似修改一样增加或者删除数据，修改session的方法和数据
//    //@Test
//    //public void test5() throws IOException {
//    //    SqlSession session = getSession();
//    //    User user = new User();
//    //    user.setLoginName("1224085232@qq.com");
//    //    ...... set完所有user数据
//    //    int i = session.insert("test.insertUser",user);
//    //    //增删改一定要提交事务
//    //    session.commit();
//    //    if(i>0){
//    //        System.out.println("添加成功");
//    //    }else{
//    //        System.out.println("添加失败");
//    //    }
//    //    session.close();
//    //}
//
//    @Test
//    public void test6() throws IOException {
//        SqlSession session = getSession();
//        User user = new User();
//        Scanner sc = new Scanner(System.in);
//        System.out.println("请输入要删除的id: ");
//        int id = sc.nextInt();
//        user.setId(id);
//        int i = session.delete("test.deleteById",user);
//        //增删改一定要提交事务
//        session.commit();
//        if(i>0){
//            System.out.println("删除成功");
//        }else{
//            System.out.println("删除失败");
//        }
//        session.close();
//    }
//}
//
