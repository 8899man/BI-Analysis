package com.sxit.mgt.pmp.dao;

import java.util.Map;

import com.sxit.model.pmp.RptProjBusiness;

/**
 * RptProjBusiness Mapper
 * @author Administrator
 *
 */
public interface RptProjBusinessDao{
	public RptProjBusiness queryByAll();
	public RptProjBusiness querySeq(Map map);
}
