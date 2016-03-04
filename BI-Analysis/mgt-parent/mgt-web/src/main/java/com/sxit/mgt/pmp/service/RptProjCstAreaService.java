package com.sxit.mgt.pmp.service;

import java.util.List;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptProjCstAreaDao;
import com.sxit.model.pmp.RptProjCstArea;

/**
 * 
 * <br>
 * <b>功能：</b>RptProjCstAreaService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptProjCstAreaService")
public class RptProjCstAreaService{
	private final static Logger log= Logger.getLogger(RptProjCstAreaService.class);
	
	
	@Autowired
	private RptProjCstAreaDao rptProjCstAreaDao;
	
	/**
	 * 根据项目ID获取指标值
	 */
	public List<RptProjCstArea> RptProjCstAreaById(String pguid){
		return rptProjCstAreaDao.RptProjCstAreaById(pguid);
	}
}
