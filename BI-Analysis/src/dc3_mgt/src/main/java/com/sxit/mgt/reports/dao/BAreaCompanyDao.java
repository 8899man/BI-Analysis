package com.sxit.mgt.reports.dao;

import java.util.List;
import java.util.Map;

import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.mgt.reports.dto.ProductProjectData;
import com.sxit.mgt.reports.dto.YeTaiZhuanShuDataDto;

public interface BAreaCompanyDao {

	public List<BAreaCompany> getAreaList();
	
	public List<BAreaCompany> getCompanyList(String areaCode);
	
	public List<ProductProjectData> getProductProjectData(Map<Object, Object> map);
	
	public List<YeTaiZhuanShuDataDto> getYeTaiZhuanShuData(Map<Object, Object> map);
}
