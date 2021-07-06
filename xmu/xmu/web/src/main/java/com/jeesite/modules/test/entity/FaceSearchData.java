/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.test.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jeesite.common.collect.ListUtils;
import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.JoinTable;
import com.jeesite.common.mybatis.annotation.JoinTable.Type;
import com.jeesite.common.mybatis.annotation.Table;
import com.jeesite.common.mybatis.mapper.query.QueryType;
import com.jeesite.modules.sys.entity.Office;
import com.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

/**
 * 测试数据Entity
 * @author ThinkGem
 * @version 2018-04-22
 */
@Table(name="fsData", alias="a", columns={
		@Column(name="id", attrName="id", label="编号", isPK=true),
		@Column(name="user_id", attrName="userId", label="身份证号", queryType=QueryType.LIKE),
		@Column(name="user_name", attrName="userName", label="姓名", queryType=QueryType.LIKE),
		@Column(name="test_select", attrName="testSelect", label="下拉框"),
	}
)
public class FaceSearchData extends DataEntity<FaceSearchData> {

	private String userId;			// 身份证号
	private String userName;		// 姓名
	private String testSelect;      //下拉框

	public FaceSearchData() {
		this(null);
	}

	public FaceSearchData(String id){
		super(id);
	}
	
	@Length(min=0, max=200, message="单行文本长度不能超过 200 个字符")
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Length(min=0, max=200, message="多行文本长度不能超过 200 个字符")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Length(min=0, max=10, message="下拉框长度不能超过 10 个字符")
	public String getTestSelect() {
		return testSelect;
	}

	public void setTestSelect(String testSelect) {
		this.testSelect = testSelect;
	}
}