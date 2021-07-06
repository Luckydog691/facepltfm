package com.jeesite.modules.test.entity;

import com.jeesite.modules.test.entity.facedatabase.FaceInfo;

import java.util.Arrays;
import java.util.Date;

public class ReceiveData {
    private String calresultid;
    private String finishtime;
    private String operatetype;
    private String result;
    private String faceinfoid;
    private int age;
    private String expression;
    private String gender;
    private String glasses;
    private String race;
    private int threshold;
    private String operateuserid;
    private String context;
    private String feature;
    private FaceInfo faceinfo;
    private String facepictureid;

    public String getCalresultid() {
        return calresultid;
    }

    public void setCalresultid(String calresultid) {
        this.calresultid = calresultid;
    }

    public void setFinishtime(String finishtime) {
        this.finishtime = finishtime;
    }

    public String getFinishtime() {
        return finishtime;
    }

    public String getOperatetype() {
        return operatetype;
    }

    public void setOperatetype(String operatetype) {
        this.operatetype = operatetype;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getFaceinfoid() {
        return faceinfoid;
    }

    public void setFaceinfoid(String faceinfoid) {
        this.faceinfoid = faceinfoid;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getExpression() {
        return expression;
    }

    public void setExpression(String expression) {
        this.expression = expression;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGlasses() {
        return glasses;
    }

    public void setGlasses(String glasses) {
        this.glasses = glasses;
    }

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race;
    }

    public int getThreshold() {
        return threshold;
    }

    public void setThreshold(int threshold) {
        this.threshold = threshold;
    }

    public String getOperateuserid() {
        return operateuserid;
    }

    public void setOperateuserid(String operateuserid) {
        this.operateuserid = operateuserid;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public FaceInfo getFaceinfo() {
        return faceinfo;
    }

    public void setFaceinfo(FaceInfo faceinfo) {
        this.faceinfo = faceinfo;
    }

    public String getFacepictureid(){return  facepictureid;}

    public void setFacepictureid(String facepictureid){this.facepictureid=facepictureid;}
}
