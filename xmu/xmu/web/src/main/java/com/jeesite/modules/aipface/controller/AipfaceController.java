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
        List<Group> ret =  aipfaceFaceSearchHelper.selectGroupList(100);
        return ret;
    }

    @PostMapping("/addGroup")
    public boolean addGroup(@RequestParam(value = "name") String groupName){
        boolean ret =  aipfaceUserOperationHelper.createGroup(groupName);
        return ret;
    }

    @DeleteMapping("/delGroup")
    public boolean delGroup(@RequestParam(value = "name") String groupName){
        boolean ret =  aipfaceUserOperationHelper.deleteGroup(groupName);
        return ret;
    }
    /*
     *
     * User页面需要用的接口
     *
     * */

    @GetMapping("/findUser")
    public List<SimpleUserInfo>findUser(@RequestParam(value = "gname") String groupName, @RequestParam(value = "length") Integer length){
        List<SimpleUserInfo>ret = aipfaceFaceSearchHelper.selectUserList(groupName,length);
        return ret;
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
        aipfaceFaceOperationHelper.addUser(url, groupName, userName);
        return true;
    }

    @DeleteMapping("/delUser")
    public boolean delUser(@RequestParam(value = "gname") String groupName, @RequestParam(value = "uname") String userName){
        boolean ret =  aipfaceUserOperationHelper.deleteUser(userName, groupName);
        return ret;
    }


    /*
     *
     * Image页面需要用的接口
     *
     * */
    @GetMapping("/findImageList")
    public List<SimpleFaceInfo>findImageList(@RequestParam(value = "gname") String groupName, @RequestParam(value = "uname") String userName){
        List<SimpleFaceInfo>ret = aipfaceFaceSearchHelper.selectFaceList(groupName,userName);
        return ret;
    }

    @DeleteMapping("/delImage")
    public boolean delImage(@RequestParam(value = "gname") String groupName, @RequestParam(value = "uname") String userName, @RequestParam(value = "url") String url){
        boolean ret =  aipfaceFaceOperationHelper.deleteUser(groupName, userName, url);
        return ret;
    }

    @PostMapping("/addImage")
    public boolean addImage(@RequestParam(value = "url") String url, @RequestParam(value = "gname") String groupName, @RequestParam(value = "uname") String userName){
        ArrayList<FaceInfo> list = aipfaceDetectHelper.detect(url, false).getFace_list();
        if(list.size() == 0) return false;
        if(list.get(0).getFace_probability() < 0.6) return false;
        aipfaceFaceOperationHelper.updateUser(url, groupName, userName);
        return true;
    }
}
