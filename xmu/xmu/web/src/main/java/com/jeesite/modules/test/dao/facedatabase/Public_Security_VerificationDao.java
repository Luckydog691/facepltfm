package com.jeesite.modules.test.dao.facedatabase;

import com.jeesite.common.dao.CrudDao;
import com.jeesite.common.mybatis.annotation.MyBatisDao;
import com.jeesite.modules.test.entity.facedatabase.Public_Security_Verification;

@MyBatisDao
public interface Public_Security_VerificationDao extends CrudDao<Public_Security_Verification> {
    Public_Security_Verification findByIdAndName(String userId,String userName);
    Public_Security_Verification findById(String Id);
}
