package com.sxit.mgt.houseDetail.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.houseDetail.dao.RepairDao;

@Service
@Transactional(readOnly = true)
public class RepairService {

	@Autowired
	private RepairDao repairDao;
	
	public List<Map> getRepairFollowRecorders(int roomId) {
		return repairDao.getRepairFollowRecorders(roomId);
	}
}
