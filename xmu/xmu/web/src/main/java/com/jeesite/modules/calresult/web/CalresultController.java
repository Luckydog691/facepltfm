/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.calresult.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeesite.common.config.Global;
import com.jeesite.common.entity.Page;
import com.jeesite.common.web.BaseController;
import com.jeesite.modules.calresult.entity.Calresult;
import com.jeesite.modules.calresult.service.CalresultService;

/**
 * calresultController
 * @author w
 * @version 2020-04-21
 */
@Controller
@RequestMapping(value = "${adminPath}/srv/calresult")
public class CalresultController extends BaseController {

	@Autowired
	private CalresultService calresultService;
	
	/**
	 * 获取数据
	 */
	@ModelAttribute
	public Calresult get(String id, boolean isNewRecord) {
		return calresultService.get(id, isNewRecord);
	}
	
	/**
	 * 查询列表
	 */
	// @RequiresPermissions("calresult:view")
	@RequestMapping(value = {"list", ""})
	public String list(Calresult calresult, Model model) {
		model.addAttribute("calresult", calresult);
		return "modules/srv/calresult/calresultList";
	}
	
	/**
	 * 查询列表数据
	 */
	// @RequiresPermissions("calresult:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public Page<Calresult> listData(Calresult calresult, HttpServletRequest request, HttpServletResponse response) {
		calresult.setPage(new Page<>(request, response));
		Page<Calresult> page = calresultService.findPage(calresult);
		return page;
	}

	/**
	 * 查看编辑表单
	 */
	// @RequiresPermissions("calresult:view")
	@RequestMapping(value = "form")
	public String form(Calresult calresult, Model model) {
		model.addAttribute("calresult", calresult);
		return "modules/srv/calresult/calresultForm";
	}
}