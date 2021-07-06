package com.jeesite.modules.test.service;

import com.jeesite.common.service.CrudService;
import com.jeesite.modules.file.utils.FileUploadUtils;
import com.jeesite.modules.test.dao.DocDao;
import com.jeesite.modules.test.dao.FaceSearchDataDao;
import com.jeesite.modules.test.entity.Doc;
import com.jeesite.modules.test.entity.FaceSearchData;
import com.jeesite.modules.test.entity.TestData;
import com.jeesite.modules.test.entity.TestDataChild;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DocService extends CrudService<DocDao, Doc> {

    @Autowired
    private DocDao docDao;

    @Override
    public Doc get(Doc doc) {
        Doc entity = super.get(doc);
        return entity;
    }

    @Transactional(readOnly=false)
    public void save(Doc doc, String bizType) {
        super.save(doc);
        // 保存上传图片
        FileUploadUtils.saveFileUpload(doc.getId(), bizType);
    }

    @Transactional(readOnly=false)
    public List<Doc> findList() {
        return docDao.findList();
    }
}
