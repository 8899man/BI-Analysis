package com.sxit.mgt.pmp.dao;

import com.sxit.model.pmp.RptCustomerBoughtCount;;

/**
 * RptCustomerBoughtCount Mapper
 * @author Administrator
 *
 */
public interface RptCustomerBoughtCountDao{
	/**
	 * 根据项目ID获取指标值
	 */
	public RptCustomerBoughtCount RptCustomerBoughtCountById(String proj_guid);
	
}
