package com.jeesite.modules.aipface.service;

import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.util.BASE64Util;
import com.jeesite.modules.aipface.ConnectionSingleton;
import com.jeesite.modules.aipface.entity.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
/**
 * 图片操作类，专门用于图像解析：人脸识别，图片查找匹配
 *
 */
@Service
public class AipfaceDetectHelper
{
    static private AipFace instance;
     static{
         instance = ConnectionSingleton.getInstance();
     }
    /**
     * 检测本地图片s
     *
     * @param url 图片url
     */
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

         return res;
     }

     private FaceSearchRet transjson(JSONObject json)
     {
         JSONObject result = json.getJSONObject("result");

         FaceSearchRet res = new FaceSearchRet();
         res.setFace_token(result.getString("face_token"));

         JSONArray user_list = result.getJSONArray("user_list");
         ArrayList<User> users = new ArrayList<>();

         for(int i = 0; i < user_list.length(); i++)
         {
             User user = new User();
             JSONObject json_user = user_list.getJSONObject(i);

             user.setScore(json_user.getDouble("score"));
             user.setGroup_id(json_user.getString("group_id"));
             user.setUser_id(json_user.getString("user_id"));
             user.setUser_info(json_user.getString("user_info"));

             users.add(user);
         }

         res.setUser_list(users);

         return res;
     }

    /**
     * 1:N搜索，指定人脸组ID
     *
     * @param url 图片url
     * @param groupID 欲查询的组ID
     * @param maxCount 查找后返回的用户数量，返回相似度最高的几个用户，默认为1
     */
    public FaceSearchRet searchOneToN(String url, String groupID, Integer maxCount)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        String imageStr = BASE64Util.convertFileToBase64(url);
        String imageType = "BASE64";
        if(maxCount == null) maxCount = 1;
        options.put("max_user_num", maxCount.toString());
        JSONObject json = instance.search(imageStr, imageType, groupID, options);

        return transjson(json);
    }
    /**
     * 1:1搜索，指定人脸组ID与user_id
     *
     * @param url 图片url
     * @param groupID 欲查询的组ID
     * @param userID 用户ID
     * @param maxCount 查找后返回的用户数量，返回相似度最高的几个用户，默认为1
     */
    public FaceSearchRet searchOneToOne(String url, String groupID, String userID, Integer maxCount)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        String imageStr = BASE64Util.convertFileToBase64(url);
        String imageType = "BASE64";
        if(maxCount == null) maxCount = 1;
        options.put("max_user_num", maxCount.toString());
        options.put("user_id",userID);
        JSONObject json = instance.search(imageStr, imageType, groupID, options);

        return transjson(json);
    }
}
