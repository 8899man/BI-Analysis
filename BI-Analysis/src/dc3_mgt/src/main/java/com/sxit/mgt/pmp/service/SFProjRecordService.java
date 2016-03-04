package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sxit.mgt.pmp.dao.SFProjRecordDao;
import com.sxit.mgt.pmp.dto.BProjModel;
import com.sxit.mgt.pmp.dto.SFProjModel;

public class SFProjRecordService {
	
	@Autowired
	private SFProjRecordDao sfollowRecordDao;

	public List<SFProjModel> getSFollowRecordByProjId(String projGUID){
		return sfollowRecordDao.getSFollowRecordByProjId(projGUID);
	}
	
	public List<BProjModel> getProjById(String projGUID){
		return sfollowRecordDao.getProjById(projGUID);
	}
	
	public int getBuildCountByProjGUID(String projGUID){
		return sfollowRecordDao.getBuildCountByProjGUID(projGUID);
	}
	
	public int getRoomCountByProjGUID(String projGUID){
		return sfollowRecordDao.getRoomCountByProjGUID(projGUID);
	}
	
	public String getCstNameById(String tablename, long cstGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tablename", tablename);
		map.put("cstGUID", cstGUID);
		return sfollowRecordDao.getCstNameById(map);
	}
	
	public int getSelledNum(String projGUID){
		return sfollowRecordDao.getSelledNum(projGUID);
	}
	
	public int getNoSellNum(String projGUID){
		return sfollowRecordDao.getNoSellNum(projGUID);
	}
}
