package com.sxit.mgt.customer.dao;

import java.util.List;
import java.util.Map;

import com.sxit.model.customer.Customer;

/**
 * @公司:深讯信科
 * @功能:客户画像 Dao
 * @作者:xiongj    
 * @日期:2015-09-22 10:35:59  
 * @版本:1.0
 * @修改:
 */
 
public interface CustomerDao {


	/**
	 * 根据ID获取客户画像
	 */
	public long getCstGUID(Map<String, Object> map);
	
	public List<Customer> getCstCustomerById(Map<String, Object> map);


}


