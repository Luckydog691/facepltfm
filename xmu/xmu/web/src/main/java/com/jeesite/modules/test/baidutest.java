package com.jeesite.modules.test;

import com.jeesite.modules.aipface.AipfaceDetectHelper;
import com.jeesite.modules.aipface.AipfaceFaceOperationHelper;
import org.junit.Test;


public class baidutest {

    static AipfaceFaceOperationHelper app = new AipfaceFaceOperationHelper();
    static AipfaceDetectHelper aipfaceFaceOperationHelper = new AipfaceDetectHelper();

    @Test
    public void detest()
    {
        aipfaceFaceOperationHelper.detect("src/main/resources/img/black.jpg");
    }

    @Test
    public void addtest()
    {
        app.add("src/main/resources/img/black.jpg", "LawrenLang", "nig");
    }

    @Test
    public void deltest()
    {
        app.delete("LawrenLang", "nig", "bc3a3ae5dd69b9edbfc5ba2695659092");
    }
}
