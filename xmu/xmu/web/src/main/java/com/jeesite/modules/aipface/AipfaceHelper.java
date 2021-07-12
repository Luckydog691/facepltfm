package com.jeesite.modules.aipface;

import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.entity.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class AipfaceHelper
{
    static private AipFace instance;
    /**
     * 检测本地图片
     *
     * @param url 图片url
     */
     static{
         instance = ConnectionSingleton.getInstance();
     }
     public ImageInfo detect(String url)
     {
         String imageStr = BASE64Util.convertFileToBase64(url);
         String imageType = "BASE64";
         HashMap<String, String> options = new HashMap<String, String>();
         options.put("face_field", "age,beauty,expression,face_shape,gender,glasses,landmark,landmark72,landmark150,quality,eye_status,emotion,face_type");
         JSONObject ret = instance.detect(imageStr,imageType,options);
         System.out.println(ret);

         JSONObject result = ret.getJSONObject("result");
         ImageInfo res = new ImageInfo();
         res.setFace_num(result.getInt("face_num"));

         JSONArray face_list = result.getJSONArray("face_list");
         ArrayList<FaceInfo> list = new ArrayList<>();
         for(int i = 0; i < res.getFace_num(); i++)
         {
             FaceInfo faceInfo = new FaceInfo();

             JSONObject json_faceinfo = face_list.getJSONObject(i);

             faceInfo.setExpression(new FaceInfo_Expression(
                     json_faceinfo.getJSONObject("expression").getString("type"),
                     json_faceinfo.getJSONObject("expression").getDouble("probability")
             ));

             faceInfo.setFace_shape(new FaceInfo_FaceShape(
                     json_faceinfo.getJSONObject("face_shape").getString("type"),
                     json_faceinfo.getJSONObject("face_shape").getDouble("probability")
             ));

             faceInfo.setBeauty(json_faceinfo.getLong("beauty"));

             faceInfo.setGender(new FaceInfo_Gender(
                     json_faceinfo.getJSONObject("gender").getString("type"),
                     json_faceinfo.getJSONObject("gender").getDouble("probability")
             ));

             faceInfo.setEye_status(new FaceInfo_EyeStatus(
                     json_faceinfo.getJSONObject("eye_status").getDouble("left_eye"),
                     json_faceinfo.getJSONObject("eye_status").getDouble("right_eye")
             ));

             faceInfo.setFace_probability(json_faceinfo.getDouble("face_probability"));

             faceInfo.setQuality(new FaceInfo_Quality(
                     json_faceinfo.getJSONObject("quality").getDouble("illumination"),
                     new FaceInfo_Quality_Occlusion(
                             json_faceinfo.getJSONObject("quality").getJSONObject("occlusion").getDouble("left_eye"),
                             json_faceinfo.getJSONObject("quality").getJSONObject("occlusion").getDouble("right_eye"),
                             json_faceinfo.getJSONObject("quality").getJSONObject("occlusion").getDouble("nose"),
                             json_faceinfo.getJSONObject("quality").getJSONObject("occlusion").getDouble("mouth"),
                             json_faceinfo.getJSONObject("quality").getJSONObject("occlusion").getDouble("left_cheek"),
                             json_faceinfo.getJSONObject("quality").getJSONObject("occlusion").getDouble("right_cheek"),
                             json_faceinfo.getJSONObject("quality").getJSONObject("occlusion").getDouble("chin_contour")
                     ),
                     json_faceinfo.getJSONObject("quality").getDouble("blur"),
                     json_faceinfo.getJSONObject("quality").getLong("completeness")
             ));

             faceInfo.setGlasses(new FaceInfo_Glasses(
                     json_faceinfo.getJSONObject("glasses").getString("type"),
                     json_faceinfo.getJSONObject("glasses").getDouble("probability")
             ));

             faceInfo.setEmotion(new FaceInfo_Emotion(
                     json_faceinfo.getJSONObject("emotion").getString("type"),
                     json_faceinfo.getJSONObject("emotion").getDouble("probability")
             ));

             JSONArray json_landmark72 = json_faceinfo.getJSONArray("landmark72");
             ArrayList<FaceInfo_LandMarkPoint> landmark72 = new ArrayList<>();
             for(int o = 0; o < 72; o++)
             {
                 landmark72.add(new FaceInfo_LandMarkPoint(
                         json_landmark72.getJSONObject(o).getDouble("x"),
                         json_landmark72.getJSONObject(o).getDouble("y")
                 ));
             }
             faceInfo.setLandmark72(landmark72);

             faceInfo.setFace_type(new FaceInfo_FaceType(
                     json_faceinfo.getJSONObject("face_type").getString("type"),
                     json_faceinfo.getJSONObject("face_type").getDouble("probability")
             ));

             faceInfo.setAngel(new FaceInfo_Angel(
                     json_faceinfo.getJSONObject("angle").getDouble("roll"),
                     json_faceinfo.getJSONObject("angle").getDouble("pitch"),
                     json_faceinfo.getJSONObject("angle").getDouble("yaw")
             ));

             faceInfo.setFace_token(json_faceinfo.getString("face_token"));

             faceInfo.setLocation(new FaceInfo_Location(
                     json_faceinfo.getJSONObject("location").getDouble("top"),
                     json_faceinfo.getJSONObject("location").getDouble("left"),
                     json_faceinfo.getJSONObject("location").getLong("rotation"),
                     json_faceinfo.getJSONObject("location").getDouble("width"),
                     json_faceinfo.getJSONObject("location").getDouble("height")
             ));

             faceInfo.setAge(json_faceinfo.getDouble("age"));

             JSONArray json_landmark = json_faceinfo.getJSONArray("landmark");
             ArrayList<FaceInfo_LandMarkPoint> landmark = new ArrayList<>();
             int length = json_landmark.length();
             for(int o = 0; o < length; o++)
             {
                 landmark.add(new FaceInfo_LandMarkPoint(
                         json_landmark.getJSONObject(o).getDouble("x"),
                         json_landmark.getJSONObject(o).getDouble("y")
                 ));
             }
             faceInfo.setLandmark(landmark);

             list.add(faceInfo);
         }

         res.setFace_list(list);

         System.out.println(res);

         return new ImageInfo();
     }
}
