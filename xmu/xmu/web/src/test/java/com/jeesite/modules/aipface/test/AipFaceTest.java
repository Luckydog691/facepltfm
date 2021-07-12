/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.aipface.test;

import com.jeesite.common.tests.BaseSpringContextTests;
import com.jeesite.modules.Application;
import com.jeesite.modules.aipface.AipfaceDetectHelper;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

/**
 * 百度云AIPFace测试
 * @author Jiuyi Liu
 */
@ActiveProfiles("test")
@SpringBootTest(classes=Application.class)
public class AipFaceTest extends BaseSpringContextTests {

	@Test
	public void testDetect()
	{
		AipfaceDetectHelper helper = new AipfaceDetectHelper();
		helper.detect("src/main/resources/img/black.jpg");
	}

}
