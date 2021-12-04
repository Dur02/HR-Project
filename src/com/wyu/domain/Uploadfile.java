package com.wyu.domain;

import java.util.Date;

public class Uploadfile {
    private Integer id;

    private Integer userid;

    private String filename;

    private Date uploaddate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public Date getUploaddate() {
        return uploaddate;
    }

    public void setUploaddate(Date uploaddate) {
        this.uploaddate = uploaddate;
    }

    @Override
    public String toString() {
        return "Uploadfile{" +
                "id=" + id +
                ", userid=" + userid +
                ", filename='" + filename + '\'' +
                ", uploaddate=" + uploaddate +
                '}';
    }
}