package com.jeesite.modules.aipface.controller;

import com.jeesite.modules.aipface.entity.FaceInfo;
import com.jeesite.modules.aipface.entity.Group;
import com.jeesite.modules.aipface.entity.SimpleFaceInfo;
import com.jeesite.modules.aipface.entity.SimpleUserInfo;
import com.jeesite.modules.aipface.service.AipfaceDetectHelper;
import com.jeesite.modules.aipface.service.AipfaceFaceOperationHelper;
import com.jeesite.modules.aipface.service.AipfaceFaceSearchHelper;
import com.jeesite.modules.aipface.service.AipfaceUserOperationHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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
    public boolean addUser(@RequestParam(value = "url") String url, @RequestParam(value = "gname") String groupName, @RequestParam(value = "uname") String userName){
        ArrayList<FaceInfo> list = aipfaceDetectHelper.detect(url).getFace_list();
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
        ArrayList<FaceInfo> list = aipfaceDetectHelper.detect(url).getFace_list();
        if(list.size() == 0) return false;
        if(list.get(0).getFace_probability() < 0.6) return false;
        aipfaceFaceOperationHelper.updateUser(url, groupName, userName);
        return true;
    }
}
