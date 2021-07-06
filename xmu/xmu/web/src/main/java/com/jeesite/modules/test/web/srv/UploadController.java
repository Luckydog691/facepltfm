package com.jeesite.modules.test.web.srv;

import com.alibaba.fastjson.JSONObject;
import com.jeesite.common.config.Global;
import com.jeesite.common.io.FileUtils;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.calresult.entity.Calresult;
import com.jeesite.modules.calresult.service.CalresultService;
import com.jeesite.modules.file.entity.FileUpload;
import com.jeesite.modules.file.utils.FileUploadUtils;
import com.jeesite.modules.sys.utils.UserUtils;
import com.jeesite.modules.test.entity.*;
import com.jeesite.modules.test.entity.facedatabase.FacePicture;
import com.jeesite.modules.test.entity.facedatabase.Faceinfo_Facegroup;
import com.jeesite.modules.test.entity.facedatabase.Public_Security_Verification;
import com.jeesite.modules.test.image.ImageToBase64;
import com.jeesite.modules.test.service.FaceSearchDataService;
import com.jeesite.modules.test.service.TestDataService;
import com.jeesite.modules.test.service.VideoService;
import com.jeesite.modules.test.service.facedatabase.FacePictureService;
import com.jeesite.modules.test.service.facedatabase.Faceinfo_FacegroupService;
import com.jeesite.modules.test.service.facedatabase.Public_Security_VerificationService;
import com.jeesite.modules.test.web.appApi.tool.SocketSingleton;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping(value = "${adminPath}/srv")
public class UploadController extends BaseController {

    @Autowired
    private FaceSearchDataService faceSearchDataService;

    @Autowired
    private FacePictureService facePictureService;

    @Autowired
    private Faceinfo_FacegroupService faceinfo_facegroupService;

    @Autowired
    private Public_Security_VerificationService public_security_verificationService;

    @Autowired
    private CalresultService calresultService;

    @Autowired
    private VideoService videoService;

    //人脸库1:N搜索
    @RequestMapping(value = {"faceSearch/commit_single"})
    public String faceSearch(FaceSearchData fsData, Model model) throws IOException {
        faceSearchDataService.save(fsData,"FaceSearch_image");
        System.out.println(fsData.getTestSelect());
        List<FileUpload> fileUploads=FileUploadUtils.findFileUpload(fsData.getId(), "FaceSearch_image");
        for (FileUpload fUpload : fileUploads) {
            FacePicture facePicture = new FacePicture();
            facePicture.setFilename(fUpload.getFileName());
            facePicture.setFilepath(fUpload.getFileUrl());
            facePicture.setFaceinfoId(fUpload.getBizKey());
            facePictureService.save(facePicture);
        }

        FacePicture facePicture=facePictureService.findByFaceifoId(fsData.getId());
        List<String> faceinfoIdlist=faceinfo_facegroupService.findByGroupId(Integer.parseInt(fsData.getTestSelect()));
        List<FacePicture> facePictures=new ArrayList<>();
        for(String faceinfoId:faceinfoIdlist){
            facePictures.add(facePictureService.findByFaceifoId(faceinfoId));
        }


        faceSearchDataService.sendData(facePicture,facePictures);
        List<Calresult> calresult=calresultService.findList();
        model.addAttribute("calresult",calresult);

        return "modules/srv/calresult/calresultList";
    }

    //上传图片1：N搜索
    @RequestMapping(value = {"faceSearch/commit_mult"})
    public String faceProp(FaceSearchData fsdata, Model model) throws IOException {
        faceSearchDataService.save(fsdata,"single_image");
        faceSearchDataService.saveTest(fsdata,"FaceSearch_image");
        List<FileUpload> fileUploads1=FileUploadUtils.findFileUpload(fsdata.getId(), "single_image");
        for (FileUpload fUpload : fileUploads1) {
            FacePicture facePicture = new FacePicture();
            facePicture.setFilename(fUpload.getFileName());
            facePicture.setFilepath(fUpload.getFileUrl());
            facePicture.setFaceinfoId(fUpload.getBizKey());
            facePictureService.save(facePicture);
        }
        //第一张图片
        FacePicture facePicture1=facePictureService.findByFaceifoId(fsdata.getId());

        //多张图片
        List<FacePicture> facePictureList=new ArrayList<>();
        List<FileUpload> fileUploads2=FileUploadUtils.findFileUpload(fsdata.getId(), "FaceSearch_image");
        for (FileUpload fUpload : fileUploads2) {
            FacePicture facePictureTest = new FacePicture();
            facePictureTest.setFilename(fUpload.getFileName());
            facePictureTest.setFilepath(fUpload.getFileUrl());
            facePictureTest.setFaceinfoId(fUpload.getId());
            facePictureService.save(facePictureTest);
            facePictureList.add(facePictureTest);
        }
        faceSearchDataService.sendData(facePicture1,facePictureList);
        List<Calresult> calresult=calresultService.findList();
        model.addAttribute("calresult",calresult);
        return "modules/srv/calresult/calresultList";
    }

    //公安验证
    @RequestMapping(value = {"faceSearch/commit_check"})
    public String uploadIdentity(FaceSearchData fsdata,Model model) throws IOException {
        faceSearchDataService.save(fsdata,"FaceSearch_image");
        List<FileUpload> fileUpload=FileUploadUtils.findFileUpload(fsdata.getId(), "FaceSearch_image");
        for (FileUpload fUpload : fileUpload){
            FacePicture facePicture=new FacePicture();
            facePicture.setFilename(fUpload.getFileName());
            facePicture.setFilepath(fUpload.getFileUrl());
            facePicture.setFaceinfoId(fUpload.getBizKey());
            facePictureService.save(facePicture);
        }

        Public_Security_Verification public_security_verification=public_security_verificationService.findByIdAndName(fsdata.getUserId(),fsdata.getUserName());
        FacePicture facePicture=facePictureService.findByFaceifoId(fsdata.getId());
        String path1="C:/jeesite"+facePicture.getFilepath();
        ImageToBase64 imageToBase64=new ImageToBase64();
        String base64image1 =imageToBase64.ImageToBase64(path1);
        if(public_security_verification!=null) {
            Calresult calresult=new Calresult();
            calresult.setStartTime(new Date());
            calresult.setOperateType("public_security_verification");
            calresult.setOperateUserID(UserUtils.getUser().getId());
            calresult.setResult("operating");
            calresultService.insert(calresult);
            String path2=public_security_verification.getFilepath();
            String base64image2 =imageToBase64.ImageToBase64("C:/jeesite"+path2);
            JSONObject object = new JSONObject();
            JSONObject object1 = new JSONObject();
            JSONObject object2 = new JSONObject();
            object.put("calresultid",calresult.getId());
            object.put("operateType","public_security_verification");
            object1.put("facepictureid",facePicture.getId());
            object1.put("data",base64image1);
            object.put("picturedata",object1);
            object2.put("public_security_verificationID",public_security_verification.getId());
            object2.put("data",base64image2);
            object.put("public_security_verificationData",object2);
            SocketSingleton socketSingleton=SocketSingleton.getInstance();
            socketSingleton.accept();
            socketSingleton.addMsg(object.toJSONString());
            socketSingleton.send();
        }
        else{
            System.out.println("身份证或姓名错误");
            Calresult calresult=new Calresult();
            calresult.setStartTime(new Date());
            calresult.setOperateType("public_security_verification");
            calresult.setOperateUserID(UserUtils.getUser().getId());
            calresult.setResult("fail");
            JSONObject object = new JSONObject();
            object.put("错误信息","身份证或姓名错误");
            calresult.setContext(object.toString());
            calresultService.insert(calresult);
        }
        List<Calresult> calresult=calresultService.findList();
        model.addAttribute("calresult",calresult);
        return "modules/srv/calresult/calresultList";
    }

    //视频流人脸检测
    @RequestMapping(value = {"faceSearch/video_check"})
    public String videoFaceCheck(FaceSearchData fsdata,Model model) throws IOException {
        faceSearchDataService.save(fsdata,"FaceSearch_video");
        List<FileUpload> fileUpload=FileUploadUtils.findFileUpload(fsdata.getId(),"FaceSearch_video");
        for (FileUpload fUpload : fileUpload){
            String video_path=fUpload.getFileUrl();
            Video video=new Video();
            video.setVideoname(fUpload.getFileName());
            video.setVideopath(fUpload.getFileUrl());
            videoService.save(video);
            Calresult calresult=new Calresult();
            calresult.setStartTime(new Date());
            calresult.setOperateType("videofacecheck");
            calresult.setOperateUserID(UserUtils.getUser().getId());
            calresult.setResult("operating");
            InetAddress ip4 = Inet4Address.getLocalHost();
            System.out.println(ip4.getHostAddress());
            String path="C:/jeesite"+video_path;
            //String url=ip4.getHostAddress()+":8080/web/f/appApi/faceSearch/download?filepath="+path;
            String url="faceSearch/download?filepath="+path;
            calresultService.insert(calresult);
            JSONObject object = new JSONObject();
            object.put("calresultid",calresult.getId());
            object.put("operateType","videofacecheck");
            object.put("video_url",url);
            SocketSingleton socketSingleton=SocketSingleton.getInstance();
            socketSingleton.accept();
            socketSingleton.addMsg(object.toJSONString());
            socketSingleton.send();
        }
        List<Calresult> calresult=calresultService.findList();
        model.addAttribute("calresult",calresult);
        return "modules/srv/calresult/calresultList";
    }

    @RequestMapping(value = {"faceSearch/index"})
    public String test(Model model){
        String filepath="C:\\Users\\xlin\\Desktop\\1\\test.jpg";
        model.addAttribute("filepath",filepath);
        return "modules/srv/faceSearch/index";
    }

}
