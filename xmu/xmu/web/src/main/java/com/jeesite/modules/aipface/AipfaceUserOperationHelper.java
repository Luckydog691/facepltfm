package com.jeesite.modules.aipface;

import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.entity.FaceOperationRet;
import org.json.JSONObject;

import java.util.HashMap;

/**
 * 图片操作类，专门用于图像解析：人脸识别，图片查找匹配
 *
 */
public class AipfaceUserOperationHelper
{
    static private AipFace instance;

    static{
        instance = ConnectionSingleton.getInstance();
    }
    /*
     * 指定本地图片，用户信息，注册该人脸
     *
     * @param url 图片url
     * @param groupID 组ID
     * @param userID 用户ID
     */
    public FaceOperationRet add(String url, String groupID, String userID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        String imageStr = BASE64Util.convertFileToBase64(url);
        String imageType = "BASE64";
        JSONObject res = instance.addUser(imageStr, imageType, groupID, userID, options);
        return null;
    }
    /*
     * 指定本地图片，用户信息，更新该人脸，新上传的人脸图像将覆盖此userID原有所有图像
     *
     * @param url 图片url
     * @param groupID 组ID
     * @param userID 用户ID
     */
    public FaceOperationRet update(String url, String groupID, String userID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        String imageStr = BASE64Util.convertFileToBase64(url);
        String imageType = "BASE64";
        JSONObject res = instance.updateUser(imageStr, imageType, groupID, userID, options);
        return null;
    }
    /*
     * 指定用户，删除该用户所有信息，返回操作LogID
     *
     * @param url 图片url
     * @param groupID 组ID
     * @param userID 用户ID
     */
    public boolean delete(String groupID, String userID,String faceToken)
    {
        // 传入可选参数调用接口
        HashMap<String, String> options = new HashMap<String, String>();
        // 人脸删除
        JSONObject res = instance.faceDelete(userID, groupID, faceToken, options);
        return true;
    }

}
