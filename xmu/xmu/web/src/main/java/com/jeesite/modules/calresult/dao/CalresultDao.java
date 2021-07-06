package com.jeesite.modules.calresult.dao;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.calresult.entity.Calresult;

import java.util.List;

@MyBatisDao
public interface CalresultDao extends CrudDao<Calresult> {
    public Calresult findById(String id);
    public List<Calresult> findList();
}
