package com.sxit.mgt.label.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxit.common.action.BaseAction;
import com.sxit.common.annatation.AuthPassport;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.dto.SearchVo;
import com.sxit.common.excel.ExcelExport;
import com.sxit.common.excel.ExcelUtil;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.label.service.LabelService;
import com.sxit.model.label.LableStorage;


/**
 * @公司:深讯信科
 * @功能:标签 Action
 * @作者:dengbiao    
 * @日期:2015-10-25 22:10:23  
 * @版本:1.0
 * @修改:
 */

@Controller
@RequestMapping("/labelLocal")
public class LabelLocalAction extends BaseAction {
	
	@Autowired
	private LabelService labelService;
	
	/**
	 * 列表
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
//	@AuthPassport(rightCode = "Label.Label")
	@RequestMapping(value = "/labelLocalList")
	public @ResponseBody ResultMessage list(@RequestParam String isNet, @RequestParam String creatorguid) {
		
		//列表查询
		if(isNet == null || "".equals(isNet)){
			isNet = "0";
		}
		if(!"0".equals(isNet) && !"1".equals(isNet)){
			return ResultMessage.errorMsg("请求错误");
		}
		List<LableStorage> list = null;
//		int _labelKey = Integer.parseInt(lableKey);
		list = labelService.getLableList(isNet, creatorguid);
		return ResultMessage.successMsg("请求成功", list);
	}


	/**
	 * 明细
	 * 
	 * @param labellocalDetailsId
	 * @return
	 */
//	@AuthPassport(rightCode = "Label.Label")
	@RequestMapping(value = "/labelDetail")
	public @ResponseBody
	ResultMessage detail(@RequestParam String id) {
		String message = "";
		if (id == null) {
			message = "标签ID不能空";
			return ResultMessage.errorMsg(message);
		}

		List<LableStorage> labelList = labelService.getLableDetail(id);
		if (labelList == null || !(labelList.size() > 0)) {
			message = "未找到该标签";
			return ResultMessage.errorMsg(message);
		}

		return ResultMessage.successMsg("获取成功", labelList);
	}

	/**
	 * 删除标签
	 * @param labellocalDetailsId
	 * @return
	 */
//	@AuthPassport(rightCode = "Label.Label")
	@RequestMapping(value = "/labelDelete")
	public @ResponseBody
	ResultMessage delete(@RequestParam String ids, String isNet) {
		try{
			int num = 0;
			if (isNet == null) {
				return ResultMessage.errorMsg("删除出错");
			}
			if(ids != null && !"".equals(ids)){
				String[] idStr = ids.split(",");
				List<String> idList = new ArrayList<String>();
				for (int i = 0; i < idStr.length; i++) {
					idList.add(idStr[i]);
				}
				num = labelService.deleteLabels(idList, isNet);
			}else{
				num = labelService.deleteAllLabels(isNet, null);
			}
			if(num <= 0){
				return ResultMessage.errorMsg("未找到该标签");
			}
			return ResultMessage.successMsg("删除成功");
		}catch(Exception e){
			return ResultMessage.errorMsg("删除出错");
		}
	}
	
	/**
	 * 导出Excel
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "Label.Label")
	@RequestMapping(value = "/labelExport")
	public @ResponseBody ResultMessage export(@ModelAttribute SearchVo vo, PageVo pagevo) {
		
		pagevo = new PageVo(0,5000);
		
		List list = null;
//				labelService.getLabelList(pagevo, vo.getMap());

		if (list != null && list.size() > 0) {
			Map map = new HashMap();

			Map<Integer, String> stateMap = new HashMap<Integer, String>();
			stateMap.put(0, "禁用");
			stateMap.put(1, "正常");
			stateMap.put(2, "冻结");
			map.put("stateMap", stateMap);
			
			try {
				ExcelExport export = ExcelUtil.exportList(list, "labelData",
						"标签数据", map);
				

				if(export!=null)
				{
					this.dowloadExcel(export, "labeldata.xls");
					return ResultMessage.successMsg("下载成功!");
					
				}else{
					return ResultMessage.errorMsg("请检查导出参数labelData是否配置");
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
