package com.jeesite.modules.aipface;

import org.junit.Test;


public class baidutest {

    static AipfaceFaceOperationHelper afoh = new AipfaceFaceOperationHelper();
    static AipfaceDetectHelper adh = new AipfaceDetectHelper();
    static AipfaceFaceSearchHelper afsh = new AipfaceFaceSearchHelper();

    @Test
    public void detest()
    {
        adh.detect("src/main/resources/img/black.jpg");
    }

    @Test
    public void searchNtest()
    {
        adh.searchOneToN("src/main/resources/img/black.jpg", "LawrenLang", 1);
    }

    @Test
    public void searchOtest()
    {
        adh.searchOneToOne("src/main/resources/img/black.jpg", "LawrenLang", "nig2", 1);
    }

    @Test
    public void addtest()
    {
        afoh.add("src/main/resources/img/black2.jpg", "LawrenLang", "nig2");
    }

    @Test
    public void uptest()
    {
        afoh.update("src/main/resources/img/black.jpg", "LawrenLang", "nig");
    }

    @Test
    public void deltest()
    {
        afoh.delete("LawrenLang", "nig2", "bc3a3ae5dd69b9edbfc5ba2695659092");
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
