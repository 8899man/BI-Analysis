package com.sxit.mgt.pmp.dao;

import java.util.Map;

import com.sxit.model.pmp.RptProjProperties;

/**
 * RptProjProperties Mapper
 * @author Administrator
 *
 */
public interface RptProjPropertiesDao{
	public RptProjProperties queryByAll();
	public RptProjProperties querySeq(Map map);
}
