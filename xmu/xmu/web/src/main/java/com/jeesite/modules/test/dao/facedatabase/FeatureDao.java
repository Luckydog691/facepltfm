package com.jeesite.modules.test.dao.facedatabase;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.facedatabase.Feature;

import java.util.List;

@MyBatisDao
public interface FeatureDao extends CrudDao<Feature> {
    public Feature findByFaceId(String faceId);
    public Feature findByFeatureId(String id);
    public void delete(String id);
    public void deleteByFaceId(String id);
}

