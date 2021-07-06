/**
 * Copyright (c) 2013-Now http://jeesite.com All rights reserved.
 */
package com.jeesite.modules.calresult.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeesite.common.entity.Page;
import com.jeesite.common.service.CrudService;
import com.jeesite.modules.calresult.entity.Calresult;
import com.jeesite.modules.calresult.dao.CalresultDao;

/**
 * calresultService
 * @author w
 * @version 2020-04-21
 */
@Service
@Transactional(readOnly=true)
public class CalresultService extends CrudService<CalresultDao, Calresult> {
	@Autowired
	private CalresultDao calresultDao;
	/**
	 * 获取单条数据
	 * @param calresult
	 * @return
	 */
	@Override
	public Calresult get(Calresult calresult) {
		return super.get(calresult);
	}
	
	/**
	 * 查询分页数据
	 * @param calresult 查询条件
	 * @param calresult.page 分页对象
	 * @return
	 */
	@Override
	public Page<Calresult> findPage(Calresult calresult) {
		return super.findPage(calresult);
	}
	
	/**
	 * 保存数据（插入或更新）
	 * @param calresult
	 */
	@Override
	@Transactional(readOnly=false)
	public void save(Calresult calresult) {
		super.save(calresult);
	}
	
	/**
	 * 更新状态
	 * @param calresult
	 */
	@Override
	@Transactional(readOnly=false)
	public void updateStatus(Calresult calresult) {
		super.updateStatus(calresult);
	}
	
	/**
	 * 删除数据
	 * @param calresult
	 */
	@Override
	@Transactional(readOnly=false)
	public void delete(Calresult calresult) {
		super.delete(calresult);
	}

	@Transactional(readOnly=false)
	public List<Calresult> findList() {
		return calresultDao.findList();
	}

    @Override
    @Transactional(readOnly=false)
    public void insert(Calresult calresult) {
        super.insert(calresult);
    }
	
}