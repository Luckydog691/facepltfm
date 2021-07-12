package com.jeesite.modules.aipface;

import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.entity.FaceSearchRet;
import com.jeesite.modules.aipface.entity.ImageInfo;
import com.jeesite.modules.aipface.entity.User;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
/**
 * 图片操作类，专门用于图像解析：人脸识别，图片查找匹配
 *
 */
public class AipfaceFaceDetectHelper
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
         return new ImageInfo();
     }
     /**
     * 1:N搜索，指定人脸组ID
     *
     * @param url 图片url
     * @param groupID 欲查询的组I
      * @param maxCount 查找后返回的用户数量，返回相似度最高的几个用户，默认为1
     */
     public FaceSearchRet searchOneToN(String url, String groupID, Integer maxCount)
     {
         HashMap<String, String> options = new HashMap<String, String>();
         String imageStr = BASE64Util.convertFileToBase64(url);
         String imageType = "BASE64";
         if(maxCount == null)maxCount = 1;
         options.put("max_user_num", maxCount.toString());
         JSONObject ret = instance.search(imageStr, imageType, groupID, options);
         return null;
     }
    /**
     * 1:1搜索，指定人脸组ID与user_id
     *
     * @param url 图片url
     * @param groupID 欲查询的组I
     * @param maxCount 查找后返回的用户数量，返回相似度最高的几个用户，默认为1
     */
    public FaceSearchRet searchOneToOne(String url, String groupID, Integer maxCount,String userID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        String imageStr = BASE64Util.convertFileToBase64(url);
        String imageType = "BASE64";
        if(maxCount == null)maxCount = 1;
        options.put("max_user_num", maxCount.toString());
        options.put("user_id",userID);
        JSONObject ret = instance.search(imageStr, imageType, groupID, options);
        return null;
    }
}
