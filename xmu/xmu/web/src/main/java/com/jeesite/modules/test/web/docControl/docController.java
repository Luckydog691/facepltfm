package com.jeesite.modules.test.web.docControl;

import com.jeesite.common.config.Global;
import com.jeesite.common.entity.Page;
import com.jeesite.common.io.FileUtils;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.file.entity.FileUpload;
import com.jeesite.modules.file.utils.FileUploadUtils;
import com.jeesite.modules.sys.utils.UserUtils;
import com.jeesite.modules.test.dao.DocDao;
import com.jeesite.modules.test.entity.Doc;
import com.jeesite.modules.test.entity.TestData;
import com.jeesite.modules.test.entity.facedatabase.FaceInfo;
import com.jeesite.modules.test.entity.facedatabase.FacePicture;
import com.jeesite.modules.test.service.DocService;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;


@Controller
@RequestMapping(value="${adminPath}/doc")
public class docController extends BaseController {

    @Autowired
    private DocService docService;

    @ModelAttribute
    public Doc get(String id, boolean isNewRecord) {
        return docService.get(id, isNewRecord);
    }

    @RequestMapping(value = "upload")
    public String toUploadPage(Doc doc,Model model){
        model.addAttribute("doc", doc);
        return "modules/app/docUpload";
    }

//    // @RequiresPermissions("doc:edit")
    @RequestMapping(value = "list")
    public String list(Doc doc, Model model) {
        model.addAttribute("doc",doc);
        return "modules/app/docList";
    }
    @RequestMapping(value = "listNormalUser")
    public String list2(Doc doc, Model model) {
        model.addAttribute("doc",doc);
        return "modules/app/docListNormalUser";
    }
    @RequestMapping(value = "form")
    public String form(Doc doc, Model model) {
        model.addAttribute("doc",doc);
        return "modules/app/docForm";
    }
    @RequestMapping(value = "formNormalUser")
    public String form2(Doc doc, Model model) {
        model.addAttribute("doc",doc);
        return "modules/app/docFormNormalUser";
    }

    @PostMapping(value = "uploadmethod")
    @ResponseBody
    public String uploadFile(Doc doc, Model model){
        docService.save(doc,"doc_file");
        //set time
        Date date=new Date();
        SimpleDateFormat temp=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String Date=temp.format(date);
        doc.setUploadtime(Date);
        doc.setUploadUserCode(UserUtils.getUser().getId());

        List<FileUpload> fileUploads=FileUploadUtils.findFileUpload(doc.getId(), "doc_file");
        StringBuilder filepath=new StringBuilder();
        StringBuilder filename=new StringBuilder();

        for (FileUpload fUpload : fileUploads) {

            filename.append(fUpload.getFileName()+";");
            filepath.append(fUpload.getFileUrl()+";");
        }
        logger.info("111111111"+doc.getTitle());
        doc.setFilename(filename.toString());
        doc.setFilepath(filepath.toString());
        docService.update(doc);
        return renderResult(Global.TRUE,"文档增加成功");
    }
    @PostMapping(value = "update")
    @ResponseBody
    public String update(Doc doc, Model model){
        List<FileUpload> fileUploads=FileUploadUtils.findFileUpload(doc.getId(), "doc_file");
        StringBuilder filepath=new StringBuilder();
        StringBuilder filename=new StringBuilder();

        for (FileUpload fUpload : fileUploads) {
            filename.append(fUpload.getFileName()+";");
            filepath.append(fUpload.getFileUrl()+";");
        }
        doc.setFilename(filename.toString());
        doc.setFilepath(filepath.toString());
        docService.update(doc);
        return renderResult(Global.TRUE,"修改成功");
    }
    @PostMapping(value = "delete")
    @ResponseBody
    public String delete(Doc doc, Model model){
        docService.delete(doc);
        return renderResult(Global.TRUE,"删除成功");
    }
    @RequestMapping(value = "listData")
    @ResponseBody
    public Page<Doc> listData(Doc doc, HttpServletRequest request, HttpServletResponse response) {
        doc.setPage(new Page<>(request, response));
        Page<Doc> page = docService.findPage(doc);
        page.setOrderBy(doc.getUploadtime());
        return page;
    }

    @RequestMapping(value = {"download"})
    public ResponseEntity<byte[]> EIToolDownloads(HttpServletRequest request, HttpServletResponse response, String filepath) throws IOException {
        //String doenLoadPath = "C:\\Users\\xlin\\Desktop\\1\\test.jpg";  // doenLoadPath是文件路径(一般指服务器上的磁盘位置)
        File file = new File("C:/jeesite"+filepath);
        if(file.exists()){
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment", file.getName());
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
        }else{
            System.out.println("文件不存在,请重试...");
            return null;
        }
    }
}
