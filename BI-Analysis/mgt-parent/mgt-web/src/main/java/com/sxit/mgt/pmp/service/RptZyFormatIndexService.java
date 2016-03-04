package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptZyFormatIndexDao;
import com.sxit.mgt.pmp.dao.RptZyIndexFlowDao;
import com.sxit.model.pmp.RptZyFormatIndex;
import com.sxit.model.pmp.RptZyIndexFlow;

/**
 * 
 * <br>
 * <b>功能：</b>RptZyFormatIndexService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptZyFormatIndexService")
public class RptZyFormatIndexService{
	private final static Logger log= Logger.getLogger(RptZyFormatIndexService.class);
	
	@Autowired
	private RptZyFormatIndexDao rptZyFormatIndexDao;
	
	public RptZyFormatIndex getIndexBaseById(String proj_guid){
		return rptZyFormatIndexDao.queryById(proj_guid);
	}
	
}
