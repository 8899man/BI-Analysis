package com.sxit.mgt.houseDetail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxit.common.action.BaseAction;
import com.sxit.common.dto.ResultMessage;
import com.sxit.mgt.houseDetail.service.HouseDetailService;
import com.sxit.mgt.houseDetail.service.RepairService;

/**
 * 房产明细 
 * @author dengbiao
 */
@Controller
@RequestMapping("/house")
public class HouseDetailAction extends BaseAction {
	
	@Autowired
	public HouseDetailService houseDetailService;
	
	@Autowired
	public RepairService repairService;
	
	@RequestMapping(value = "/houseDetail")
	public @ResponseBody ResultMessage cleintSearch(@RequestParam String reqData) {
		int roomId = Integer.parseInt(reqData);
		Map houseDetail = houseDetailService.getHouseDetailByRoomId(roomId); //基础信息
		List<Map> repairFollow = repairService.getRepairFollowRecorders(roomId); //维修记录
		List<Map> tradeFollow = houseDetailService.getTradeFollowRecorders(roomId); //交易信息
		
		
		Map map = new HashMap();
		map.put("houseDetail", houseDetail);
		map.put("repairFollow", repairFollow);
		map.put("tradeFollow", tradeFollow);
		
		
		return ResultMessage.successMsg("获取成功", map);
	}
	
}
