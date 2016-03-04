package com.sxit.mgt.pmp.dao;

import java.util.Map;

import com.sxit.model.pmp.RptProjHouse;

/**
 * RptProjHouse Mapper
 * @author Administrator
 *
 */
public interface RptProjHouseDao{
	public RptProjHouse queryByAll();
	public RptProjHouse querySeq(Map map);
	
}
