package com.jeesite.modules.test.service;

import com.jeesite.common.service.CrudService;
import com.jeesite.modules.calresult.dao.CalresultDao;
import com.jeesite.modules.calresult.entity.Calresult;
import com.jeesite.modules.calresult.service.CalresultService;
import com.jeesite.modules.file.utils.FileUploadUtils;
import com.jeesite.modules.sys.utils.UserUtils;
import com.jeesite.modules.test.dao.FaceSearchDataDao;
import com.jeesite.modules.test.entity.FaceSearchData;
import com.jeesite.modules.test.entity.facedatabase.FacePicture;
import com.jeesite.modules.test.image.ImageToBase64;
import com.jeesite.modules.test.web.appApi.tool.SocketSingleton;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class FaceSearchDataService extends CrudService<FaceSearchDataDao, FaceSearchData>
{
    @Autowired
    private FaceSearchDataDao faceSearchDataDao;

    @Autowired
    private CalresultDao calresultDao;


    @Transactional(readOnly=false)
    public void save(FaceSearchData fsData,String bizType) {
        super.save(fsData);
        // 保存上传图片
        FileUploadUtils.saveFileUpload(fsData.getId(), bizType);

    }

    @Transactional(readOnly=false)
    public void saveTest(FaceSearchData fsData,String bizType) {
        faceSearchDataDao.updateFsdata(fsData);
        // 保存上传图片
        FileUploadUtils.saveFileUpload(fsData.getId(), bizType);

    }

    @Transactional(readOnly = false)
    public void sendData(FacePicture facePicture, List<FacePicture> facePictureList) throws IOException {
        JSONObject object = new JSONObject();
        JSONObject object1 = new JSONObject();
        List<JSONObject> objectList=new ArrayList<>();
        String path="C:/jeesite"+facePicture.getFilepath();
        System.out.println(path);
        ImageToBase64 imageToBase64=new ImageToBase64();
        String base64image =imageToBase64.ImageToBase64(path);
        object1.put("facepictureid",facePicture.getId());
        object1.put("data",base64image);

        for(FacePicture facePicture1:facePictureList){
            JSONObject object2 = new JSONObject();
            object2.put("facepictureid",facePicture1.getId());
            object2.put("data",imageToBase64.ImageToBase64("C:/jeesite"+facePicture1.getFilepath()));
            objectList.add(object2);
        }
        Calresult calresult=new Calresult();
        calresult.setStartTime(new Date());
        calresult.setOperateType("1:n");
        calresult.setOperateUserID(UserUtils.getUser().getId());
        calresult.setResult("operating");
        calresultDao.insert(calresult);
        object.put("calresultid",calresult.getId());
        object.put("operateType","1:n");
        object.put("picturedata",object1);
        object.put("picturegroup",objectList);
       // System.out.println(object);
        //传给app
        SocketSingleton socketSingleton=SocketSingleton.getInstance();
        socketSingleton.accept();
        socketSingleton.addMsg(object.toJSONString());
        socketSingleton.send();
    }
}
