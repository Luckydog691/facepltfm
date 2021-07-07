/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.aipface.test;

import com.baidu.aip.face.AipFace;
import com.jeesite.common.collect.ListUtils;
import com.jeesite.common.idgen.IdGen;
import com.jeesite.common.tests.BaseSpringContextTests;
import com.jeesite.modules.Application;
import com.jeesite.aipface.ConnectionSingleton;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 百度云AIPFace测试
 * @author Jiuyi Liu
 */
@ActiveProfiles("test")
@SpringBootTest(classes=Application.class)
public class AipFaceTest extends BaseSpringContextTests {
	@Test
	public void testData() throws Exception {
		AipFace inst = ConnectionSingleton.getInstance();

		String image = "src/main/resources/img/black.jpg";
		String imageType = "BASE64";
		// 传入可选参数调用接口
		HashMap<String, String> options = new HashMap<String, String>();
		options.put("face_field", "age");
		options.put("max_face_num", "2");
		options.put("face_type", "LIVE");
		options.put("liveness_control", "LOW");

		System.out.println(inst.detect(image,imageType,options));

	}
}
