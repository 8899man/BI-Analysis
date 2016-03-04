package com.sxit.mgt.pmp.dao;

import java.util.List;

import com.sxit.model.pmp.RptProjCstArea;

/**
 * RptProjCstArea Mapper
 * @author Administrator
 *
 */
public interface RptProjCstAreaDao{
	/**
	 * 根据项目ID获取指标值
	 */
	public List<RptProjCstArea> RptProjCstAreaById(String proj_guid);
	
}
