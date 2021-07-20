package com.jeesite.modules.aipface.service;

import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.ConnectionSingleton;
import com.jeesite.modules.aipface.entity.FaceOperationRet;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.HashMap;

/**
 * 图片操作类，专门用于图像解析：人脸识别，图片查找匹配
 *
 */
@Service
public class AipfaceUserOperationHelper
{
    static private AipFace instance;

    static{
        instance = ConnectionSingleton.getInstance();
    }
    /*
     * 用于将已经存在于人脸库中的用户复制到一个新的组
     *
     * @param srcGroupID 组ID1
     * @param dstGroupID 组ID2
     * @param userID 用户ID
     */
    public boolean copyUser(String userID, String srcGroupID, String dstGroupID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("src_group_id", srcGroupID);
        options.put("dst_group_id", dstGroupID);
        JSONObject res = instance.userCopy(userID, options);
        return res.getString("error_msg").equals("SUCCESS");
    }
    /*
     * 用于将用户从某个组中删除
     *
     * @param groupID 组ID
     * @param userID 用户ID
     */
    public boolean deleteUser(String userID, String groupID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        JSONObject res = instance.deleteUser(groupID, userID, options);
        return res.getString("error_msg").equals("SUCCESS");
    }
    /*
     * 用于创建一个空的用户组，如果用户组已存在则返回错误
     *
     * @param groupID 组ID
     */
    public boolean createGroup(String groupID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        JSONObject res = instance.groupAdd(groupID, options);
        return res.getString("error_msg").equals("SUCCESS");
    }
    /*
     * 删除用户组下所有的用户及人脸，如果组不存在则返回错误
     *
     * @param groupID 组ID
     */
    public boolean deleteGroup(String groupID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        JSONObject res = instance.groupDelete(groupID, options);
        return res.getString("error_msg").equals("SUCCESS");
    }
}
