package com.oa.service;


import com.github.pagehelper.Page;
import com.oa.pojo.Document;

public interface DocumentService {
    Page<Document> queryDocument(Integer curPageNumber, Integer pageSize, String filename);

    boolean deleteDocument(Integer id);

    boolean addDocument(Document document);

    Document queryDocumentById(Integer id);

    boolean updateDocument(Document document);

    // public boolean addUser(User user);
    //
    // public User queryUserById(Integer userid);
    //
    // public Page<User> queryUser(Integer curPageNumber, Integer pageSize, String name);
    //
    // public User login(String loginname, String password);
    //
    //
    // boolean updateUser(User user);
    //
    // boolean deleteUser(Integer id);
}
