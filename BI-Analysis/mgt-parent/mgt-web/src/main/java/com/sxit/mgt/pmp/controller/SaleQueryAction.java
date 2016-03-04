package com.sxit.mgt.pmp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxit.common.dto.ResultMessage;
import com.sxit.mgt.pmp.service.SaleQueryService;

/**
 * 房源信息
 * @author dengbiao
 */
@Controller
@RequestMapping("/sale")
public class SaleQueryAction {
	
	@Autowired
	private SaleQueryService diskQueryService;
	
	@RequestMapping(value = "/houseQuery")
	public @ResponseBody ResultMessage getHouses(@RequestParam String projGUID) {
		List<Map> disks = diskQueryService.getHouses(projGUID);
		return ResultMessage.successMsg("获取成功", disks);
	}
	
}
