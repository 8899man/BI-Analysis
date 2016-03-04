package com.sxit.mgt.label.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sxit.api.customer.service.CustomerMergeService;
import com.sxit.common.action.BaseAction;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.dto.SearchVo;
import com.sxit.common.excel.ExcelExport;
import com.sxit.common.excel.ExcelUtil;
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.customer.vo.ClientListModel;
import com.sxit.mgt.label.service.LabelService;
import com.sxit.mgt.system.service.SysUserService;
import com.sxit.model.customer.ClientList;
import com.sxit.model.label.CstLabel;


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
	private SysUserService sysUserService;
	
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
	public @ResponseBody ResultMessage saveLabel(@RequestParam Map info) throws Exception {
		JSONObject json = JSON.parseObject((String)info.get("info"));
		json.put("creatorguid", "1"); //
//		System.out.println(json);
		Map params = JSON.toJavaObject(json, Map.class);
		
		labelService.saveLabel(params);
		
		return ResultMessage.successMsg("获取成功", null);
	}
	
	
	/*
	 * 导出execl
	 */
	/*
	@RequestMapping(value = "/labelExport")
	public @ResponseBody ResultMessage export(@RequestParam Integer currentPage, Integer PageSize, String areaSearch, String citySearch, String projectSearch, String formatCheckedSearch, String startDate, String endDate){
		if(currentPage == null){
			currentPage = 1;
		}
		if(PageSize == null){
			PageSize = 10;
		}
		int totalRows = CustomerMergeService.getClientListCount(areaSearch, citySearch, projectSearch, formatCheckedSearch, startDate, endDate);
		Page<ClientList> list = customerService.getClientList(currentPage, PageSize, areaSearch, citySearch, projectSearch, formatCheckedSearch, startDate, endDate);
		
		ClientListModel clientListModel = new ClientListModel();
		clientListModel.setClientList(list);
		clientListModel.setTotalRows(totalRows);
		clientListModel.setPageSize(PageSize);
		int totalPages = totalRows/PageSize + 1;
		clientListModel.setTotalPages(totalPages);
		
		if (list != null && list.size() > 0) {
			Map map = new HashMap();

			Map<Integer, String> userTypeMap = new HashMap<Integer, String>();
			userTypeMap.put(1, "男");
			userTypeMap.put(2, "女");
			userTypeMap.put(0, "未知");

			map.put("userTypeMap", userTypeMap);

			try {
				ExcelExport export = ExcelUtil.exportList(list, "customerExport",
						"客户数据", map);
				if(export!=null)
				{
					this.dowloadExcel(export, "customerdata.xls");
					return ResultMessage.successMsg("下载成功!");
				}else{
					return ResultMessage.successMsg("下载失败!");
				}

			} catch (Exception e) {
				e.printStackTrace();

				return ResultMessage.errorMsg("下载出错!");
			}
		} else {
			return ResultMessage.errorMsg("您要下载的数据为空!");
		}
	}*/
	
	
	@RequestMapping(value = "/getCustomerByLabel")
	public  @ResponseBody ResultMessage  getCustomerByLabel(@RequestParam String labelGUID) {
		PageVo pagevo = new PageVo(0, 5000);
		Map map = new HashMap();
		map.put("labelGUID", labelGUID);
		List list = labelService.getCustomerByLabel(pagevo, map);
		return ResultMessage.successMsg("成功", list);
	}
	
	@RequestMapping(value = "/labelExport")
	public  @ResponseBody ResultMessage  labelExport(@RequestParam String labelGUID) {
		PageVo pagevo = new PageVo(0, 10000);
		Map map = new HashMap();
		map.put("labelGUID", labelGUID);
		List<CstLabel> list = labelService.getCustomerByLabel(pagevo, map);
		if (list != null && list.size() > 0) {
			try {
				ExcelExport export = ExcelUtil.exportList(list, "cst_label_export",
						"标签客户", map);
				if(export!=null)
				{
					this.dowloadExcel(export, "customerdata.xls");
					return ResultMessage.successMsg("下载成功!");
				}else{
					return ResultMessage.successMsg("下载失败!");
				}
	
			} catch (Exception e) {
				e.printStackTrace();
				return ResultMessage.errorMsg("下载出错!");
			}
		} else {
			return ResultMessage.errorMsg("您要下载的数据为空!");
		}
	}
}
