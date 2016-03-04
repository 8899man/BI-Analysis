package com.sxit.mgt.pmp.service;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxit.mgt.pmp.dao.FormatConvertDao;
import com.sxit.model.pmp.FormatConvert;

/**
 * 
 * <br>
 * <b>功能：</b>FormatConvertService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> 23 9, 2015 <br>
 * <b>版权所有： 2015，WWW.SXIT.COM.CN<br>
 */
@Service("formatConvertService")
public class FormatConvertService{
	private final static Logger log= Logger.getLogger(FormatConvertService.class);
	
	@Autowired
	private FormatConvertDao formatConvertdao;
	
	/**
	 * 根据项目ID获取指标值
	 */
	public FormatConvert getIndexBaseById(String pguid){
		return formatConvertdao.getFormatConvertById(pguid);
	}
}
