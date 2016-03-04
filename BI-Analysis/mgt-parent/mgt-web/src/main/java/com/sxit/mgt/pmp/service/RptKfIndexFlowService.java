package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptKfIndexFlowDao;
import com.sxit.model.pmp.RptKfIndexFlow;


/**
 * 
 * <br>
 * <b>功能：</b>RptKfIndexFlowService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptKfIndexFlowService")
public class RptKfIndexFlowService{
	private final static Logger log= Logger.getLogger(RptKfIndexFlowService.class);
	
	@Autowired
	private RptKfIndexFlowDao rptKfIndexFlowDao;
	
	public RptKfIndexFlow getIndexBaseById(String proj_guid){
		return rptKfIndexFlowDao.queryById(proj_guid);
	}
}
