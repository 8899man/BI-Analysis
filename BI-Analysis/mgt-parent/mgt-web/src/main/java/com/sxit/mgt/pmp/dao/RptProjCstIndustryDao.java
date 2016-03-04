package com.sxit.mgt.pmp.dao;

import java.util.List;

import com.sxit.model.pmp.RptProjCstIndustry;

/**
 * RptProjCstIndustry Mapper
 * @author Administrator
 *
 */
public interface RptProjCstIndustryDao{
	/**
	 * 根据项目ID获取指标值
	 */
	public List<RptProjCstIndustry> RptProjCstIndustryById(String proj_guid);
}
