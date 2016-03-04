package com.sxit.mgt.pmp.dao;

import java.util.List;
import java.util.Map;

import com.sxit.common.pagehelper.Page;
import com.sxit.model.pmp.IndexBase;

/**
 * @公司:深讯信科
 * @功能:IndexBase Dao
 * @作者:Edson.di   
 * @日期:2015-09-24 09:43:07  
 * @版本:1.0
 * @修改:
 */
public interface IndexBaseDao {
	/**
	 *  分页列表系统用户列表
	 **/
	public Page<IndexBase> getIndexBaseList(Map map);
	
    /**
	 *  新增关键指标汇总
	 **/
	public int insert(IndexBase indexBase);
	
	/**
	 * 根据项目ID获取指标值
	 */
	public IndexBase getIndexBaseById(String proj_guid);	
}
