package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sxit.mgt.pmp.dao.RptXsFormatIndexDao;
import com.sxit.model.pmp.RptXsFormatIndex;

/**
 * 
 * <br>
 * <b>功能：</b>RptXsFormatIndexService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptXsFormatIndexService")
public class RptXsFormatIndexService{
	private final static Logger log= Logger.getLogger(RptXsFormatIndexService.class);
	
	@Autowired
	private RptXsFormatIndexDao rptXsFormatIndexDao;
	
	public RptXsFormatIndex queryById(String proj_id){
		return rptXsFormatIndexDao.queryById(proj_id);
	}
	
}
