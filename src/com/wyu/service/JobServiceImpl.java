package com.wyu.service;

import com.alibaba.fastjson.JSON;
import com.wyu.domain.Dept;
import com.wyu.domain.DeptExample;
import com.wyu.domain.Job;
import com.wyu.domain.JobExample;
import com.wyu.mapper.JobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService{

    @Autowired
    private JobMapper jobMapper;

    @Override
    public List<Job> selectJob() {
        JobExample example = new JobExample();
        return  jobMapper.selectByExample(example);
    }

    @Override
    public int deleteByJid(int jid) {
        int i = jobMapper.deleteByPrimaryKey(jid);
        return i;
    }

    @Override
    public int updateUser(Job job) {
        //修改数据
        int i = jobMapper.updateByPrimaryKeySelective(job);
        return i;
    }

    @Override
    public List<Job> selectByWhereJob(Job job) {
        JobExample je = new JobExample();
        if(job.getJid()!=null&&job.getJid()!=0){
            je.or().andJidEqualTo(job.getJid());
        }
        if (!"".equals(job.getJname())&&job.getJname()!=null){
            je.or().andJnameLike("%"+job.getJname()+"%");
        }
        List<Job> jobs = jobMapper.selectByExample(je);
        return jobs;
    }

    @Override
    public int jobCheck(String jname) {
        JobExample example = new JobExample();
        JobExample.Criteria criteria = example.createCriteria();
        criteria.andJnameEqualTo(jname);
        List<Job> jobs = jobMapper.selectByExample(example);
        if(jobs!=null&&jobs.size()>0){
            return 1;
        }
        return 0;
    }

    @Override
    public int addJob(String json) {
        Job job = JSON.parseObject(json,Job.class);
        System.out.println("dept对象："+job);
        int i =jobMapper.insertSelective(job);
        return i;
    }
}
