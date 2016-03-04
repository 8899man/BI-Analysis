package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxit.mgt.pmp.dao.RptZyKeyIndexDao;
import com.sxit.model.pmp.RptZyKeyIndex;

/**
 * 
 * <br>
 * <b>功能：</b>RptZyKeyIndexService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptZyKeyIndexService")
public class RptZyKeyIndexService{
	private final static Logger log= Logger.getLogger(RptZyKeyIndexService.class);
	
	@Autowired
	private RptZyKeyIndexDao rptZyKeyIndexDao;
	
	public RptZyKeyIndex getIndexBaseById(String proj_guid){
		return rptZyKeyIndexDao.queryById(proj_guid);
	}
}
