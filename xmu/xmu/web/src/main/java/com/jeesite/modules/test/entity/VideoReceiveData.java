package com.jeesite.modules.test.entity;

import java.util.Date;

public class VideoReceiveData {
    private String calresultid;
    private Date finishtime;
    private String operatetype;
    private String result;
    private String uri;
    private String resultpicture;

    public VideoReceiveData() {
    }

    public VideoReceiveData(String calresultid, Date finishtime, String operatetype, String result, String uri, String resultpicture) {
        this.calresultid = calresultid;
        this.finishtime = finishtime;
        this.operatetype = operatetype;
        this.result = result;
        this.uri = uri;
        this.resultpicture = resultpicture;
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

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getResultpicture() {
        return resultpicture;
    }

    public void setResultpicture(String resultpicture) {
        this.resultpicture = resultpicture;
    }

    @Override
    public String toString() {
        return "VideoReceiveData{" +
                "calresultid='" + calresultid + '\'' +
                ", finishtime=" + finishtime +
                ", operatetype='" + operatetype + '\'' +
                ", result='" + result + '\'' +
                ", uri='" + uri + '\'' +
                ", resultpicture='" + resultpicture + '\'' +
                '}';
    }

}
