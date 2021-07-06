package com.jeesite.modules.test.web;

import com.jeesite.common.config.Global;
import com.jeesite.common.entity.Page;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.test.entity.Client;
import com.jeesite.modules.test.entity.Doc;
import com.jeesite.modules.test.entity.Face;
import com.jeesite.modules.test.entity.facedatabase.FaceInfo;
import com.jeesite.modules.test.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "${adminPath}/srv/client")
public class ClientController extends BaseController {

    @Autowired
    private ClientService clientService;

    @ModelAttribute
    public Client get(String id, boolean isNewRecord) {
        return clientService.get(id, isNewRecord);
    }

    //// @RequiresPermissions("srv:faceInfo:view")
    @RequestMapping(value = {"list", ""})
    public String list(Client client ,Model model) {
        model.addAttribute("client",client);
        return "modules/srv/faceInfo/clientlist";
    }

    @RequestMapping(value = "form")
    public String form(Client client, Model model) {
        model.addAttribute("client", client);
        return "modules/srv/faceInfo/clientForm";
    }
    @RequestMapping(value = "faceform")
    public String faceform(FaceInfo faceinfo, Model model) {
        model.addAttribute("faceinfo", faceinfo);
        return "modules/srv/faceInfo/faces";
    }
    @RequestMapping(value = "facelist")
    @ResponseBody
    public List<FaceInfo> faceList(FaceInfo faceInfo) {
        /*client.setPage(new Page<>(request, response));
        Page<Client> page = clientService.findPage(client);*/
        System.out.println(faceInfo.getId());
        return clientService.findFaceById(faceInfo.getId());
    }

    @RequestMapping(value = "listData")
    @ResponseBody
    public List<Client> listData() {
        /*client.setPage(new Page<>(request, response));
        Page<Client> page = clientService.findPage(client);*/
        return clientService.findList();
    }

    @RequestMapping(value = "save")
    @ResponseBody
    public String save(Client client) {
        clientService.save(client);
        return renderResult(Global.TRUE, text("保存client成功！"));
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public String delete(Client client) {
        clientService.delete(client);
        return renderResult(Global.TRUE, text("删除client成功！"));
    }
}
