package com.jeesite.modules.test;

import com.jeesite.modules.aipface.AipfaceDetectHelper;
import org.junit.Test;


public class baidutest {
    @Test
    public void test()
    {
        AipfaceDetectHelper aipfaceDetectHelper = new AipfaceDetectHelper();
        aipfaceDetectHelper.detect("src/main/resources/img/black.jpg");
    }
}
