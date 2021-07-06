package com.jeesite.modules.test.service.facedatabase;

import com.jeesite.common.service.CrudService;
import com.jeesite.modules.file.utils.FileUploadUtils;
import com.jeesite.modules.test.dao.facedatabase.FacePictureDao;
import com.jeesite.modules.test.entity.facedatabase.FacePicture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FacePictureService extends CrudService<FacePictureDao, FacePicture> {
    @Autowired
    private FacePictureDao facePictureDao;
    @Override
    @Transactional(readOnly=false)
    public void save(FacePicture facePicture){
        super.save(facePicture);
    }

    @Transactional(readOnly=false)
    public void save(FacePicture facePicture, String bizType) {
        super.save(facePicture);
        // 保存上传图片
        FileUploadUtils.saveFileUpload(facePicture.getId(), bizType);
    }
    @Transactional(readOnly=false)
    public void update(FacePicture facePicture) {
        super.update(facePicture);
    }

    @Transactional(readOnly = false)
    public FacePicture findByFaceifoId(String faceinfoId){
        return facePictureDao.findByFaceId(faceinfoId);
    }

    @Transactional(readOnly = false)
    public FacePicture findByFacePictureId(String facePictureId){
        return facePictureDao.findByFacePictureId(facePictureId);
    }
}
