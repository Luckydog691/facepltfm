package com.jeesite.modules.test.web.facedatabase;

import com.alibaba.fastjson.JSON;
import com.jeesite.common.config.Global;
import com.jeesite.common.entity.Page;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.calresult.entity.Calresult;
import com.jeesite.modules.calresult.service.CalresultService;
import com.jeesite.modules.file.entity.FileUpload;
import com.jeesite.modules.file.utils.FileUploadUtils;
import com.jeesite.modules.test.entity.Client;
import com.jeesite.modules.test.entity.Face;
import com.jeesite.modules.test.entity.facedatabase.FaceInfo;
import com.jeesite.modules.test.entity.facedatabase.FacePicture;
import com.jeesite.modules.test.service.facedatabase.FaceInfoService;
import com.jeesite.modules.test.service.facedatabase.FacePictureService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping(value = "${adminPath}/srv/faceInfo")
public class FaceController extends BaseController {


    @Autowired
    private FaceInfoService faceInfoService;

    @Autowired
    private FacePictureService facePictureService;

    @Autowired
    private CalresultService calresultService;


    @ModelAttribute
    public FaceInfo get(String id, boolean isNewRecord) {
        return faceInfoService.get(id, isNewRecord);
    }
    /**
     * 查询列表
     *
     * */
//    // @RequiresPermissions("srv:faceInfo:view")
    @RequestMapping(value = {"list", ""})
    public String list(Face face ,Model model) {
        model.addAttribute("face",face);
        return "modules/srv/faceInfo/faceInfoList";
    }

    /**
     * 查看编辑表单
     */
//    // @RequiresPermissions("srv:faceInfo:view")
    @RequestMapping(value = "form")
    public String form(Face face, Model model) {
        model.addAttribute("face", face);
        return "modules/srv/faceInfo/faceInfoForm";
    }


    /**
     * 保存人脸 是add还是alter根据Face里的id判断，图片路径也可以根据Face得到
     */
    //// @RequiresPermissions("srv:faceInfo:edit")
    @RequestMapping(value = "save")
    @ResponseBody
    public String addFace(Face face, Model model) throws IOException {
        FacePicture facePicture=new FacePicture();
        facePictureService.save(facePicture,"faceInfo_image");
        List<FileUpload> fileUploads=FileUploadUtils.findFileUpload(facePicture.getId(), "faceInfo_image");
        StringBuilder filepath=new StringBuilder();
        StringBuilder filename=new StringBuilder();

        for (FileUpload fUpload : fileUploads) {
            filename.append(fUpload.getFileName());
            filepath.append(fUpload.getFileUrl());
        }
        facePicture.setFilename(filename.toString());
        facePicture.setFilepath(filepath.toString());
        //传送图片数据到app
        //插入日志
        System.out.println("filepath——"+face.getId());

        if(face.getId().equals("")||face.getId()==null){
            faceInfoService.addBefore(facePicture,face.getClientName());
        }
        else
            faceInfoService.updateBefore(face.getId(),facePicture);
        return renderResult(Global.TRUE, text("正在保存faceInfo！"));
    }




    //// @RequiresPermissions("srv:faceInfo:view")
    @RequestMapping(value = "pictureform")
    public String facePictureform(FacePicture facePicture, Model model) {
        model.addAttribute("facePicture", facePicture);
        return "modules/srv/faceProp/faceProp";
    }
    /**
     * 人脸属性检测和分析
     */
    //// @RequiresPermissions("srv:faceInfo:edit")
    @RequestMapping(value = "check")
    //@ResponseBody
    public String checkFace(FacePicture facePicture,Model model) throws IOException {
        facePictureService.save(facePicture,"facepicture_picture");
        List<FileUpload> fileUploads=FileUploadUtils.findFileUpload(facePicture.getId(), "facepicture_picture");
        StringBuilder filepath=new StringBuilder();
        StringBuilder filename=new StringBuilder();

        for (FileUpload fUpload : fileUploads) {
            filename.append(fUpload.getFileName());
            filepath.append(fUpload.getFileUrl());
        }
        facePicture.setFilename(filename.toString());
        facePicture.setFilepath(filepath.toString());
        facePictureService.update(facePicture);
        //System.out.println("filepath——"+facePicture.getFilepath());
        faceInfoService.sendData(filepath.toString(),null,facePicture.getId(),faceInfoService.transition("facecharactercheck"));
        //return renderResult(Global.TRUE, text("提交成功，正在分析中！"));
        List<Calresult> calresult=calresultService.findList();
        model.addAttribute("calresult",calresult);

        return "modules/srv/calresult/calresultList";
    }
    /**
     * 活体人脸检测
     */

    //// @RequiresPermissions("srv:faceInfo:view")
    @RequestMapping(value = "livingform")
    public String livingform(FacePicture facePicture, Model model) {
        model.addAttribute("facePicture", facePicture);
        return "modules/srv/faceProp/living";
    }

    //// @RequiresPermissions("srv:faceInfo:edit")
    @RequestMapping(value = "living")
    //ResponseBody
    public String checkLiving(FacePicture facePicture,Model model) throws IOException {
        facePictureService.save(facePicture,"facepicture_picture");
        List<FileUpload> fileUploads=FileUploadUtils.findFileUpload(facePicture.getId(), "facepicture_picture");
        StringBuilder filepath=new StringBuilder();
        StringBuilder filename=new StringBuilder();

        for (FileUpload fUpload : fileUploads) {
            filename.append(fUpload.getFileName());
            filepath.append(fUpload.getFileUrl());
        }
        facePicture.setFilename(filename.toString());
        facePicture.setFilepath(filepath.toString());
        facePictureService.update(facePicture);
        //System.out.println("filepath——"+facePicture.getFilepath());
        faceInfoService.sendData(facePicture.getFilepath(),null,facePicture.getId(),faceInfoService.transition("biopsy"));
        //return renderResult(Global.TRUE, text("提交成功，正在检测中！"));
        List<Calresult> calresult=calresultService.findList();
        model.addAttribute("calresult",calresult);

        return "modules/srv/calresult/calresultList";
    }

    //// @RequiresPermissions("srv:faceInfo:edit")
    @RequestMapping(value = "delete")
    @ResponseBody
    public String deleteFace(Face face){
        if(face==null)return renderResult(Global.FALSE, text("数据为空！"));
        faceInfoService.delete(face.getId());
        return renderResult(Global.TRUE, text("删除faceInfo成功！"));
    }

    /**
     * 查询列表数据，这个是搜索功能，暂时先不用管
     */

    //// @RequiresPermissions("srv:faceInfo:view")
    @RequestMapping(value = "listData")
    @ResponseBody
    public Page<FaceInfo> listData(FaceInfo faceInfo, HttpServletRequest request, HttpServletResponse response) {
        faceInfo.setPage(new Page<>(request, response));
        Page<FaceInfo> page = faceInfoService.findPage(faceInfo);
        return page;
    }

    @RequestMapping(value = "client")
    public String client(Face face, Model model) {
        model.addAttribute("face", face);
        return "modules/srv/faceInfo/updateClient";
    }

    @PostMapping("/updateclient")
    @ResponseBody
    public String editClient(Face face){
        faceInfoService.editClient(face.getId(),face.getClientName());
        return renderResult(Global.TRUE, text("修改所属用户成功！"));
    }

    /*//// @RequiresPermissions("srv:faceInfo:view")
    @RequestMapping(value = {"list", ""})
    public List<Face> getList() {
        return faceInfoService.findList();
    }

    //// @RequiresPermissions("srv:faceInfo:edit")
    @RequestMapping(value = "save")
    @ResponseBody
    public String addFace(String filepath) throws IOException {
        //传送图片数据到app
        faceInfoService.addBefore(filepath);
        return renderResult(Global.TRUE, text("正在保存faceInfo！"));
    }

    //// @RequiresPermissions("srv:faceInfo:edit")
    @RequestMapping(value = "alter")
    @ResponseBody
    public String alterFace(String filepath,String faceinfoId) throws IOException {
        //传送图片数据到app
        faceInfoService.updateBefore(faceinfoId,filepath);
        return renderResult(Global.TRUE, text("正在修改faceInfo！"));
    }
    //// @RequiresPermissions("srv:faceInfo:edit")
    @RequestMapping(value = "delete")
    @ResponseBody
    public String deleteFace(String id){
        if(id==null||id.length()==0)return renderResult(Global.FALSE, text("数据为空！"));
        faceInfoService.delete(id);
        return renderResult(Global.TRUE, text("删除faceInfo成功！"));
    }*/
}
