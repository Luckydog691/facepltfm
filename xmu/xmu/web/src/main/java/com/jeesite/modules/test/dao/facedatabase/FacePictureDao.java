package com.jeesite.modules.test.dao.facedatabase;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;

import com.jeesite.modules.test.entity.facedatabase.FacePicture;

@MyBatisDao
public interface FacePictureDao extends CrudDao<FacePicture> {
    public FacePicture findByFaceId(String faceinfoId);
    public FacePicture findByFacePictureId(String facePictureId);
    public void deleteByFaceId(String id);
}
