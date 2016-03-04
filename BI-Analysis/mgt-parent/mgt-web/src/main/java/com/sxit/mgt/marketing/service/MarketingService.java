package com.sxit.mgt.marketing.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.marketing.dao.MarketingDao;
import com.sxit.mgt.marketing.vo.CustomerModelData;
import com.sxit.mgt.marketing.vo.CustomerNumDetail;
import com.sxit.mgt.marketing.vo.ExtractLog;
import com.sxit.mgt.marketing.vo.Subs;

@Service
@Transactional(readOnly = true)
public class MarketingService {

	@Autowired
	private MarketingDao marketingDao;
	
	public List<Subs> getAreaCityProj(Integer subType, String parentGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subType", subType);
		map.put("parentGUID", parentGUID);
		return marketingDao.getAreaCityProj(map);
	}
	public List<Subs> getAreaByUserId(int userId){
		return marketingDao.getAreaByUserId(userId);
	}
	public List<Subs> getCompanyByUserId(int userId, String parentGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parentGUID", parentGUID);
		map.put("userId", userId);
		return marketingDao.getCompanyByUserId(map);
	}
	
	
	public List<Subs> getProjects(String citycode){
		return marketingDao.getProjects(citycode);
	}
	public List<Subs> getProjectsByUserId(String citycode, int userId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("citycode", citycode);
		map.put("userId", userId);
		return marketingDao.getProjectsByUserId(map);
	}
	
	
	public int getAllRptYxCstModel(String bigCode, String cityCode, String projGUID, String paramStr){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bigCode", bigCode);
		map.put("cityCode", cityCode);
		map.put("projGUID", projGUID);
		map.put("paramStr", paramStr);
		return marketingDao.getAllRptYxCstModel(map);
	}
	public int getRptYxCstModelByUserId(int userId, String paramStr, String paramStr2){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("paramStr", paramStr);
		map.put("paramStr2", paramStr2);
		return marketingDao.getRptYxCstModelByUserId(map);
	}
	
	
	public CustomerNumDetail getCustomerModelNum(String cstType, String typeName, String paramStr, String bigCode, String cityCode, String projGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cstType", cstType);
		map.put("typeName", typeName);
		map.put("paramStr", paramStr);
		map.put("bigCode", bigCode);
		map.put("cityCode", cityCode);
		map.put("projGUID", projGUID);
		return marketingDao.getCustomerModelNum(map);
	}
	public CustomerNumDetail getCMNumBYUserId(String cstType, String typeName, String paramStr, String bigCode, String cityCode, String projGUID, int userId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cstType", cstType);
		map.put("typeName", typeName);
		map.put("paramStr", paramStr);
		map.put("bigCode", bigCode);
		map.put("cityCode", cityCode);
		map.put("projGUID", projGUID);
		map.put("userId", userId);
		return marketingDao.getCMNumBYUserId(map);
	}
	
	
	/**
	 * 
	 * @param paramStr
	 * @param bigCode
	 * @param cityCode
	 * @param projGUID
	 * @param method 如果值为"export"，则为导出做查询，否则只查询前八条
	 * @return
	 */
	public List<CustomerModelData> getCustomerModelData(String paramStr, String bigCode, String cityCode, String projGUID, String method){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paramStr", paramStr);
		map.put("bigCode", bigCode);
		map.put("cityCode", cityCode);
		map.put("projGUID", projGUID);
		map.put("method", method);
		return marketingDao.getCustomerModelData(map);
	}
	public List<CustomerModelData> getCMDataByUserId(String paramStr, String bigCode, String cityCode, String projGUID, String method, int userId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paramStr", paramStr);
		map.put("bigCode", bigCode);
		map.put("cityCode", cityCode);
		map.put("projGUID", projGUID);
		map.put("method", method);
		map.put("userId", userId);
		return marketingDao.getCMDataByUserId(map);
	}
	
	
	//定向营销
	public List<Subs> getRptBProjSumArea(){
		return marketingDao.getRptBProjSumArea();
	}
	
	public List<Subs> getRptBProjCity(String areaId){
		return marketingDao.getRptBProjCity(areaId);
	}
	
	public List<Subs> getRptBProjProject(String cityId){
		return marketingDao.getRptBProjProject(cityId);
	}
	
	
	public List<Subs> getRptYxCstModelProvince(){
		return marketingDao.getRptYxCstModelProvince();
	}
	public List<Subs> getRptYCMPByUserId(int userId){
		return marketingDao.getRptYCMPByUserId(userId);
	}
	
	
	public List<Subs> getRptYxCstModelCity(String provinceId){
		return marketingDao.getRptYxCstModelCity(provinceId);
	}
	public List<Subs> getRYCMCByUserId(String provinceId, int userId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("provinceId", provinceId);
		map.put("userId", userId);
		return marketingDao.getRYCMCByUserId(map);
	}
	
	
	public String getCityNameByCityName(String cityName){
		return marketingDao.getCityNameByCityName(cityName);
	}
	
	
	public int getFetchDataNum(String cityId, String sqlStr){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cityId", cityId);
		map.put("sqlStr", sqlStr);
		return marketingDao.getFetchDataNum(map);
	}
	public int getFDNumByUserId(String cityId, String sqlStr, int userId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cityId", cityId);
		map.put("sqlStr", sqlStr);
		map.put("userId", userId);
		return marketingDao.getFDNumByUserId(map);
	}
	
	
	public List<CustomerModelData> getFetchData(String cityId, String sqlStr, String limitIf){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cityId", cityId);
		map.put("sqlStr", sqlStr);
		map.put("limitIf", limitIf);
		return marketingDao.getFetchData(map);
	}
	public List<CustomerModelData> getFDByUserId(String cityId, String sqlStr, String limitIf, int userId){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cityId", cityId);
		map.put("sqlStr", sqlStr);
		map.put("limitIf", limitIf);
		map.put("userId", userId);
		return marketingDao.getFDByUserId(map);
	}
	
	
	public void saveExportLog(ExtractLog log){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", log.getUserId());
		map.put("createTime", log.getCreateTime());
		map.put("num", log.getNum());
		map.put("type", log.getType());
		map.put("remark", log.getRemark());
		map.put("projGUID", log.getProjGUID());
		marketingDao.saveExportLog(map);
	}
}
