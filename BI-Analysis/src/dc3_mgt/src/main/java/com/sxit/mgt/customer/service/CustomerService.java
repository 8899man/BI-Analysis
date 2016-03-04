package com.sxit.mgt.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.customer.dao.CustomerDao;
import com.sxit.model.customer.Customer;

/**
 * @公司:深讯信科
 * @功能:客户画像 Service
 * @作者:xiongj    
 * @日期:2015-09-22 10:35:59  
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
public class CustomerService {

	@Autowired
	private CustomerDao customerDao;

	/**
	 * 根据ID获取客户画像
	 */
	public long getCstGUID(String reqData, String tablename, String shuxingname){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reqData", reqData);
		map.put("shuxingname", shuxingname);
		map.put("tablename", tablename);
		return customerDao.getCstGUID(map);
	}
	
	public List<Customer> getCstCustomerById(String tablename, long cstGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tablename", tablename);
		map.put("cstGUID", cstGUID);
		return customerDao.getCstCustomerById(map);
	}
}


