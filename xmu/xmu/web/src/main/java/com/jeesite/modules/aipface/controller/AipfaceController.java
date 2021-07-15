package com.jeesite.modules.aipface.controller;

import com.jeesite.modules.aipface.entity.Group;
import com.jeesite.modules.aipface.service.AipfaceFaceSearchHelper;
import org.jasig.cas.client.authentication.SimpleGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
//@RequestMapping("${adminPath}/aipface")
@RequestMapping("/sample/aipface")
public class AipfaceController {
    @Autowired
    AipfaceFaceSearchHelper aipfaceFaceSearchHelper;

    @GetMapping("/findGroup")
    public List<Group> findGroup(){
        ArrayList<Group> ret =  aipfaceFaceSearchHelper.selectGroupList(100);
        return ret;
    }
}
