package com.oa.dao;


import com.github.pagehelper.Page;
import com.oa.pojo.Document;

public interface DocumentDao {
    Page<Document> findAll(String filename);

    boolean deleteDocument(Integer id);

    boolean insert(Document document);

    Document queryDocumentById(Integer id);

    boolean update(Document document);

    // Integer insert(User user);
    //
    // User queryUserById(Integer userid);
    //
    // User queryUserByLoginnameAndPassword(@Param("loginname")String loginname, @Param("password")String password);
    //
    // Page<User> findAll(String name);
    //
    // Integer update(User user);
    //
    // Integer delete(Integer id);
}
