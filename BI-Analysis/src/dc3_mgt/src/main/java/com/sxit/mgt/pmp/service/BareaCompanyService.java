package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.pmp.dao.BareaCompanyDao;
import com.sxit.mgt.pmp.dto.BareaCompany;

@Service("bareaCompanyService")
@Transactional(readOnly = true)
public class BareaCompanyService {

	@Autowired
	private BareaCompanyDao bareaCompanyDao;

	public List<BareaCompany> getAreaList(){
		return bareaCompanyDao.getAreaList();
	}
	
	public List<BareaCompany> getCompanyList(String areaCode){
		return bareaCompanyDao.getCompanyList(areaCode);
	}
}
