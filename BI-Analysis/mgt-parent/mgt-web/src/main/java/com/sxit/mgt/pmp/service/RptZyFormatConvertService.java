package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptZyFormatConvertDao;
import com.sxit.mgt.pmp.dao.RptZyFormatIndexDao;
import com.sxit.model.pmp.RptZyFormatConvert;
import com.sxit.model.pmp.RptZyFormatIndex;

/**
 * 
 * <br>
 * <b>功能：</b>RptZyFormatConvertService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptZyFormatConvertService")
public class RptZyFormatConvertService{
	private final static Logger log= Logger.getLogger(RptZyFormatConvertService.class);
	@Autowired
	private RptZyFormatConvertDao rptZyFormatConvertDao;
	
	public RptZyFormatConvert getIndexBaseById(String proj_guid){
		return rptZyFormatConvertDao.queryById(proj_guid);
	}
	
}
