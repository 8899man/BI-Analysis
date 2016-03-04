package com.sxit.mgt.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.mgt.customer.dao.CustomerDao;
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
	public Long getCstGUID(String reqData, String tablename, String shuxingname){
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
	
	public RptCstNumber getAllCustomerVo(){
		return customerDao.getAllCustomerVo();
	}
	
	public List<RptCstNumber> getRptCstNumber(){
		return customerDao.getRptCstNumber();
	}
	
	public List<RptMutipleFormats> getRptMutipleFormats(){
		return customerDao.getRptMutipleFormats();
	}
	
	public List<RptClassification> getRptClassification(){
		return customerDao.getRptClassification();
	}
	
	public List<RptCstLabel> getRptCstLabel(){
		return customerDao.getRptCstLabel();
	}
	
	public List<RptCityDistributed> getRptCityDistributedFirst(){
		return customerDao.getRptCityDistributedFirst();
	}
	
	public List<RptCityDistributed> getRptCityDistributedLast(){
		return customerDao.getRptCityDistributedLast();
	}
/**	
 * 方法已经无用，可删除
	public List<Group> getAreas(){
		return customerDao.getAreas();
	}
	
	public List<Group> getCompanys(String areaId){
		return customerDao.getCompanys(areaId);
	}
**/		
	
	public List<BAreaCompany> getProjects(String citycode){
		return customerDao.getProjects(citycode);
	}

	public int getClientListCount(String area, String city, String project, String yetai, String startDate, String endDate){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("area", area);
		map.put("city", city);
		map.put("project", project);
		map.put("yetai", yetai);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return customerDao.getClientListCount(map);
	}
	
	public Page<ClientList> getClientList(int pageNum, int pageSize, String area, String city, String project, String yetai, String startDate, String endDate){
		PageHelper.startPage(pageNum, pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("area", area);
		map.put("city", city);
		map.put("project", project);
		map.put("yetai", yetai);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return customerDao.getClientList(map);
	}
	
	public List<CustomerLable> getCustomerLables(long cstGUID){
		return customerDao.getCustomerLables(cstGUID);
	}
}


