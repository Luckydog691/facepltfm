package com.jeesite.modules.aipface;

import org.junit.Test;


public class baidutest {

    static AipfaceFaceOperationHelper app = new AipfaceFaceOperationHelper();
    static AipfaceDetectHelper aipfaceFaceOperationHelper = new AipfaceDetectHelper();
    static AipfaceFaceSearchHelper afsh = new AipfaceFaceSearchHelper();

    @Test
    public void detest()
    {
        aipfaceFaceOperationHelper.detect("src/main/resources/img/black.jpg");
    }

    @Test
    public void addtest()
    {
        app.add("src/main/resources/img/black2.jpg", "LawrenLang", "nig2");
    }

    @Test
    public void uptest()
    {
        app.update("src/main/resources/img/black2.jpg", "LawrenLang", "nig");
    }

    @Test
    public void deltest()
    {
        app.delete("LawrenLang", "nig2", "bc3a3ae5dd69b9edbfc5ba2695659092");
    }

    @Test
    public void selUtest()
    {
        afsh.selectUser("LawrenLang", "nig");
    }

    @Test
    public void selULtest()
    {
        afsh.selectUserList("LawrenLang", 5);
    }

    @Test
    public void selGLtest()
    {
        afsh.selectGroupList(5);
    }
}
