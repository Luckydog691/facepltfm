package com.jeesite.modules.test.dao;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.ClientGroup;

import java.util.List;

@MyBatisDao
public interface ClientGroupDao extends CrudDao<ClientGroup> {
    List<ClientGroup> findList();
}
