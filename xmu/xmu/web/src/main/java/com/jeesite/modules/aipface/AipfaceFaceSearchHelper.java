package com.jeesite.modules.aipface;

import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.entity.FaceOperationRet;
import com.jeesite.modules.aipface.entity.SimpleFaceInfo;
import com.jeesite.modules.aipface.entity.User;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * 图片操作类，专门用于图像解析：人脸识别，图片查找匹配
 *
 */
public class AipfaceFaceSearchHelper
{
    static private AipFace instance;

    static{
        instance = ConnectionSingleton.getInstance();
    }
    /*
     * 获取人脸库中某个用户的信息(user_info信息和用户所属的组)。
     *
     * @param groupID 组ID
     * @param userID 用户ID
     */
    public ArrayList<User> selectUser(String groupID, String userID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        JSONObject res = instance.getUser(userID, groupID,options);
        return null;
    }
    /*
     * 用于查询指定用户组中的用户列表,返回UID
     *
     * @param groupID 组ID
     * @param length 最多返回数量
     */
    public ArrayList<String> selectUserList(String groupID, Integer length)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("length", length.toString());
        JSONObject res = instance.getGroupUsers(groupID,options);
        return null;
    }
    /*
     * 用于查询用户组的列表,返回GroupID的list
     *
     * @param length 最多返回数量
     */
    public ArrayList<String> selectGroupList(Integer length)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("length", length.toString());
        JSONObject res = instance.getGroupList(options);
        return null;
    }
}
