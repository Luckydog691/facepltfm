/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.calresult.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.jeesite.common.mybatis.annotation.JoinTable;
import com.jeesite.common.mybatis.annotation.JoinTable.Type;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;

import com.jeesite.common.entity.DataEntity;
import com.jeesite.common.mybatis.annotation.Column;
import com.jeesite.common.mybatis.annotation.Table;
import com.jeesite.common.mybatis.mapper.query.QueryType;

/**
 * calresultEntity
 * @author w
 * @version 2020-04-21
 */
@Table(name="calresult", alias="a", columns={
		@Column(name="id", attrName="id", label="id", isPK=true),
		@Column(name="startTime", attrName="startTime"),
		@Column(name="finishTime", attrName="finishTime"),
		@Column(name="operateType", attrName="operateType"),
		@Column(name="operateUserID", attrName="operateUserID"),
		@Column(name="result", attrName="result", label="result"),
		@Column(name="context", attrName="context", label="context"),
	}, orderBy="a.id DESC"
)
public class Calresult extends DataEntity<Calresult> {
	
	private static final long serialVersionUID = 1L;
	private Date startTime;		// starttime
	private Date finishTime;		// finishtime
	private String operateType;		// operatetype
	private String operateUserID;		// operateuserid
	private String result;		// result
	private String context;		// context
	
	public Calresult() {
		this(null);
	}

	public Calresult(String id){
		super(id);
	}


	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}


	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}
	
	@Length(min=0, max=45, message="operateType长度不能超过 45 个字符")
	public String getOperateType() {
		return operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	
	@Length(min=0, max=45, message="operateUserID长度不能超过 45 个字符")
	public String getOperateUserID() {
		return operateUserID;
	}

	public void setOperateUserID(String operateUserID) {
		this.operateUserID = operateUserID;
	}
	
	@Length(min=0, max=45, message="result长度不能超过 45 个字符")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

}