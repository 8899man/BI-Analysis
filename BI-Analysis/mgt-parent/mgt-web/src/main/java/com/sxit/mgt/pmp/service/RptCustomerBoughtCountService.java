package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptCustomerBoughtCountDao;
import com.sxit.model.pmp.RptCustomerBoughtCount;;

/**
 * 
 * <br>
 * <b>功能：</b>RptCustomerBoughtCountService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptCustomerBoughtCountService")
public class RptCustomerBoughtCountService{
	private final static Logger log= Logger.getLogger(RptCustomerBoughtCountService.class);
	
	@Autowired
	private RptCustomerBoughtCountDao rptCustomerBoughtCountDao;
	
	/**
	 * 根据项目ID获取指标值
	 */
	public RptCustomerBoughtCount getIndexFlowById(String pguid){
		return rptCustomerBoughtCountDao.RptCustomerBoughtCountById(pguid);
	}
}
