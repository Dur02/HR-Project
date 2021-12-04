package com.wyu.service;

import com.wyu.domain.Notice;

import java.util.List;

public interface NoticeService {
    List<Notice> selectByTop5Notice();

    int addNotice(Notice notice);

    List<Notice> selectNotice();

    int deleteByNid(int id);

    int updateNotice(Notice notice);

    List<Notice> selectByWhereDept(Notice notice);
}
