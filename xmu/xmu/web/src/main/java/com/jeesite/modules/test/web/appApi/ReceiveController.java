package com.jeesite.modules.test.web.appApi;

import com.jeesite.common.web.BaseController;
import com.jeesite.modules.test.entity.ReceiveData;
import com.jeesite.modules.test.service.facedatabase.FaceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.text.ParseException;

//@CrossOrigin
@Controller
@RequestMapping(value ="${frontPath}/appApi/send")
public class ReceiveController extends BaseController {

    @Autowired
    private FaceInfoService faceInfoService;

    @PostMapping("/faceinfoupdate")
    public void faceUpdate(@RequestBody ReceiveData receiveData) throws IOException, ParseException {
        if(receiveData==null){
            System.out.println("appApi/send/faceinfoupdate接口接收数据为空");
            return;
        }
        faceInfoService.update(receiveData);
    }
    @PostMapping("/faceinfoadd")
    public void faceAdd(@RequestBody ReceiveData receiveData) throws IOException, ParseException {
        if(receiveData==null){
            System.out.println("appApi/send/faceinfoadd接口接收数据为空");
            return;
        }
        //System.out.println(receiveData);
        faceInfoService.add(receiveData);
    }
    @PostMapping("/biopsy")
    public void isBiopsy(@RequestBody ReceiveData receiveData) throws ParseException {
        if(receiveData==null){
            System.out.println("appApi/send/biopsy接口接收数据为空");
            return;
        }
        //System.out.println(receiveData);
        faceInfoService.isBiopsy(receiveData);
    }

    @PostMapping("/facecharactercheck")
    public void faceCharacterCheck(@RequestBody ReceiveData receiveData) throws ParseException {
        if(receiveData==null){
            System.out.println("appApi/send/facecharactercheck接口接收数据为空");
            return;
        }
        //System.out.println(receiveData);
        if(receiveData.getResult().equals("success"))
            faceInfoService.faceCharacterCheck(receiveData);
        else
            faceInfoService.faceCharacterCheckFail(receiveData);
    }
}
