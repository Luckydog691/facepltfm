package com.jeesite.modules.test.dao;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.entity.Page;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.Client;
import com.jeesite.modules.test.entity.Face;
import com.jeesite.modules.test.entity.facedatabase.FaceInfo;
import io.lettuce.core.dynamic.annotation.Param;

import java.util.List;

@MyBatisDao
public interface ClientDao extends CrudDao<Client> {
    List<Client> findList();
    Client findByName(String name);
    List<FaceInfo> findFaceById(String Id);
    Client findClientById(String Id);
}
