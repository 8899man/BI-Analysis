package com.sxit.mgt.reports.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.reports.dao.BAreaCompanyDao;
import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.mgt.reports.dto.ProductProjectData;
import com.sxit.mgt.reports.dto.YeTaiZhuanShuDataDto;

@Service
@Transactional(readOnly = true)
public class BAreaCompanyService {

	@Autowired
	private BAreaCompanyDao bAreaCompanyDao;

	public List<BAreaCompany> getAreaList(){
		return bAreaCompanyDao.getAreaList();
	}
	
	public List<BAreaCompany> getCompanyList(String areaCode){
		return bAreaCompanyDao.getCompanyList(areaCode);
	}
	
	public List<ProductProjectData> getProductProjectData(String areaCode, String companyCode, String startDate, String endDate){
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("areaCode", areaCode);
		map.put("companyCode", companyCode);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return bAreaCompanyDao.getProductProjectData(map);
	}
	
	public List<YeTaiZhuanShuDataDto> getYeTaiZhuanShuData(String startTime, String endTime){
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		return bAreaCompanyDao.getYeTaiZhuanShuData(map);
	}
}
