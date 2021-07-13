package com.jeesite.modules.aipface;

import com.alibaba.fastjson.JSON;
import com.baidu.aip.face.AipFace;
import com.jeesite.modules.aipface.entity.User;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONString;

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
        JSONObject res = instance.getUser(userID, groupID, options);

        JSONObject result = res.getJSONObject("result");
        JSONArray user_list = result.getJSONArray("user_list");

        ArrayList<User> ret = new ArrayList<>();
        for(int i = 0; i < user_list.length(); i++)
        {
            JSONObject json_user = user_list.getJSONObject(i);
            User user = new User();

            user.setGroup_id(groupID);
            user.setUser_id(userID);
            user.setUser_info(json_user.getString("user_info"));

            ret.add(user);
        }

        return ret;
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
        JSONArray user_id_list = res.getJSONObject("result").getJSONArray("user_id_list");

        ArrayList<String> ret = new ArrayList<>();

        for(int i = 0; i < user_id_list.length(); i++)
        {
            ret.add(String.valueOf(user_id_list.get(i)));
        }

        return ret;
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
        JSONArray group_id_list = res.getJSONObject("result").getJSONArray("group_id_list");

        ArrayList<String> ret = new ArrayList<>();

        for(int i = 0; i < group_id_list.length(); i++)
        {
            ret.add(String.valueOf(group_id_list.get(i)));
        }

        return ret;
    }
}
