package com.sxit.mgt.pmp.service;

import java.util.List;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptProjCstIndustryDao;
import com.sxit.model.pmp.RptProjCstIndustry;

/**
 * 
 * <br>
 * <b>功能：</b>RptProjCstIndustryService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptProjCstIndustryService")
public class RptProjCstIndustryService{
	private final static Logger log= Logger.getLogger(RptProjCstIndustryService.class);
	
	@Autowired
	private RptProjCstIndustryDao rptProjCstIndustryDao;
	
	/**
	 * 根据项目ID获取指标值
	 */
	public List<RptProjCstIndustry> RptProjCstIndustryById(String pguid){
		return rptProjCstIndustryDao.RptProjCstIndustryById(pguid);
	}
	
}
