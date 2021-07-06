package com.jeesite.modules.test.service.facedatabase;

import com.jeesite.common.service.CrudService;
import com.jeesite.modules.test.dao.facedatabase.FaceGroupDao;
import com.jeesite.modules.test.entity.facedatabase.FaceGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class FaceGroupService extends CrudService<FaceGroupDao, FaceGroup> {

    @Autowired
    private FaceGroupDao faceGroupDao;

    @Transactional(readOnly=false)
    public List<FaceGroup> findGroups(){
        return faceGroupDao.findList();
        }
}
