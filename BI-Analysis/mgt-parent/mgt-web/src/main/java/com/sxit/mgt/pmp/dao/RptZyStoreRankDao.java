package com.sxit.mgt.pmp.dao;

import java.util.List;
import java.util.Map;

import com.sxit.model.pmp.RptZyStoreRank;

/**
 * RptZyStoreRank Mapper
 * @author Administrator
 *
 */
public interface RptZyStoreRankDao{
	
	public RptZyStoreRank queryByAll();
	public RptZyStoreRank querySeq(Map map);
	public List<RptZyStoreRank> queryByTop();
}
