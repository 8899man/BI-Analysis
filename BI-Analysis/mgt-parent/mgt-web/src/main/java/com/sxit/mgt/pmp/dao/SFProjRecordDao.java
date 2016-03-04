package com.sxit.mgt.pmp.dao;

import java.util.List;
import java.util.Map;

import com.sxit.mgt.pmp.dto.BProjModel;
import com.sxit.mgt.pmp.dto.SFProjModel;

public interface SFProjRecordDao {

	public List<SFProjModel> getSFollowRecordByProjId(String projGUID);
	
	public List<BProjModel> getProjById(String projGUID);
	
	public int getBuildCountByProjGUID(String projGUID);
	
	public int getRoomCountByProjGUID(String projGUID);
	
	public String getCstNameById(Map<String, Object> map);
	
	public int getSelledNum(String projGUID);
	
	public int getNoSellNum(String projGUID);
		
}
