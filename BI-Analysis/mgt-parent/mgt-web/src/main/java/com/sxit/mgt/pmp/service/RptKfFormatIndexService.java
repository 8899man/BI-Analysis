package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptKfFormatIndexDao;
import com.sxit.model.pmp.RptKfFormatIndex;

/**
 * 
 * <br>
 * <b>功能：</b>RptKfFormatIndexService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptKfFormatIndexService")
public class RptKfFormatIndexService{
	private final static Logger log= Logger.getLogger(RptKfFormatIndexService.class);
	
	@Autowired
	private RptKfFormatIndexDao rptKfFormatIndexDao;
	
	public RptKfFormatIndex getIndexBaseById(String proj_guid){
		return rptKfFormatIndexDao.queryById(proj_guid);
	}
}
