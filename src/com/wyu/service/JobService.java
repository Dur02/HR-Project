package com.wyu.service;

import com.wyu.domain.Job;
import com.wyu.domain.User;

import java.util.List;

public interface JobService {
    List<Job> selectJob();

    int deleteByJid(int jid);

    int updateUser(Job job);

    List<Job> selectByWhereJob(Job job);

    int jobCheck(String jname);

    int addJob(String json);
}
