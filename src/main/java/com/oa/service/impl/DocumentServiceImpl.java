package com.oa.service.impl;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.oa.dao.DocumentDao;
import com.oa.pojo.Document;
import com.oa.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImpl implements DocumentService {


    @Autowired
    private DocumentDao documentDao;

    @Override
    public Page<Document> queryDocument(Integer curPageNumber, Integer pageSize, String filename) {
        PageHelper.startPage(curPageNumber, pageSize);
        Page<Document> page = documentDao.findAll(filename);
        return page;
    }

    @Override
    public boolean deleteDocument(Integer id) {


        return documentDao.deleteDocument(id);
    }

    @Override
    public boolean addDocument(Document document) {
        return documentDao.insert(document);
    }

    @Override
    public Document queryDocumentById(Integer id) {
        return documentDao.queryDocumentById(id);
    }

    @Override
    public boolean updateDocument(Document document) {
        return documentDao.update(document);

    }
}
