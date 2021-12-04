package com.wyu.service;

import com.wyu.domain.Uploadfile;

import java.util.List;

public interface UploadService {

    //添加文件名到数据库
    int insertFile(Uploadfile uploadFile);

    //去文件夹中查询出所有的文件
    List<Uploadfile> selectFiles();

}
