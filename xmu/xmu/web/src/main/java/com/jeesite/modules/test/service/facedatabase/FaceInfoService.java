package com.jeesite.modules.test.service.facedatabase;


import com.alibaba.fastjson.JSONObject;
import com.jeesite.common.service.CrudService;
import com.jeesite.modules.calresult.dao.CalresultDao;
import com.jeesite.modules.calresult.entity.Calresult;
import com.jeesite.modules.sys.utils.UserUtils;
import com.jeesite.modules.test.dao.ClientDao;
import com.jeesite.modules.test.dao.facedatabase.*;
import com.jeesite.modules.test.entity.*;
import com.jeesite.modules.test.entity.facedatabase.*;
import com.jeesite.modules.test.image.ImageToBase64;
import com.jeesite.modules.test.web.appApi.tool.SocketSingleton;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;


@Service
@Transactional(readOnly=true)
public class FaceInfoService extends CrudService<FaceInfoDao,FaceInfo> {

    @Autowired
    private AlterFaceInfoDao alterFaceInfoDao;
    @Autowired
    private FaceInfoDao faceInfoDao;
    @Autowired
    private AlterFeatureDao alterFeatureDao;
    @Autowired
    private FeatureDao featureDao;
    @Autowired
    private FacePictureDao facePictureDao;
    @Autowired
    private CalresultDao calresultDao;
    @Autowired
    private ClientDao clientDao;


    /*
    * 创建空的人脸信息，获取faceinfoID
    * 并创建特征和人脸图片信息，把faceinfoid放进去
    * 最后发送Socket
    * */
    @Transactional(readOnly=false)
    public void addBefore(FacePicture facePicture,String clientName) throws IOException {
        Client client=clientDao.findByName(clientName);
        if(client==null){
            client=new Client();
            client.setName(clientName);
            clientDao.insert(client);
        }
        FaceInfo faceInfo=new FaceInfo();
        faceInfo.setClientid(clientName);
        faceInfo.setIsalter(true);    //代表正在添加
        faceInfoDao.insert(faceInfo);
        Feature feature=new Feature();
        feature.setFaceInfoId(faceInfo.getId());
        featureDao.insert(feature);
        facePicture.setFaceinfoId(faceInfo.getId());
        facePictureDao.update(facePicture);
        sendData(facePicture.getFilepath(),faceInfo.getId(),facePicture.getId(),transition("faceinfoAdd"));
    }
    @Transactional(readOnly=false)
    public void updateBefore(String faceInfoId,FacePicture facePicture) throws IOException {
        facePictureDao.update(facePicture);
        FaceInfo faceInfo=faceInfoDao.findById(faceInfoId);
        faceInfo.setIsalter(true);
        faceInfoDao.update(faceInfo);
        sendData(facePicture.getFilepath(),faceInfoId,facePicture.getId(),transition("faceinfoUpdate"));
    }

    @Transactional(readOnly = false)
    public Calresult transition(String type){
        Calresult calresult=new Calresult();
        calresult.setStartTime(new Date());
        calresult.setOperateType(type);
        calresult.setResult("operating");
        calresult.setOperateUserID(UserUtils.getUser().getId());
        calresultDao.insert(calresult);
        return calresult;
    }

    @Transactional(readOnly=false)
    public void sendData(String filepath,String faceInfoId, String facePictureId,Calresult calresult) throws IOException {
        ImageToBase64 imageToBase64=new ImageToBase64();
        String picturedata=imageToBase64.ImageToBase64("C:\\jeesite"+filepath);
        JSONObject object = new JSONObject();
        JSONObject object1 = new JSONObject();
        object.put("calresultid",calresult.getId());
        object.put("operateType",calresult.getOperateType());
        object.put("faceinfoid",faceInfoId);
        object1.put("facepictureid",facePictureId);
        object1.put("data",picturedata);
        object.put("picturedata",object1);
        Thread thread = new Thread(){
            public void run(){
                try {
                    SocketSingleton socketSingleton=SocketSingleton.getInstance();
                    socketSingleton.accept();
                    socketSingleton.addMsg(object.toJSONString());
                    socketSingleton.send();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        };
        thread.start();
    }

    @Transactional(readOnly=false)
    public void faceCharacterCheck(ReceiveData receiveData) throws ParseException {
        Calresult calresult=calresultDao.findById(receiveData.getCalresultid());
        FacePicture facePicture=facePictureDao.findByFacePictureId(receiveData.getFacepictureid());
        if(calresult.getOperateType().equals(receiveData.getOperatetype())){
            //SimpleDateFormat format=new SimpleDateFormat("yyyy-mm-dd  HH:mm:ss");
            calresult.setFinishTime(new Date());
            calresult.setResult(receiveData.getResult());
            /*calresult.setContext("age: "+receiveData.getAge()+"\n"+"expression: "+receiveData.getExpression()+"\n"+
                    "gender: "+receiveData.getGender()+"\n"+"glasses: "+receiveData.getGlasses()+"\n"+
                    "race: "+receiveData.getRace()+"\n"+"threshold: "+receiveData.getThreshold());*/
            JSONObject object = new JSONObject();
            object.put("centerx",receiveData.getFaceinfo().getCenterx());
            object.put("centery",receiveData.getFaceinfo().getCentery());
            object.put("width",receiveData.getFaceinfo().getWidth());
            object.put("height",receiveData.getFaceinfo().getHeight());
            object.put("angle",receiveData.getFaceinfo().getAngle());
            object.put("score",receiveData.getFaceinfo().getScore());
            object.put("yaw",receiveData.getFaceinfo().getYaw());
            object.put("roll",receiveData.getFaceinfo().getRoll());
            object.put("pitch",receiveData.getFaceinfo().getPitch());
            object.put("bluriness",receiveData.getFaceinfo().getBluriness());
            object.put("illum",receiveData.getFaceinfo().getIllum());
            object.put("age",receiveData.getFaceinfo().getAge());
            object.put("mouthclose",receiveData.getFaceinfo().getMouthclose());
            object.put("lefteyeclose",receiveData.getFaceinfo().getLefteyeclose());
            object.put("righteyeclose",receiveData.getFaceinfo().getRighteyeclose());
            object.put("occlusion",receiveData.getFaceinfo().getOcclusion());
            object.put("race",receiveData.getFaceinfo().getRace());
            object.put("glasses",receiveData.getFaceinfo().getGlasses());
            object.put("gender",receiveData.getFaceinfo().getGender());
            object.put("expression",receiveData.getExpression());
            object.put("feature",receiveData.getFeature());
            if(facePicture==null){
                object.put("picturepath","");
            }
            else{
                String[] file=new String[1];
                file[0]= facePicture.getFilepath();
                object.put("picturepath",file);
            }
            calresult.setContext(object.toJSONString());
            calresultDao.update(calresult);
        }
    }
    @Transactional(readOnly=false)
    public void faceCharacterCheckFail(ReceiveData receiveData) throws ParseException {
        Calresult calresult=calresultDao.findById(receiveData.getCalresultid());
        FacePicture facePicture=facePictureDao.findByFacePictureId(receiveData.getFacepictureid());
        if(calresult.getOperateType().equals(receiveData.getOperatetype())){
            JSONObject object = new JSONObject();
            if(facePicture!=null){
                String[] file=new String[1];
                file[0]= facePicture.getFilepath();
                object.put("picturepath",file);
            }
            else{
                object.put("picturepath","");
            }
            calresult.setFinishTime(new Date());
            calresult.setResult(receiveData.getResult());
            calresult.setContext(object.toJSONString());
            calresultDao.update(calresult);
        }
    }



    @Transactional(readOnly=false)
    public void isBiopsy(ReceiveData receiveData) throws ParseException {
        Calresult calresult=calresultDao.findById(receiveData.getCalresultid());
        if(calresult.getOperateType().equals(receiveData.getOperatetype())){
            //SimpleDateFormat format=new SimpleDateFormat("yyyy-mm-dd  HH:mm:ss");
            calresult.setFinishTime(new Date());
            calresult.setResult(receiveData.getResult());
            JSONObject object = new JSONObject();
            FacePicture facePicture=facePictureDao.findByFacePictureId(receiveData.getFacepictureid());
            if(facePicture==null)
                object.put("picturepath","");
            else{
                String[] file=new String[1];
                file[0]= facePicture.getFilepath();
                object.put("picturepath",file);
            }
            object.put("isbiopsy",receiveData.getContext());
            calresult.setContext(object.toJSONString());
            calresultDao.update(calresult);
        }
    }

    @Transactional(readOnly=false)
    public void add(ReceiveData receiveData) throws IOException, ParseException {
        Calresult calresult=calresultDao.findById(receiveData.getCalresultid());
        FacePicture facePicture=facePictureDao.findByFacePictureId(receiveData.getFacepictureid());
        if(calresult.getOperateType().equals(receiveData.getOperatetype())){
            calresult.setFinishTime(new Date());
            calresult.setResult(receiveData.getResult());
            JSONObject object = new JSONObject();
            if(facePicture==null){
                object.put("picturepath","");
            }
            else{
                String[] file=new String[1];
                file[0]= facePicture.getFilepath();
                object.put("picturepath",file);
            }
            calresult.setContext(object.toJSONString());
            calresultDao.update(calresult);
            if(receiveData.getResult().equals("fail")){
                faceInfoDao.delete(receiveData.getFaceinfoid());
                featureDao.deleteByFaceId(receiveData.getFaceinfoid());
                facePictureDao.deleteByFaceId(receiveData.getFaceinfoid());
            }else {
                receiveData.getFaceinfo().setIsalter(false);
                faceInfoDao.update(receiveData.getFaceinfo());
                BASE64Decoder decoder = new BASE64Decoder();
                Feature feature=featureDao.findByFaceId(receiveData.getFaceinfoid());
                feature.setFeature(decoder.decodeBuffer(receiveData.getFeature()));
                featureDao.update(feature);
                synchronizeDatabase(receiveData.getFaceinfo(),feature,"create");
            }
        }

    }


    @Transactional(readOnly=false)
    public void update(ReceiveData receiveData) throws IOException, ParseException {
        Calresult calresult=calresultDao.findById(receiveData.getCalresultid());
        FacePicture facePicture=facePictureDao.findByFacePictureId(receiveData.getFacepictureid());
        if(calresult.getOperateType().equals(receiveData.getOperatetype())) {
            calresult.setFinishTime(new Date());
            calresult.setResult(receiveData.getResult());
            calresult.setContext(receiveData.getContext());
            JSONObject object = new JSONObject();
            if(facePicture==null){
                object.put("picturepath","");
            }
            else{
                String[] file=new String[1];
                file[0]= facePicture.getFilepath();
                object.put("picturepath",file);
            }
            calresult.setContext(object.toJSONString());
            calresultDao.update(calresult);
            if(receiveData.getResult().equals("fail")){
                FaceInfo faceInfo=faceInfoDao.findById(receiveData.getFaceinfoid());
                faceInfo.setIsalter(false);
                faceInfoDao.update(faceInfo);
            }else {
                receiveData.getFaceinfo().setIsalter(false);
                faceInfoDao.update(receiveData.getFaceinfo());
                BASE64Decoder decoder = new BASE64Decoder();
                Feature feature=featureDao.findByFaceId(receiveData.getFaceinfoid());
                feature.setFeature(decoder.decodeBuffer(receiveData.getFeature()));
                featureDao.update(feature);
                synchronizeDatabase(receiveData.getFaceinfo(), feature, "update");
            }
        }
    }


    @Transactional(readOnly=false)
    public void delete(String id) {
        synchronizeDatabase(faceInfoDao.findById(id),featureDao.findByFaceId(id),"delete");
        faceInfoDao.delete(faceInfoDao.findById(id));
        featureDao.delete(featureDao.findByFaceId(id));
        facePictureDao.delete(facePictureDao.findByFaceId(id));
    }

    public List<Face> findList(){
        List<FaceInfo> faceInfoList=faceInfoDao.findList();
        List<Face> faceList=new ArrayList<>();
        for (FaceInfo faceInfo:faceInfoList) {
            Face face=new Face();
            face.setId(faceInfo.getId());
            face.setCenterX(faceInfo.getCenterx());
            face.setCenterY(faceInfo.getCentery());
            face.setWidth(faceInfo.getWidth());
            face.setHeight(faceInfo.getHeight());
            face.setAngle(faceInfo.getAngle());
            face.setScore(faceInfo.getScore());
            face.setYaw(faceInfo.getYaw());
            face.setRoll(faceInfo.getRoll());
            face.setPitch(faceInfo.getPitch());
            face.setBluriness(faceInfo.getBluriness());
            face.setIllum(faceInfo.getIllum());
            face.setAge(faceInfo.getAge());
            face.setMouthclose(faceInfo.getMouthclose());
            face.setLeftEyeclose(faceInfo.getLefteyeclose());
            face.setRightEyeclose(faceInfo.getRighteyeclose());
            face.setOcclusion(faceInfo.getOcclusion());
            face.setRace(faceInfo.getRace());
            face.setGlasses(faceInfo.getGlasses());
            face.setGender(faceInfo.getGender());
            //face.setClientName(faceInfo.getClientid());
            face.setAlter(faceInfo.isIsalter());
            face.setFeature(featureDao.findByFaceId(faceInfo.getId()).getFeature());
            face.setFilepath(facePictureDao.findByFaceId(faceInfo.getId()).getFilepath());
            faceList.add(face);
        }
        return faceList;
    }


    @Transactional(readOnly=false)
    public void synchronizeDatabase(FaceInfo faceInfo, Feature feature, String type){
        AlterFaceInfo alterFaceInfo=new AlterFaceInfo();
        alterFaceInfo.setAlterTime(new Date());
        alterFaceInfo.setFaceInfoId(faceInfo.getId());
        alterFaceInfo.setAlterType(type);
        alterFaceInfo.setCenterX(faceInfo.getCenterx());
        alterFaceInfo.setCenterY(faceInfo.getCentery());
        alterFaceInfo.setWidth(faceInfo.getWidth());
        alterFaceInfo.setHeight(faceInfo.getHeight());
        alterFaceInfo.setAngle(faceInfo.getAngle());
        alterFaceInfo.setScore(faceInfo.getScore());
        alterFaceInfo.setYaw(faceInfo.getYaw());
        alterFaceInfo.setRoll(faceInfo.getRoll());
        alterFaceInfo.setPitch(faceInfo.getPitch());
        alterFaceInfo.setBluriness(faceInfo.getBluriness());
        alterFaceInfo.setIllum(faceInfo.getIllum());
        alterFaceInfo.setAge(faceInfo.getAge());
        alterFaceInfo.setMouthclose(faceInfo.getMouthclose());
        alterFaceInfo.setLeftEyeclose(faceInfo.getLefteyeclose());
        alterFaceInfo.setRightEyeclose(faceInfo.getRighteyeclose());
        alterFaceInfo.setOcclusion(faceInfo.getOcclusion());
        alterFaceInfo.setRace(faceInfo.getRace());
        alterFaceInfo.setGalsses(faceInfo.getGlasses());
        alterFaceInfo.setGender(faceInfo.getGender());
        alterFaceInfoDao.insert(alterFaceInfo);

        AlterFeature alterFeature=new AlterFeature();
        alterFeature.setAlterTime(new Date());
        alterFeature.setAlterType(type);
        alterFeature.setFeatureId(feature.getId());
        alterFeature.setFeature(feature.getFeature());
        alterFeatureDao.insert(alterFeature);
    }

    public FaceInfo findById(String id){
        return faceInfoDao.findById(id);
    }

    @Transactional(readOnly=false)
    public void update(FaceInfo faceInfo){
        faceInfoDao.update(faceInfo);
    }

    @Transactional
    public void editClient(String id,String clientName){
        FaceInfo faceInfo=faceInfoDao.findById(id);
        Client client=clientDao.findByName(faceInfo.getClientid());
        if(client==null){
            client=new Client();
            client.setName(clientName);
            clientDao.insert(client);
        }
        faceInfo.setClientid(clientName);
        faceInfoDao.update(faceInfo);
    }

}
