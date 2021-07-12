package com.jeesite.modules.test;

import com.jeesite.modules.aipface.AipfaceHelper;
import org.junit.Test;


public class baidutest {
    @Test
    public void test()
    {
        AipfaceHelper aipfaceHelper = new AipfaceHelper();
        aipfaceHelper.detect("src/main/resources/img/black.jpg");
    }
}
