package com.jeesite.modules.test.dao.facedatabase;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.facedatabase.FaceGroup;

import java.util.List;

@MyBatisDao
public interface FaceGroupDao extends CrudDao<FaceGroup> {
    List<FaceGroup> findList();
}
