package com.jeesite.modules.aipface;

import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.entity.ImageInfo;
import org.json.JSONObject;

import java.util.HashMap;

public class AipfaceHelper
{
     private AipFace instance;
    /**
     * 检测本地图片
     *
     * @param url 图片url
     */
     public ImageInfo detect(String url)
     {
         String imageStr = BASE64Util.convertFileToBase64(url);
         String imageType = "BASE64";
         AipFace inst = ConnectionSingleton.getInstance();
         HashMap<String, String> options = new HashMap<String, String>();
         options.put("face_field", "age,beauty,expression,face_shape,gender,glasses,landmark,landmark72,landmark150,quality,eye_status,emotion,face_type");
         JSONObject ret = inst.detect(imageStr,imageType,options);
         System.out.println(ret);
         return new ImageInfo();
     }
}
