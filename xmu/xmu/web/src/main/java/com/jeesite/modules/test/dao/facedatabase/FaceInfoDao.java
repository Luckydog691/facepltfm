package com.jeesite.modules.test.dao.facedatabase;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.facedatabase.FaceInfo;

import java.util.List;


@MyBatisDao
public interface FaceInfoDao extends CrudDao<FaceInfo> {
    List<FaceInfo> findList();
    void delete(String id);
    FaceInfo findById(String id);
    List<FaceInfo> findByClientName(String name);
}
