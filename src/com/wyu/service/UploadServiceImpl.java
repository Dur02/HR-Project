package com.wyu.service;

import com.wyu.domain.Uploadfile;
import com.wyu.mapper.UploadfileMapper;
import com.wyu.util.GetFilesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UploadServiceImpl implements UploadService{

    @Autowired
    private UploadfileMapper uploadfileMapper;

    @Override
    public int insertFile(Uploadfile uploadFile) {
        return uploadfileMapper.insertSelective(uploadFile);
    }

    @Override
    public List<Uploadfile> selectFiles() {

        //用工具类完成查询
        List<Uploadfile> file = GetFilesUtil.getFile("D://upload");
        file.forEach(li-> System.out.println(li));
        return file;
    }
}
