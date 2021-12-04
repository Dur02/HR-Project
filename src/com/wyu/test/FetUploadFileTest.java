package com.wyu.test;

import com.wyu.domain.Uploadfile;
import com.wyu.util.GetFilesUtil;

import java.util.List;

public class FetUploadFileTest {
    public static void main(String[] args){
        List<Uploadfile> file = GetFilesUtil.getFile("D://upload");
        file.forEach(li-> System.out.println(li));
    }
}
