package com.sxit.mgt.pmp.dao;

import java.util.List;

import com.sxit.model.pmp.RptCustomerAttachCount;
import com.sxit.model.pmp.RptProjCstIndustry;

/**
 * RptCustomerAttachCount Mapper
 * @author Administrator
 *
 */
public interface RptCustomerAttachCountDao{
	/**
	 * 根据项目ID获取指标值
	 */
	public List<RptCustomerAttachCount> RptCustomerAttachCountById(String proj_guid);
	
}
