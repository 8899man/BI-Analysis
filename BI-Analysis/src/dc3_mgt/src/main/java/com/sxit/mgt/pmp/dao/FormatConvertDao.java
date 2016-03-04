package com.sxit.mgt.pmp.dao;

import com.sxit.model.pmp.FormatConvert;

/**
 * @公司:深讯信科
 * @功能:FormatConvert Dao
 * @作者:Edson.di   
 * @日期:2015-09-23 09:43:07  
 * @版本:1.0
 * @修改:
 */
public interface FormatConvertDao{
	/**
	 * 根据项目ID获取指标值
	 */
	public FormatConvert getFormatConvertById(String proj_guid);
	
}
