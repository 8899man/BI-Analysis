package com.sxit.mgt.pmp.service;

import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.pmp.dao.IndexFlowDao;
import com.sxit.model.pmp.IndexBase;
import com.sxit.model.pmp.IndexFlow;

/**
 * 
 * <br>
 * <b>功能：</b>IndexFlowService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> 23 9, 2015 <br>
 * <b>版权所有： 2015，WWW.SXIT.COM.CN<br>
 */
@Service("indexFlowService")
public class IndexFlowService{
	private final static Logger log= Logger.getLogger(IndexFlowService.class);
	
	@Autowired
	private IndexFlowDao indexFlowDao;
	
	/**
	 * 新增关键流程汇总表
	 **/
	@Transactional
	public void insert(IndexFlow indexFlow) {
		indexFlowDao.insert(indexFlow);
	}
	
	/**
	 * 分页列表 关键流程汇总表
	 **/
	public Page<IndexFlow> getindexFlowList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return indexFlowDao.getIndexFlowList(map);
	}
	
	/**
	 * 根据项目ID获取指标值
	 */
	public IndexFlow getIndexFlowById(String pguid){
		return indexFlowDao.getIndexFlowById(pguid);
	}
}
