package com.wyu.util;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.wyu.domain.Uploadfile;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GetFilesUtil {
    public static List<Uploadfile> uploadfiles = new ArrayList<>();

    public static List<Uploadfile> getFile(String path){
        //获得指定文件对象
        File file = new File(path);
        //获得该文件夹内的所有文件
        File[] array = file.listFiles();
        for(int i=0;i<array.length;i++){
            //如果是文件
            if (array[i].isFile()){
                Uploadfile uploadfile = new Uploadfile();
                //将得到的文件的文件名添加到集合中去
                //array[i].getName() 获取文件名
                String[] split = array[i].getName().split("-");  //通过-获取文件名字，得到一个数组
                try{
                    //从文件名中获取到的时间戳转换成时间
                    Long time = Long.parseLong(split[0]);
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String d = format.format(time);
                    Date createdate = format.parse(d);

                    //将得到的所有信息封装到对象中Uploadfile
                    uploadfile.setUploaddate(createdate);
                    uploadfile.setUserid(Integer.parseInt(split[1]));
                    uploadfile.setFilename(array[i].getName());
                    //将封装好的对象封装到集合中
                    uploadfiles.add(uploadfile);
                }catch (ParseException e){
                    e.printStackTrace();
                }catch (NumberFormatException e){
                    e.printStackTrace();
                }
            }else if(array[i].isDirectory()){  //如果是文件夹，递归
                getFile(array[i].getPath());
            }
        }
        return uploadfiles;
    }
}
