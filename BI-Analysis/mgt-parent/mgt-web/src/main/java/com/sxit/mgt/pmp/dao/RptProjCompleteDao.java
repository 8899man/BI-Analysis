package com.sxit.mgt.pmp.dao;

import java.util.List;
import java.util.Map;

import com.sxit.model.pmp.RptProjComplete;
/**
 * RptProjComplete Mapper
 * @author Administrator
 *
 */
public interface RptProjCompleteDao{
	public RptProjComplete queryByAll();
	
	public RptProjComplete queryByB_Org(Integer user_id);
	
	public RptProjComplete querySeq(Map map);
	
	public RptProjComplete queryByB_OrgAdmin();
	
}
