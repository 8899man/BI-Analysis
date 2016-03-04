package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.IndexFlowDao;
import com.sxit.mgt.pmp.dao.RptCustomerCountMainDao;
import com.sxit.model.pmp.RptCustomerCountMain;

/**
 * 
 * <br>
 * <b>功能：</b>RptCustomerCountMainService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptCustomerCountMainService")
public class RptCustomerCountMainService{
	private final static Logger log= Logger.getLogger(RptCustomerCountMainService.class);
	
	@Autowired
	private RptCustomerCountMainDao rptCustomerCountMainDao;
	
	/**
	 * 根据项目ID获取指标值
	 */
	public RptCustomerCountMain getRptCustomerCountMainById(String pguid){
		return rptCustomerCountMainDao.getRptCustomerCountMainById(pguid);
	}
}
