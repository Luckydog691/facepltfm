package com.jeesite.modules.test.dao.facedatabase;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.facedatabase.Faceinfo_Facegroup;

import java.util.List;

@MyBatisDao
public interface Faceinfo_FacegroupDao extends CrudDao<Faceinfo_Facegroup> {
    public List<Faceinfo_Facegroup> findByGroupId(int groupId);
}
