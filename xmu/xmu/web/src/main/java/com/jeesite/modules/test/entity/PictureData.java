package com.jeesite.modules.test.entity;

public class PictureData {
    private String facepictureid;
    private String data;


    public PictureData(String facepictureid, String data) {
        this.facepictureid = facepictureid;
        this.data = data;
    }

    /*@Override
    public String toString() {
        return "{" +
                "\"facepictureid\":\"" + facepictureid + '\"' +
                ", \"data\":\"" + data + '\"' +
                "}";
    }*/
}
