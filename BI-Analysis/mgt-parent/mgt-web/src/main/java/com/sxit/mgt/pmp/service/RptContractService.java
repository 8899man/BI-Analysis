package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptContractDao;
import com.sxit.model.pmp.RptContract;

/**
 * 
 * <br>
 * <b>功能：</b>RptContractService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptContractService")
public class RptContractService{
	private final static Logger log= Logger.getLogger(RptContractService.class);
	
	@Autowired
	private RptContractDao rptContractDao;
	
	public List<RptContract> queryByList(String type_id,String city_code){
		Map map = new HashMap();
		map.put("type_id", type_id);
		map.put("city_code", city_code);
    	return rptContractDao.queryByList(map);
    }
	
	public List<RptContract> queryByDistinct(){
		return rptContractDao.queryByDistinct();
	}
	
}
