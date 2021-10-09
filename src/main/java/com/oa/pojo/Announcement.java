package com.oa.pojo;

import java.io.Serializable;
import java.sql.Date;

public class Announcement implements Serializable {

    private Integer id;
    private String title;
    private String content;
    private Date createTime;
    private Integer uid;

    private User user;

    public Announcement() {
    }

    public Announcement(Integer id, String title, String content, Date createTime, Integer uid) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createTime = createTime;
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createData=" + createTime +
                ", uid=" + uid +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
