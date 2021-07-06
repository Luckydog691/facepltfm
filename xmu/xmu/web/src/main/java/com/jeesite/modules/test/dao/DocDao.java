package com.jeesite.modules.test.dao;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.Doc;

import java.util.List;


@MyBatisDao
public interface DocDao  extends CrudDao<Doc> {
    public List<Doc> findList();
}
