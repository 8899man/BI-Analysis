package com.sxit.mgt.houseDetail.dao;

import java.util.List;
import java.util.Map;


public interface HouseDetailDao {
	
	/**
	 * 根据房间ID，查询房产信息
	 * @param roomId
	 * @return
	 */
	public Map getHouseDetailByRoomId(int roomId);
	
	
	public List<Map> getTradeFollowRecorders(Map<String, Object> map);
}
