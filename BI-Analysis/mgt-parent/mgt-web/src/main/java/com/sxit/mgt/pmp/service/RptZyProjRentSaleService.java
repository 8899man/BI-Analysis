package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sxit.mgt.pmp.dao.RptZyProjRentSaleDao;
import com.sxit.model.pmp.RptZyProjRentSale;

/**
 * 
 * <br>
 * <b>功能：</b>RptZyProjRentSaleService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptZyProjRentSaleService")
public class RptZyProjRentSaleService{
	private final static Logger log= Logger.getLogger(RptZyProjRentSaleService.class);
	
	@Autowired
	private RptZyProjRentSaleDao rptZyProjRentSaleDao;
	
	public RptZyProjRentSale queryByAll(){
    	return rptZyProjRentSaleDao.queryByAll();
    }
	
	public RptZyProjRentSale querySeq(String big_code,String city_code){
		Map map = new HashMap();
		map.put("big_code", big_code);
		map.put("city_code", city_code);
    	return rptZyProjRentSaleDao.querySeq(map);
    }
	
	
}
