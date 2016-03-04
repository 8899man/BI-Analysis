package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptResidentialSaleDao;
import com.sxit.model.pmp.RptResidentialSale;

/**
 * 
 * <br>
 * <b>功能：</b>RptResidentialSaleService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptResidentialSaleService")
public class RptResidentialSaleService{
	private final static Logger log= Logger.getLogger(RptResidentialSaleService.class);
	
	
	@Autowired
	private RptResidentialSaleDao rptResidentialSaleDao;
	
	public RptResidentialSale queryByAll(){
    	return rptResidentialSaleDao.queryByAll();
    }
	
	public RptResidentialSale querySeq(String big_code,String city_code){
		Map map = new HashMap();
		map.put("big_code", big_code);
		map.put("city_code", city_code);
    	return rptResidentialSaleDao.querySeq(map);
    }
	
}
