package com.jeesite.modules.aipface.controller;

import com.jeesite.modules.aipface.entity.*;
import com.jeesite.modules.aipface.service.AipfaceDetectHelper;
import com.jeesite.modules.aipface.service.AipfaceFaceOperationHelper;
import com.jeesite.modules.aipface.service.AipfaceFaceSearchHelper;
import com.jeesite.modules.aipface.service.AipfaceUserOperationHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
//@RequestMapping("${adminPath}/aipface")
@RequestMapping("/sample/aipface")
public class AipfaceController {
    @Autowired
    AipfaceFaceSearchHelper aipfaceFaceSearchHelper;

    @Autowired
    AipfaceUserOperationHelper aipfaceUserOperationHelper;

    @Autowired
    AipfaceFaceOperationHelper aipfaceFaceOperationHelper;

    @Autowired
    AipfaceDetectHelper aipfaceDetectHelper;

    /*
    *
    * Group页面需要用的接口
    *
    *
    * */
    @GetMapping("/findGroup")
    public List<Group> findGroup(){
        return aipfaceFaceSearchHelper.selectGroupList(100);
    }

    @PostMapping("/addGroup")
    public boolean addGroup(@RequestParam(value = "name") String groupName){
        return aipfaceUserOperationHelper.createGroup(groupName);
    }

    @DeleteMapping("/delGroup")
    public boolean delGroup(@RequestParam(value = "name") String groupName){
        return aipfaceUserOperationHelper.deleteGroup(groupName);
    }
    /*
     *
     * User页面需要用的接口
     *
     * */

    @GetMapping("/findUser")
    public List<SimpleUserInfo>findUser(@RequestParam(value = "gname") String groupName, @RequestParam(value = "length") Integer length){
        return aipfaceFaceSearchHelper.selectUserList(groupName,length);
    }

    @PostMapping("/addUser")
    @ResponseBody
    public boolean addUser(@RequestBody HashMap<String,String> mp){
        String url = mp.get("url");
        String groupName = mp.get("gname");
        String userName = mp.get("uname");
        url = url.substring(url.indexOf(',') + 1);
        ImageInfo imageInfo = aipfaceDetectHelper.detect(url, false);
        ArrayList<FaceInfo> list = imageInfo.getFace_list();
        if(list.size() == 0) return false;
        if(list.get(0).getFace_probability() < 0.6) return false;
        return aipfaceFaceOperationHelper.addUser(url, groupName, userName);
    }

    @DeleteMapping("/delUser")
    public boolean delUser(@RequestParam(value = "gname") String groupName, @RequestParam(value = "uname") String userName){
        return aipfaceUserOperationHelper.deleteUser(userName, groupName);
    }


    @PostMapping("/matUser")
    @ResponseBody
    public String matUser(@RequestBody HashMap<String,String> mp){
        String url = mp.get("url");
        String groupName = mp.get("gname");
        url = url.substring(url.indexOf(',') + 1);
        FaceSearchRet res = aipfaceDetectHelper.searchOneToN(url, groupName, 1);
        ArrayList<User> list = res.getUser_list();
        if(list == null || list.size() == 0) return "!";
        else return list.get(0).getUser_id();
    }

    /*
     *
     * Image页面需要用的接口
     *
     * */
    @GetMapping("/findImageList")
    public List<SimpleFaceInfo>findImageList(@RequestParam(value = "gname") String groupName, @RequestParam(value = "uname") String userName){
        return aipfaceFaceSearchHelper.selectFaceList(groupName,userName);
    }

    @DeleteMapping("/delImage")
    public boolean delImage(@RequestParam(value = "gname") String groupName, @RequestParam(value = "uname") String userName, @RequestParam(value = "url") String url){
        return aipfaceFaceOperationHelper.deleteUser(groupName, userName, url);
    }

    @PostMapping("/addImage")
    public boolean addImage(@RequestBody HashMap<String,String> mp){
        String url = mp.get("url");
        String groupName = mp.get("gname");
        String userName = mp.get("uname");
        url = url.substring(url.indexOf(',') + 1);
        ImageInfo imageInfo = aipfaceDetectHelper.detect(url, false);
        ArrayList<FaceInfo> list = imageInfo.getFace_list();
        if(list.size() == 0) return false;
        if(list.get(0).getFace_probability() < 0.6) return false;
        return aipfaceFaceOperationHelper.updateUser(url, groupName, userName);
    }
}
