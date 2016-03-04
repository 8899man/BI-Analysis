package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptZyStoreRankDao;
import com.sxit.model.pmp.BProjSum;
import com.sxit.model.pmp.RptZyStoreRank;

/**
 * 
 * <br>
 * <b>功能：</b>RptZyStoreRankService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptZyStoreRankService")
public class RptZyStoreRankService{
	private final static Logger log= Logger.getLogger(RptZyStoreRankService.class);
	
	@Autowired
	private RptZyStoreRankDao rptZyStoreRankDao;
	
	public RptZyStoreRank queryByAll(){
    	return rptZyStoreRankDao.queryByAll();
    }
	
	public RptZyStoreRank querySeq(String big_code,String city_code){
		Map map = new HashMap();
		map.put("big_code", big_code);
		map.put("city_code", city_code);
    	return rptZyStoreRankDao.querySeq(map);
    }
	
	public List<RptZyStoreRank> queryByTop(){
		return rptZyStoreRankDao.queryByTop();
	}
}
