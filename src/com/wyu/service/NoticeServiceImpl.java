package com.wyu.service;

import com.wyu.domain.Dept;
import com.wyu.domain.DeptExample;
import com.wyu.domain.Notice;
import com.wyu.domain.NoticeExample;
import com.wyu.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> selectByTop5Notice() {
        List<Notice> notices = noticeMapper.selectByTop5Notice();
        return notices;
    }

    @Override
    public int addNotice(Notice notice) {
        int i = noticeMapper.insertSelective(notice);
        return i;
    }

    @Override
    public List<Notice> selectNotice() {
        List<Notice> notices = noticeMapper.selectByAllNotice();
        return notices;
    }

    @Override
    public int deleteByNid(int id) {
        int i = noticeMapper.deleteByPrimaryKey(id);
        return i;
    }

    @Override
    public int updateNotice(Notice notice) {
        int i = noticeMapper.updateByPrimaryKeySelective(notice);
        return i;
    }

    @Override
    public List<Notice> selectByWhereDept(Notice notice) {
        NoticeExample ne = new NoticeExample();
//        DeptExample.Criteria criteria = de.createCriteria();   可利用criteria更改各个搜索框的逻辑，以下注释可把符合所有搜索框条件的结果输出
        if(notice.getId()!=null&&notice.getId()!=0){
            ne.or().andIdEqualTo(notice.getId());
//            criteria.andDidEqualTo()
        }
        if (!"".equals(notice.getTitle())&&notice.getTitle()!=null){
            ne.or().andTitleLike("%"+notice.getTitle()+"%");
//            criteria.andDnameLike("%"+dept.getDname()+"%");
        }
        List<Notice> notices = noticeMapper.selectByExample(ne);
        return notices;
    }
}
