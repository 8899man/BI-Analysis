package com.sxit.mgt.pmp.dao;

import java.util.Map;

import com.sxit.common.pagehelper.Page;
import com.sxit.model.pmp.IndexBase;
import com.sxit.model.pmp.IndexFlow;

/**
 * @公司:深讯信科
 * @功能:IndexFlow Dao
 * @作者:Edson.di   
 * @日期:2015-09-23 09:43:07  
 * @版本:1.0
 * @修改:
 */
public interface IndexFlowDao{
	
	/**
	 *  新增关键流程汇总表
	 **/
	public int insert(IndexFlow indexFlow);
	
	/**
	 *  查询关键流程汇总表
	 **/
	
	public Page<IndexFlow> getIndexFlowList(Map map);
	
	/**
	 * 根据项目ID获取指标值
	 */
	public IndexFlow getIndexFlowById(String proj_guid);
	
}
