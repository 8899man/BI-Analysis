package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.model.pmp.RptProjHouse;
import com.sxit.mgt.pmp.dao.RptProjHouseDao;

/**
 * 
 * <br>
 * <b>功能：</b>RptProjHouseService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptProjHouseService")
public class RptProjHouseService{
	private final static Logger log= Logger.getLogger(RptProjHouseService.class);
	
	@Autowired
	private RptProjHouseDao rptProjHouseDao;
	
	public RptProjHouse queryByAll(){
    	return rptProjHouseDao.queryByAll();
    }
	
	public RptProjHouse querySeq(String big_code,String city_code){
		Map map = new HashMap();
		map.put("big_code", big_code);
		map.put("city_code", city_code);
    	return rptProjHouseDao.querySeq(map);
    }
}
