package com.jeesite.modules.aipface.service;

import com.alibaba.fastjson.JSON;
import com.baidu.aip.face.AipFace;
import com.jeesite.common.beetl.a.A;
import com.jeesite.modules.aipface.ConnectionSingleton;
import com.jeesite.modules.aipface.entity.Group;
import com.jeesite.modules.aipface.entity.SimpleFaceInfo;
import com.jeesite.modules.aipface.entity.SimpleUserInfo;
import com.jeesite.modules.aipface.entity.User;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONString;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 * 查找类，专门用于数据查询：用户组，用户，人脸表
 *
 */
@Service
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
    public ArrayList<SimpleUserInfo> selectUserList(String groupID, Integer length)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("length", length.toString());
        JSONObject res = instance.getGroupUsers(groupID,options);
        if(!res.has("result"))
        {
            ArrayList<SimpleUserInfo> err1 = new ArrayList<>();
            SimpleUserInfo simpleUserInfo = new SimpleUserInfo();
            simpleUserInfo.setUser_name("!");
            err1.add(simpleUserInfo);
            return err1;
        }
        JSONArray user_id_list = res.getJSONObject("result").getJSONArray("user_id_list");

        ArrayList<SimpleUserInfo> ret = new ArrayList<>();

        for(int i = 0; i < user_id_list.length(); i++)
        {
            SimpleUserInfo e = new SimpleUserInfo();
            e.setUser_name(String.valueOf(user_id_list.get(i)));
            ret.add(e);
        }
        return ret;
    }
    /*
     * 用于查询用户组的列表,返回GroupID的list
     *
     * @param length 最多返回数量
     */
    public ArrayList<Group> selectGroupList(Integer length)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("length", length.toString());
        JSONObject res = instance.getGroupList(options);
        JSONArray group_id_list = res.getJSONObject("result").getJSONArray("group_id_list");

        ArrayList<Group> ret = new ArrayList<>();

        for(int i = 0; i < group_id_list.length(); i++)
        {
            Group elem = new Group();
            elem.setGroup_id(String.valueOf(group_id_list.get(i)));
            ret.add(elem);
        }

        return ret;
    }
    /*
     * 用于获取一个用户的全部人脸列表
     *
     * @param length 最多返回数量
     */
    public ArrayList<SimpleFaceInfo> selectFaceList(String groupID,String userID)
    {
        HashMap<String, String> options = new HashMap<String, String>();
        JSONObject res = instance.faceGetlist(userID,groupID,options);
        JSONArray face_list = res.getJSONObject("result").getJSONArray("face_list");

        ArrayList<SimpleFaceInfo> ret = new ArrayList<>();

        for(int i = 0; i < face_list.length(); i++)
        {
            JSONObject jsonObject = (JSONObject)face_list.get(i);
            SimpleFaceInfo elem = new SimpleFaceInfo();
            elem.setFace_token(jsonObject.get("face_token").toString());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                elem.setCtime(sdf.parse(jsonObject.get("ctime").toString()));
            }catch (ParseException exception) {
                exception.printStackTrace();
            }
            elem.setTime_string(jsonObject.get("ctime").toString());
            ret.add(elem);
        }
        return ret;
    }
}
