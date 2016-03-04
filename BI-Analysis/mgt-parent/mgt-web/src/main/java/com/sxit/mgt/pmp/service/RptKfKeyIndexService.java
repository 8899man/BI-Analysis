package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptKfKeyIndexDao;
import com.sxit.model.pmp.RptKfKeyIndex;

/**
 * 
 * <br>
 * <b>功能：</b>RptKfKeyIndexService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptKfKeyIndexService")
public class RptKfKeyIndexService{
	private final static Logger log= Logger.getLogger(RptKfKeyIndexService.class);
	
	@Autowired
	private RptKfKeyIndexDao rptKfKeyIndexDao;
	
	public RptKfKeyIndex getIndexBaseById(String proj_guid){
		return rptKfKeyIndexDao.queryById(proj_guid);
	}
	
}
