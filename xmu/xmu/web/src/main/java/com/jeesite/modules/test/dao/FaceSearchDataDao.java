package com.jeesite.modules.test.dao;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.FaceSearchData;

@MyBatisDao
public interface FaceSearchDataDao extends CrudDao<FaceSearchData> {
    public void updateFsdata (FaceSearchData fsData);
}
