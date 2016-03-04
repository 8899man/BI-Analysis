package com.sxit.mgt.houseDetail.dao;

import java.util.List;
import java.util.Map;

public interface RepairDao {
	
	public List<Map> getRepairFollowRecorders(int roomId);
	
}
