package com.sxit.mgt.pmp.dao;

import java.util.List;
import java.util.Map;

import com.sxit.mgt.pmp.dto.BareaCompany;

public interface BareaCompanyDao {

	public List<BareaCompany> getAreaList();
	
	public List<BareaCompany> getCompanyList(String areaCode);
}
