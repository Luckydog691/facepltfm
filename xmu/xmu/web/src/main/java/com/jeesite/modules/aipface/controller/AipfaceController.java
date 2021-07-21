package com.jeesite.modules.aipface.controller;

import com.jeesite.modules.aipface.entity.Group;
import com.jeesite.modules.aipface.entity.SimpleFaceInfo;
import com.jeesite.modules.aipface.entity.SimpleUserInfo;
import com.jeesite.modules.aipface.service.AipfaceFaceSearchHelper;
import com.jeesite.modules.aipface.service.AipfaceUserOperationHelper;
import org.jasig.cas.client.authentication.SimpleGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
}
