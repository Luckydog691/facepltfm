package com.jeesite.modules.test.web.appApi;

//import com.jeesite.common.shiro.b.C;
import com.alibaba.fastjson.JSONObject;
import com.jeesite.common.io.FileUtils;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.calresult.entity.Calresult;
import com.jeesite.modules.calresult.service.CalresultService;
import com.jeesite.modules.test.entity.*;
import com.jeesite.modules.test.entity.facedatabase.FacePicture;
import com.jeesite.modules.test.entity.facedatabase.Public_Security_Verification;
import com.jeesite.modules.test.service.DocService;
import com.jeesite.modules.test.service.facedatabase.FaceGroupService;
import com.jeesite.modules.test.service.facedatabase.FaceInfoService;
import com.jeesite.modules.test.service.facedatabase.FacePictureService;
import com.jeesite.modules.test.service.facedatabase.Public_Security_VerificationService;
import com.jeesite.modules.test.web.appApi.tool.SocketSingleton;
import com.sun.media.jfxmedia.control.VideoRenderControl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(value = "${frontPath}/appApi")
public class UploadAppController extends BaseController {

    @Autowired
    private CalresultService calresultService;

    @Autowired
    private FacePictureService facePictureService;

    @Autowired
    private Public_Security_VerificationService public_security_verificationService;

    @Autowired
    private FaceInfoService faceInfoService;

    @Autowired
    private DocService docService;

    @RequestMapping(value="send/1comparen",method = RequestMethod.POST)
    public void faceSearch(@RequestBody FaceSearchReceiveData faceSearchReceiveData){
        if(faceSearchReceiveData==null){
            System.out.println("接受数据为空");
            return;
        }
        System.out.println(faceSearchReceiveData.toString());
        Calresult calresult=new Calresult();
        calresult.setId(faceSearchReceiveData.getCalresultid());
        calresult.setFinishTime(new Date());
        calresult.setOperateType(faceSearchReceiveData.getOperatetype());
        calresult.setResult(faceSearchReceiveData.getResult());
        if(faceSearchReceiveData.getFacepictureid()!=null&&faceSearchReceiveData.getResultpictureid()!=null){
            String path1=facePictureService.findByFacePictureId(faceSearchReceiveData.getFacepictureid()).getFilepath();
            String path2=facePictureService.findByFacePictureId(faceSearchReceiveData.getResultpictureid()).getFilepath();
            List<String> pathlist=new ArrayList<>();
            pathlist.add(path1);
            pathlist.add(path2);
            JSONObject object = new JSONObject();
            object.put("picturepath",pathlist);
            System.out.println(object);
            calresult.setContext(object.toString());
            System.out.println(calresult.getContext());
        }
        System.out.println(calresult);
        calresultService.update(calresult);
        FacePicture facePicture=facePictureService.findByFacePictureId(faceSearchReceiveData.getResultpictureid());//对应结果图片的id
    }

    @RequestMapping(value = "send/public_security_verification",method = RequestMethod.POST)
    public void verification(@RequestBody FaceSearchReceiveData faceSearchReceiveData){
        if(faceSearchReceiveData==null){
            System.out.println("数据为空");
            return;
        }
        System.out.println(faceSearchReceiveData.toString());
        Calresult calresult=new Calresult();
        calresult.setId(faceSearchReceiveData.getCalresultid());
        calresult.setFinishTime(new Date());
        calresult.setOperateType(faceSearchReceiveData.getOperatetype());
        calresult.setResult(faceSearchReceiveData.getResult());

        Public_Security_Verification public_security_verification=public_security_verificationService.findById(faceSearchReceiveData.getResultpictureid()); //对应公安人脸库
        if(faceSearchReceiveData.getFacepictureid()!=null&&faceSearchReceiveData.getResultpictureid()!=null) {
            String path1 = facePictureService.findByFacePictureId(faceSearchReceiveData.getFacepictureid()).getFilepath();
            String path2 = public_security_verification.getFilepath();
            List<String> pathlist=new ArrayList<>();
            pathlist.add(path1);
            pathlist.add(path2);
            System.out.println(pathlist);
            JSONObject object = new JSONObject();
            object.put("picturepath",pathlist);
            calresult.setContext(object.toString());
        }
        calresultService.update(calresult);
    }

    @RequestMapping(value = "send/videofacecheck",method = RequestMethod.POST)
    public void videoFaceCheck(@RequestBody VideoReceiveData videoReceiveData){
        if(videoReceiveData==null){
            System.out.println("返回数据为空");
            return;
        }
        System.out.println(videoReceiveData.toString());
        Calresult calresult=new Calresult();
        calresult.setId(videoReceiveData.getCalresultid());
        calresult.setFinishTime(new Date());
        calresult.setOperateType(videoReceiveData.getOperatetype());
        calresult.setResult(videoReceiveData.getResult());
        if (videoReceiveData.getResultpicture()!=null) {
            //String path = facePictureService.findByFaceifoId(videoReceiveData.getResultfaceinfoid()).getFilepath();
            BASE64Decoder decoder = new BASE64Decoder();
            try {
                // Base64解码
                byte[] bytes = decoder.decodeBuffer(videoReceiveData.getResultpicture());
                for (int i = 0; i < bytes.length; ++i) {
                    if (bytes[i] < 0) {// 调整异常数据
                        bytes[i] += 256;
                    }
                }
                // 生成jpeg图片
                UUID uuid = UUID.randomUUID();
                String path="C:/jeesite/userfiles/fileupload/202004/"+uuid+".jpg";
                OutputStream out = new FileOutputStream(path);
                JSONObject object = new JSONObject();
                List<String> pathlist=new ArrayList<>();
                String realpath="/userfiles/fileupload/202004/"+uuid+".jpg";
                pathlist.add(realpath);
                object.put("picturepath",pathlist);
                calresult.setContext(object.toString());
                FacePicture facePicture=new FacePicture();
                facePicture.setFilepath(realpath);
                facePicture.setFilename(uuid+".jpg");
                faceInfoService.addBefore(facePicture,null);
                out.write(bytes);
                out.flush();
                out.close();
            } catch (Exception e) {
            }
        }
        calresultService.update(calresult);
    }

    @RequestMapping(value = {"faceSearch/download"})
    public ResponseEntity<byte[]> EIToolDownloads(HttpServletRequest request, HttpServletResponse response, String filepath) throws IOException{
        System.out.println(filepath);
        File file = new File(filepath);
        if(file.exists()){
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment", file.getName());
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
        }else{
            System.out.println("文件不存在,请重试...");
            return null;
        }
    }

    @RequestMapping(value = {"senddoc"})
    public void send(HttpServletResponse response) throws IOException {
        List<Doc> docList=docService.findList();
        List<JSONObject> objectList=new ArrayList<>();
        for(Doc doc:docList){
            String[] _path = doc.getFilepath().split(";");
            String[] _name = doc.getFilename().split(";");
            if (_path.length != _name.length)
            {
                System.out.println("[ERROR DATA] path = "+_path+" , name = "+_name);
                logger.info("[ERROR DATA] path = "+_path+" , name = "+_name);
                continue;
            }
            for(int i = 0; i < _path.length; i++)
            {
                JSONObject object = new JSONObject();
                object.put("docname",_name[i]);
                object.put("url","faceSearch/download?filepath=C:/jeesite"+_path[i]);
                objectList.add(object);
            }
        }
        JSONObject objectTest = new JSONObject();
        objectTest.put("docdata",objectList);
        System.out.println(objectTest);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset = UTF-8");
        response.getWriter().write(objectTest.toJSONString());
        /*
        SocketSingleton socketSingleton=SocketSingleton.getInstance();
        socketSingleton.accept();
        socketSingleton.addMsg(objectTest.toJSONString());
        socketSingleton.send();
        */
    }
}
