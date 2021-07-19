package com.jeesite.modules.aipface.controller;

import com.jeesite.modules.aipface.entity.Group;
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

    @GetMapping("/findGroup")
    public List<Group> findGroup(){
        ArrayList<Group> ret =  aipfaceFaceSearchHelper.selectGroupList(100);
        return ret;
    }

    @PostMapping("/addGroup")
    public boolean addGroup(@RequestParam(value = "name") String groupName){
        boolean ret =  aipfaceUserOperationHelper.createGroup(groupName);
        return ret;
    }
}
