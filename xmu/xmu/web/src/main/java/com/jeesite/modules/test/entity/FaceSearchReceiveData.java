package com.jeesite.modules.test.entity;


import java.util.Date;

public class FaceSearchReceiveData {
    private String calresultid;
    private Date finishtime;
    private String operatetype;
    private String result;
    private String facepictureid;
    private String resultpictureid;

    public FaceSearchReceiveData() {
    }

    public FaceSearchReceiveData(String calresultid, Date finishtime, String operatetype, String result, String facepictureid, String resultpictureid) {
        this.calresultid = calresultid;
        this.finishtime = finishtime;
        this.operatetype = operatetype;
        this.result = result;
        this.facepictureid = facepictureid;
        this.resultpictureid = resultpictureid;
    }

    public String getCalresultid() {
        return calresultid;
    }

    public void setCalresultid(String calresultid) {
        this.calresultid = calresultid;
    }

    public Date getFinishtime() {
        return finishtime;
    }

    public void setFinishtime(Date finishtime) {
        this.finishtime = finishtime;
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

    public String getFacepictureid() {
        return facepictureid;
    }

    public void setFacepictureid(String facepictureid) {
        this.facepictureid = facepictureid;
    }

    public String getResultpictureid() {
        return resultpictureid;
    }

    public void setResultpictureid(String resultpictureid) {
        this.resultpictureid = resultpictureid;
    }

    @Override
    public String toString() {
        return "FaceSearchReceiveData{" +
                "calresultid='" + calresultid + '\'' +
                ", finishtime=" + finishtime +
                ", operatetype='" + operatetype + '\'' +
                ", result='" + result + '\'' +
                ", facepictureid='" + facepictureid + '\'' +
                ", resultpictureid='" + resultpictureid + '\'' +
                '}';
    }
}
