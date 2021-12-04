package com.wyu.controller;

import com.alibaba.fastjson.JSON;
import com.wyu.domain.Uploadfile;
import com.wyu.domain.User;
import com.wyu.service.UploadService;
import com.wyu.util.GetFilesUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UploadController {

    @Autowired
    private UploadService uploadService;

    String path = "D:\\upload";

    @RequestMapping("/upload.do")
    @ResponseBody
    public String uploadFile(MultipartFile file, HttpSession session) {
        String fileName = file.getOriginalFilename();
        System.out.println("上传文件的名称：" + fileName);
        //将得到的文件保存到本地，可以用io流，一般会用第三方插件
        //指定文件存放的路径
        //先判断文件夹是否存在，不存在要先创建一个文件夹
        File file1 = new File(path);
        if (!file1.exists()) {
            file1.mkdirs();
        }
        User user = (User) session.getAttribute("user");
        //文件名问题，要解决文件重名问题：获取当前时间戳
        String newFileName = System.currentTimeMillis() + "-" + user.getId() + "-" + fileName;
        Map<String, Object> map = new HashMap<>();
        map.put("code",500);
        if (file != null && !file.isEmpty()) {
            //说明文件不为空
            if (user != null) {
                try {
                    file.transferTo(new File(path + "//" + newFileName));
                    System.out.println("上传成功");
                    Uploadfile uploadFile = new Uploadfile();
                    uploadFile.setFilename(newFileName);
                    uploadFile.setUserid(user.getId());
                    uploadFile.setUploaddate(new Date());
                    int i = uploadService.insertFile(uploadFile);
                    if (i > 0) {
                        map.put("code", 200);
                    }
                } catch (IOException e) {
                    System.out.println("上传失败");
                    map.put("code", 500);
                    e.printStackTrace();
                }
            }
        }
        //返回数据给前端
        map.put("msg", "");
        map.put("data", newFileName);
        //构建json数据
        String json = JSON.toJSONString(map);
        return json;
    }


    @RequestMapping(value = "selectDownload.do",produces = "text/application;charset=UTF-8;")
    @ResponseBody
    public String selectDownload(){
        Map<String,Object> map = new HashMap<String, Object>(); //string,object再HashMap中可写可不写
        List<Uploadfile> list = uploadService.selectFiles();
        list.forEach(li-> System.out.println(li));
        map.put("code",0);
        map.put("msg",0);
        map.put("count",list.size());
        map.put("data",list);
        //构建json数据
        String json = JSON.toJSONString(map);
        System.out.println(json);
        GetFilesUtil.uploadfiles.clear();
        return json;
    }

    //处理下载时中文乱码的问题
    public String getFileName(HttpServletRequest request,String filename) throws Exception{
        System.out.println(filename);
        String[] IEBrowerKeyWord = {"MSIE","Trident","Edge"};
        String userAgent = request.getHeader("User-Agent");
        for (String Keyword : IEBrowerKeyWord){
            if (userAgent.contains(Keyword)){
                return URLEncoder.encode(filename,"UTF-8");
            }
        }
        return  new String(filename.getBytes("UTF-8"),"ISO-8859-1");
    }


    @RequestMapping("/download.do")
    @ResponseBody
    public ResponseEntity<byte[]> download(HttpServletRequest request,String filename){
        System.out.println("下载文件名为："+filename);
        File file = new File(path + "\\" +filename);
        System.out.println(file);
        try{
            filename = this.getFileName(request,filename);
        }catch (Exception exception){
            exception.printStackTrace();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment",filename);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        try {
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
        }catch (IOException e){
            e.printStackTrace();
        }
        return null;
    }
}
