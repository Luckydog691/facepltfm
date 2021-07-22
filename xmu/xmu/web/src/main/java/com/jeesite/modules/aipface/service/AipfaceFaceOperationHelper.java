package com.jeesite.modules.aipface.service;

import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.util.BASE64Util;
import com.jeesite.modules.aipface.ConnectionSingleton;
import com.jeesite.modules.aipface.entity.*;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.HashMap;

/**
 * 图片操作类，专门用于图像解析：人脸识别，图片查找匹配
 *
 */
@Service
public class AipfaceFaceOperationHelper
{
    static private AipFace instance;

    static{
        instance = ConnectionSingleton.getInstance();
    }


    private FaceOperationRet tranpic(JSONObject res)
    {
        JSONObject result = res.getJSONObject("result");

        FaceOperationRet ret = new FaceOperationRet();
        ret.setLog_id(res.getLong("log_id"));
        ret.setFace_token(result.getString("face_token"));
        ret.setLocation(new FaceInfo_Location(
                result.getJSONObject("location").getDouble("top"),
                result.getJSONObject("location").getDouble("left"),
                result.getJSONObject("location").getLong("rotation"),
                result.getJSONObject("location").getDouble("width"),
                result.getJSONObject("location").getDouble("height")
        ));

        return ret;
    }

    /*
     * 指定本地图片，用户信息，注册该人脸
     *
     * @param url 图片url
     * @param groupID 组ID
     * @param userID 用户ID
     */
    public FaceOperationRet addUser(String url, String groupID, String userID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        //String imageStr = BASE64Util.convertFileToBase64(url);
        String imageStr = url;
        String imageType = "BASE64";
        JSONObject res = instance.addUser(imageStr, imageType, groupID, userID, options);
        System.out.println(res);
        JSONObject result = res.getJSONObject("result");

        return tranpic(res);
    }
    /*
     * 指定本地图片，用户信息，更新该人脸，新上传的人脸图像将覆盖此userID原有所有图像
     *
     * @param url 图片url
     * @param groupID 组ID
     * @param userID 用户ID
     */
    public FaceOperationRet updateUser(String url, String groupID, String userID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        String imageStr = BASE64Util.convertFileToBase64(url);
        String imageType = "BASE64";
        JSONObject res = instance.updateUser(imageStr, imageType, groupID, userID, options);
        System.out.println(res);
        return tranpic(res);
    }
    /*
     * 指定用户，删除该用户所有信息，返回操作boolean
     *
     * @param url 图片url
     * @param groupID 组ID
     * @param userID 用户ID
     */
    public boolean deleteUser(String groupID, String userID,String faceToken)
    {
        // 传入可选参数调用接口
        HashMap<String, String> options = new HashMap<String, String>();
        // 人脸删除
        JSONObject res = instance.faceDelete(userID, groupID, faceToken, options);

        return res.getString("error_msg").equals("SUCCESS");
    }
}
