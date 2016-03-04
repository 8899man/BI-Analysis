package com.sxit.mgt.customer.dao;

import java.util.List;
import java.util.Map;

import com.sxit.common.pagehelper.Page;
import com.sxit.mgt.customer.vo.CustomerLable;
import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.model.customer.ClientList;
import com.sxit.model.customer.Customer;
import com.sxit.model.customer.RptCityDistributed;
import com.sxit.model.customer.RptClassification;
import com.sxit.model.customer.RptCstLabel;
import com.sxit.model.customer.RptCstNumber;
import com.sxit.model.customer.RptMutipleFormats;

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
	public Long getCstGUID(Map<String, Object> map);
	
	public List<Customer> getCstCustomerById(Map<String, Object> map);

	public RptCstNumber getAllCustomerVo();
	
	public List<RptCstNumber> getRptCstNumber();
	
	public List<RptMutipleFormats> getRptMutipleFormats();
	
	public List<RptClassification> getRptClassification();
	
	public List<RptCstLabel> getRptCstLabel();
	
	public List<RptCityDistributed> getRptCityDistributedFirst();
	
	public List<RptCityDistributed> getRptCityDistributedLast();
	
	public List<BAreaCompany> getProjects(String citycode);
	
	public int getClientListCount(Map<String, Object> map);
	
	public Page<ClientList> getClientList(Map<String, Object> map);
	
	public List<CustomerLable> getCustomerLables(long cstGUID);
}


