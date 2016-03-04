package com.sxit.mgt.pmp.service;

import java.util.List;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.RptCustomerAttachCountDao;
import com.sxit.model.pmp.RptCustomerAttachCount;

/**
 * 
 * <br>
 * <b>功能：</b>RptCustomerAttachCountService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> Dec 9, 2011 <br>
 * <b>版权所有：<b>版权所有(C) 2011，WWW.VOWO.COM<br>
 */
@Service("rptCustomerAttachCountService")
public class RptCustomerAttachCountService{
	private final static Logger log= Logger.getLogger(RptCustomerAttachCountService.class);
	
	@Autowired
	private RptCustomerAttachCountDao rptCustomerAttachCountDao;
	
	/**
	 * 根据项目ID获取指标值
	 */
	public List<RptCustomerAttachCount> RptCustomerAttachCountById(String pguid){
		return rptCustomerAttachCountDao.RptCustomerAttachCountById(pguid);
	}
}
