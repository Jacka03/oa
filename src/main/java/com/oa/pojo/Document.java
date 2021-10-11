package com.oa.pojo;

import java.io.Serializable;


public class Document implements Serializable {
    private Integer id;
    private String filename;
    private String remark;
    private String createDate;
    private String uploader;

    public Document() {

    }

    @Override
    public String toString() {
        return "Document{" +
                "id=" + id +
                ", filename='" + filename + '\'' +
                ", remark='" + remark + '\'' +
                ", createDate=" + createDate +
                ", uploader='" + uploader + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }
}
