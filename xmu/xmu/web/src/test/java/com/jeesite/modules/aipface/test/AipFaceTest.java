/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.aipface.test;

import com.jeesite.common.tests.BaseSpringContextTests;
import com.jeesite.modules.Application;
import com.jeesite.modules.aipface.service.AipfaceFaceSearchHelper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

/**
 * 百度云AIPFace测试
 * @author Jiuyi Liu
 */
@ActiveProfiles("test")
@SpringBootTest(classes=Application.class)
public class AipFaceTest extends BaseSpringContextTests {

    @Autowired
	AipfaceFaceSearchHelper aipfaceFaceSearchHelper;
	@Test
	public void testDetect()
	{
		System.out.println(aipfaceFaceSearchHelper.selectGroupList(10));
		System.out.println(aipfaceFaceSearchHelper.selectUserList("lawrenlang",10));
		System.out.println(aipfaceFaceSearchHelper.selectFaceList("lawrenlang","lrl"));
	}

}
