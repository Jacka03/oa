package com.oa.pojo;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {

  private Integer id;
  private String loginname;
  private String password;
  private Integer status;
  private Date createDate;
  private String username;
  private String imgname;

  public User() {
  }
  public User(Integer id, String username, String password, String loginname, Integer status, String imgname) {
    this.id = id;
    this.loginname = loginname;
    this.password = password;
    this.status = status;
    this.username = username;
    this.imgname = imgname;
  }


  public User(String username, String password, String loginname, Integer status, String imgname) {
    this.loginname = loginname;
    this.password = password;
    this.status = status;
    this.username = username;
    this.imgname = imgname;
  }

  @Override
  public String toString() {
    return "User{" +
            "id=" + id +
            ", loginname='" + loginname + '\'' +
            ", password='" + password + '\'' +
            ", status='" + status + '\'' +
            ", createDate=" + createDate +
            ", username='" + username + '\'' +
            ", imgname='" + imgname + '\'' +
            '}';
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getLoginname() {
    return loginname;
  }

  public void setLoginname(String loginname) {
    this.loginname = loginname;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getImgname() {
    return imgname;
  }

  public void setImgname(String imgname) {
    this.imgname = imgname;
  }
}
