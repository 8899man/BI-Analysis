package com.sxit.mgt.reports.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sxit.common.action.BaseAction;
import com.sxit.common.annatation.AuthPassport;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.dto.SearchVo;
import com.sxit.common.excel.ExcelExport;
import com.sxit.common.excel.ExcelUtil;
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.common.utils.MyBeanUtils;
import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.mgt.reports.dto.ReportsModel;
import com.sxit.mgt.reports.service.BAreaCompanyService;
import com.sxit.mgt.reports.service.ReportsService;
import com.sxit.model.reports.ReportCstDealMidOwn;


/**
 * @公司:深讯信科
 * @功能:标签 Action
 * @作者:dengbiao    
 * @日期:2015-11-02 18:07:18  
 * @版本:1.0
 * @修改:
 */

/**
 * @author kenny
 *
 */
@Controller
@RequestMapping("/reports")
public class ReportsAction extends BaseAction {
	
	@Autowired
	private ReportsService reportsService;
	
	@Autowired
	private BAreaCompanyService bareaCompanyService;
	
	private Log log;

	
	/**
	 * 列表
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/reportsList")
	public @ResponseBody ResultMessage list(@ModelAttribute SearchVo vo, PageVo pagevo) {
		
		//列表查询
		if(pagevo==null)
		{
			pagevo = new PageVo(0,10);
		}
		
		Page page = reportsService.getReportsList(pagevo, vo.getMap());

		return ResultMessage.successPage(page);
	}


	/**
	 * 导出Excel
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/reportsExport")
	public @ResponseBody ResultMessage export(@ModelAttribute SearchVo vo, PageVo pagevo) {
		
		pagevo = new PageVo(0,5000);
		
		List list = reportsService.getReportsList(pagevo, vo.getMap());

		if (list != null && list.size() > 0) {
			Map map = new HashMap();

			Map<Integer, String> stateMap = new HashMap<Integer, String>();
			stateMap.put(0, "禁用");
			stateMap.put(1, "正常");
			stateMap.put(2, "冻结");
			map.put("stateMap", stateMap);
			
			try {
				ExcelExport export = ExcelUtil.exportList(list, "reportsData",
						"标签数据", map);
				

				if(export!=null)
				{
					this.dowloadExcel(export, "reportsdata.xls");
					return ResultMessage.successMsg("下载成功!");
					
				}else{
					return ResultMessage.errorMsg("请检查导出参数reportsData是否配置");
				}

			} catch (Exception e) {
				e.printStackTrace();

				return ResultMessage.errorMsg("下载出错!");
			}
		} else {
			return ResultMessage.errorMsg("您要下载的数据为空!");
		}


		
	}



	/**
	 * 明细
	 * 
	 * @param id
	 * @return
	 */
	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/reportsDetail")
	public @ResponseBody
	ResultMessage detail(@RequestParam Long id) {
		String message = "";
		if (id == null) {
			message = "标签ID不能空";
			return ResultMessage.errorMsg(message);
		}

		ReportCstDealMidOwn reports = reportsService.getReportsById(id);
		if (reports == null) {
			message = "未找到该标签";
			return ResultMessage.errorMsg(message);
		}

		return ResultMessage.successMsg("获取成功", reports);
	}

	/**
	 * 增加
	 * 
	 * @return
	 */
	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/reportsAdd")
	public @ResponseBody
	ResultMessage add(@Valid @RequestBody ReportsModel reportsModel, Errors errors) {
		// 判断验证是否通过
		if (errors.hasErrors()) {
			StringBuilder sb = new StringBuilder();
			for (FieldError e : errors.getFieldErrors()) {
				if (sb.length() > 0) {
					sb.append(",");
				}
				sb.append(e.getDefaultMessage());
				break;
			}
			return ResultMessage.errorMsg(sb.toString());
		}
		ReportCstDealMidOwn reports = new ReportCstDealMidOwn();
		BeanUtils.copyProperties(reportsModel, reports);
		//reports.setCreateTime(new Date());
		//reports.setState(1);
		reportsService.insert(reports);
		return ResultMessage.successMsg("添加成功");
	}
	
	
	/**
	 * 编辑
	 * @param vo
	 * @param id
	 * @param errors
	 * @return
	 */
	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/reportsEdit")
	public @ResponseBody
	ResultMessage edit(@Valid  @RequestBody ReportsModel reportsModel, 
			Errors errors) {
		// 判断验证是否通过
		if (errors.hasErrors()) {
			StringBuilder sb = new StringBuilder();
			for (FieldError e : errors.getFieldErrors()) {
				if (sb.length() > 0) {
					sb.append(",");
				}
				sb.append(e.getDefaultMessage());
				break;
			}
			return ResultMessage.errorMsg(sb.toString());
		}
		
		Long id = 	 reportsModel.getId();
		String message = "";
		if (id == null) {
			message = "标签ID不能空";
			return ResultMessage.errorMsg(message);
		}

		ReportCstDealMidOwn reports = reportsService.getReportsById(id); 
		if (reports == null) {
			message = "未找到该标签";
			return ResultMessage.errorMsg(message);
		}

		
		MyBeanUtils.copyProperties(reportsModel, reports,reportsModel.colset);
		//reports.setModifyTime(new Date());

	        reportsService.update(reports);
    
		return ResultMessage.successMsg("修改成功");
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/reportsDelete")
	public @ResponseBody
	ResultMessage delete(@RequestParam Long id) {

		if (id == null) {
			return ResultMessage.errorMsg("标签ID不能空");
		}

		ReportCstDealMidOwn reports = reportsService.getReportsById(id); 
		if (reports == null) {
			return ResultMessage.errorMsg("未找到该标签");
		}

		//判断状态
		//if(reports.getState()==2)
		//{
			reportsService.delete(id);
		//}else{
			
		//	reportsService.updateToDelete(id);
		//}

		return ResultMessage.successMsg("删除成功");
	}
	
	
	/**
	 * 
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/coverage")
	public @ResponseBody ResultMessage coverage() {
		List<BAreaCompany> list = bareaCompanyService.getAreaList();
		return ResultMessage.successMsg("加载区域数据成功", list);
	}
	
	
	/**
	 * 
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/getCompanys")
	public @ResponseBody ResultMessage getCompanys(@RequestParam String areaCode) {
		List<BAreaCompany> list = bareaCompanyService.getCompanyList(areaCode);
		return ResultMessage.successMsg("加载公司数据成功", list);
	}
	
	
	/**
	 * 
	 * @param params
	 * @return
	 */
	@RequestMapping(value = "/ownerTypeData")
	public @ResponseBody ResultMessage ownerTypeData(@RequestParam Map info) {
		Map params = new HashMap();
		params.putAll(info);
//		System.out.println(params);
		if ("0".equals((String)params.get("areaCode"))) {
			params.put("areaCode", null);
		}
		if ("0".equals((String)params.get("companyCode"))) {
			params.put("companyCode", null);
		}
		Map data = reportsService.ownerTypeData(params);
		return ResultMessage.successMsg("加载数据成功", data);
	}
	
	
	@RequestMapping(value = "/turnoverCustomerData")
	public @ResponseBody ResultMessage turnoverCustomerData(@RequestParam Map info) {
		Map params = new HashMap();
		params.putAll(info);
		
//		System.out.println(params);
		
		Map data = reportsService.turnoverCustomerData(params);
		
		return ResultMessage.successMsg("加载数据成功", data);
	}
	
	
	@RequestMapping(value = "/getBuyTimesData")
	public @ResponseBody ResultMessage getBuyTimesData(@RequestParam Map info) {
		Map params = new HashMap();
		params.putAll(info);
		System.out.println(params);
		
		Map data = reportsService.getBuyTimesData(params);
		return ResultMessage.successMsg("加载数据成功", data);
	}
}
