package com.sxit.mgt.houseDetail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.houseDetail.dao.HouseDetailDao;

/**
 * @公司:深讯信科
 * @功能:客户画像 Service
 * @作者:xiongj    
 * @日期:2015-09-22 10:35:59  
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
public class HouseDetailService {

	@Autowired
	private HouseDetailDao houseDetailDao;
	
	/**
	 * @param roomId
	 * @return
	 */
	public Map getHouseDetailByRoomId(int roomId) {
		return houseDetailDao.getHouseDetailByRoomId(roomId);
	}
	
	
	public List<Map> getTradeFollowRecorders(int roomId) {
		
		String tableName = "cst_customer";
		String __roomId = roomId + "";
		String hz = __roomId.substring(__roomId.length() - 1);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("roomId", roomId);
		params.put("tableName", tableName+ "_" + hz);
		
		return houseDetailDao.getTradeFollowRecorders(params);
	}
	
}	


