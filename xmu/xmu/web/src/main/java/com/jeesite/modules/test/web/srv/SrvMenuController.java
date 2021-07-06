package com.jeesite.modules.test.web.srv;

import com.jeesite.common.web.BaseController;
import com.jeesite.modules.test.entity.FaceSearchData;
import com.jeesite.modules.test.entity.facedatabase.FaceGroup;
import com.jeesite.modules.test.service.facedatabase.FaceGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "${adminPath}/srv")
public class SrvMenuController extends BaseController {

    @Autowired
    private FaceGroupService faceGroupService;

    @RequestMapping(value = {"faceSearch/single"})
    public String faceSearchSingle(Model model){
        FaceSearchData fsData =new FaceSearchData();
        fsData.setId("fs");
        List<FaceGroup> faceGroupList=faceGroupService.findGroups();
        model.addAttribute("faceGroupList",faceGroupList);
        model.addAttribute("fsData",fsData);
        return "modules/srv/faceSearch/single";
    }

    @RequestMapping(value = {"faceSearch/mult"})
    public String faceSearchMult(Model model){
        FaceSearchData fsData =new FaceSearchData();
        fsData.setId("fs");
        model.addAttribute("fsData",fsData);
        return "modules/srv/faceSearch/mult";
    }

    @RequestMapping(value = {"faceSearch/safeCheck"})
    public String faceSearchSafeCheck(Model model){
        FaceSearchData fsData =new FaceSearchData();
        fsData.setId("fs");
        model.addAttribute("fsData",fsData);
        return "modules/srv/faceSearch/safeCheck";
    }

    @RequestMapping(value = {"faceSearch/videoCheck"})
    public String faceSearchVideoCheck(Model model){
        FaceSearchData fsData =new FaceSearchData();
        fsData.setId("fs");
        model.addAttribute("fsData",fsData);
        return "modules/srv/faceSearch/videoCheck";
    }

    @RequestMapping(value = {"faceProp"})
    public String faceProp(Model model){
        FaceSearchData fsData =new FaceSearchData();
        model.addAttribute("fsData",fsData);
        return "modules/srv/faceProp/faceProp";
    }

    @RequestMapping(value = {"faceProp/commit"})
    public String facePropCommit(FaceSearchData fsData, Model model){
        model.addAttribute("fsData",fsData);
        return "modules/srv/faceProp/result";
    }
}
