package com.jeesite.modules.test.entity;

import com.jeesite.modules.test.entity.facedatabase.FaceInfo;

import java.util.Date;

public class SendData {
    private String calresultid;
    private String operateType;
    private String faceinfoid;
    private PictureData picturedata;

    public SendData(String calresultid, String operateType, String faceinfoid, PictureData picturedata) {
        this.calresultid = calresultid;
        this.operateType = operateType;
        this.faceinfoid = faceinfoid;
        this.picturedata = picturedata;
    }

    @Override
    public String toString() {
        return "{" +
                "\"calresultid\":\"" + calresultid + '\"' +
                ", \"operateType\":\"" + operateType + '\"' +
                ", \"faceinfoid\":\"" + faceinfoid + '\"' +
                ", \"picturedata\":" + picturedata +
                "}";
    }


}
