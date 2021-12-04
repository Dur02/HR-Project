package com.wyu.util;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import cn.hutool.captcha.generator.RandomGenerator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CheckCodeUtil")
public class CheckCodeUtil extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 自定义纯数字的验证码（随机4位数字，可重复）
        RandomGenerator randomGenerator = new RandomGenerator("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 4);
        //定义验证码的长和宽，码和干扰物的个数
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(200, 100,4,30);
        lineCaptcha.setGenerator(randomGenerator);

        //将验证码保存到session中，提供后面验证
        HttpSession session = request.getSession();
        System.out.println(lineCaptcha.getCode());
        session.setAttribute("code",lineCaptcha.getCode());

        // 重新生成code，写出到流中，也可以写入文件中
        lineCaptcha.write(response.getOutputStream());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
