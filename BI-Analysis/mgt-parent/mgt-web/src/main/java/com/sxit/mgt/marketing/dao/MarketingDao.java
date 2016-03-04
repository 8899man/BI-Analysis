package com.sxit.mgt.marketing.dao;

import java.util.List;
import java.util.Map;

import com.sxit.mgt.marketing.vo.CustomerModelData;
import com.sxit.mgt.marketing.vo.CustomerNumDetail;
import com.sxit.mgt.marketing.vo.Subs;

public interface MarketingDao {
	
	public List<Subs> getAreaCityProj(Map<String, Object> map);
	public List<Subs> getAreaByUserId(int userId);
	public List<Subs> getCompanyByUserId(Map<String, Object> map);
	
	public List<Subs> getProjects(String citycode);
	public List<Subs> getProjectsByUserId(Map<String, Object> map);
	
	public int getAllRptYxCstModel(Map<String, Object> map);
	public int getRptYxCstModelByUserId(Map<String, Object> map);
	
	public CustomerNumDetail getCustomerModelNum(Map<String, Object> map);
	public CustomerNumDetail getCMNumBYUserId(Map<String, Object> map);
	
	public List<CustomerModelData> getCustomerModelData(Map<String, Object> map);
	public List<CustomerModelData> getCMDataByUserId(Map<String, Object> map);
	
	//定向营销
	public List<Subs> getRptBProjSumArea();
	
	public List<Subs> getRptBProjCity(String areaId);
	
	public List<Subs> getRptBProjProject(String cityId);
	
	public List<Subs> getRptYxCstModelProvince();
	public List<Subs> getRptYCMPByUserId(int userId);
	
	public List<Subs> getRptYxCstModelCity(String provinceId);
	public List<Subs> getRYCMCByUserId(Map<String, Object> map);
	
	public String getCityNameByCityName(String cityName);
	
	public int getFetchDataNum(Map<String, Object> map);
	public int getFDNumByUserId(Map<String, Object> map);
	
	public List<CustomerModelData> getFetchData(Map<String, Object> map);
	public List<CustomerModelData> getFDByUserId(Map<String, Object> map);
	
	
	public void saveExportLog(Map<String, Object> map);
}
