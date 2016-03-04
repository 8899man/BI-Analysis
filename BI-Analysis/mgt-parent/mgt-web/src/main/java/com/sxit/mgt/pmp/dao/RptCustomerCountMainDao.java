package com.sxit.mgt.pmp.dao;

import com.sxit.model.pmp.RptCustomerCountMain;

/**
 * RptCustomerCountMain Mapper
 * @author Administrator
 *
 */
public interface RptCustomerCountMainDao{
	
	/**
	 * 根据项目ID获取指标值
	 */
	public RptCustomerCountMain getRptCustomerCountMainById(String proj_guid);
}
