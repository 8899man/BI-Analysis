package com.sxit.mgt.label.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sxit.common.action.BaseAction;
import com.sxit.common.dto.ResultMessage;
import com.sxit.mgt.label.service.LabelService;


/**
 * @公司:深讯信科
 * @功能:标签 Action
 * @作者:dengbiao    
 * @日期:2015-10-25 22:10:23  
 * @版本:1.0
 * @修改:
 */

@Controller
@RequestMapping("/label")
public class LabelAction extends BaseAction {
	
	@Autowired
	private LabelService labelService;

	
	@RequestMapping(value = "/queryTemplate")
	public @ResponseBody ResultMessage queryTemplate(@RequestParam String info) {
		
		int labelKey = Integer.parseInt(info);
		Map params = new HashMap();
		params.put("lablekey", labelKey);
		params.put("rootvalue", "1");
		JSONObject conditionCommon = labelService.queryTemplate(params);
		
		params.put("rootvalue", "2");
		JSONObject intentClient = labelService.queryTemplate(params);
		
		params.put("rootvalue", "3");
		JSONObject investClient = labelService.queryTemplate(params);
//		System.err.println(investClient.toJSONString());
		
		params.put("rootvalue", "4");
		JSONObject selfLiveClient = labelService.queryTemplate(params);
		
		params.put("rootvalue", "5");
		Map toLiveClient = labelService.queryTemplate(params);
		
		params.put("rootvalue", "6");
		JSONObject loseClient = labelService.queryTemplate(params);
		
		Map retValue = new HashMap();
		retValue.put("conditionCommon", conditionCommon);
		retValue.put("intentClient", intentClient);
		retValue.put("investClient", investClient);
		retValue.put("selfLiveClient", selfLiveClient);
		retValue.put("toLiveClient", toLiveClient);
		retValue.put("loseClient", loseClient);
		
		return ResultMessage.successMsg("获取成功", retValue);
	}

	
	@RequestMapping(value = "/saveLabel")
	public @ResponseBody ResultMessage saveLabel(@RequestParam Map info) {
		JSONObject json = JSON.parseObject((String)info.get("info"));
		
		System.out.println(json);
		Map params = JSON.toJavaObject(json, Map.class);
		
		labelService.saveLabel(params);
		
		return ResultMessage.successMsg("获取成功", null);
	}
}
