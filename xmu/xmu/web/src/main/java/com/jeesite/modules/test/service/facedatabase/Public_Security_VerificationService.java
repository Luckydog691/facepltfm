package com.jeesite.modules.test.service.facedatabase;

import com.jeesite.common.service.CrudService;
import com.jeesite.modules.test.dao.facedatabase.Public_Security_VerificationDao;
import com.jeesite.modules.test.entity.facedatabase.Public_Security_Verification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class Public_Security_VerificationService extends CrudService<Public_Security_VerificationDao, Public_Security_Verification> {
    @Autowired
    private Public_Security_VerificationDao public_security_verificationDao;

    @Transactional(readOnly = false)
    public Public_Security_Verification findByIdAndName(String userId,String userName){
        return public_security_verificationDao.findByIdAndName(userId,userName);
    }

    @Transactional(readOnly = false)
    public Public_Security_Verification findById(String id){
        return public_security_verificationDao.findById(id);
    }
}
