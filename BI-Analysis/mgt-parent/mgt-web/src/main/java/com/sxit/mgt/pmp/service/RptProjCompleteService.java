package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptProjCompleteDao;
import com.sxit.model.pmp.RptProjComplete;
import com.sxit.model.system.BaseUser;

/**
 * 
 * <br>
 * <b>功能：</b>RptProjCompleteService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptProjCompleteService")
public class RptProjCompleteService{
	private final static Logger log= Logger.getLogger(RptProjCompleteService.class);
	
	@Autowired
	private RptProjCompleteDao rptProjCompleteDao;
	
	public RptProjComplete queryByAll(){
    	return rptProjCompleteDao.queryByAll();
    }
	
	public RptProjComplete queryByB_Org(Integer user_id){
		return rptProjCompleteDao.queryByB_Org(user_id);
	}
	
	public RptProjComplete querySeq(String big_code,String city_code){
		Map map = new HashMap();
		map.put("big_code", big_code);
		map.put("city_code", city_code);
		return rptProjCompleteDao.querySeq(map);
	}
	
	public RptProjComplete queryByB_OrgAdmin(){
		return rptProjCompleteDao.queryByB_OrgAdmin();
	}
}
