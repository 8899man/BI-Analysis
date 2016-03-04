package com.sxit.mgt.pmp.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sxit.common.action.BaseAction;
import com.sxit.common.annatation.AuthPassport;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.dto.SearchVo;
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.model.pmp.BProjSum;

import com.sxit.mgt.pmp.dto.BProjSumModel;
import com.sxit.mgt.pmp.service.BProjSumService;
import com.sxit.mgt.pmp.service.BareaCompanyService;
import com.sxit.mgt.pmp.dto.BareaCompany;

/**
 * @公司:深讯信科
 * @功能:BProjSum Action
 * @作者:Edson.di
 * @日期:2015-09-23 09:43:07
 * @版本:1.0
 * @修改:
 */

@Controller
@RequestMapping("/pmp")
public class BProjSumAction extends BaseAction {

	private final static Logger log = Logger.getLogger(BProjSumAction.class);

	@Autowired
	private BProjSumService bProjSumService;
	
	@Autowired
	private BareaCompanyService bareaCompanyService;

	/**
	 * 列表 查询所有
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	// @AuthPassport(rightCode = "pmp.bprojsum")
	@RequestMapping(value = "/projectHouseList")
	public @ResponseBody
	ResultMessage list(@ModelAttribute SearchVo vo, PageVo pagevo) {
		// 列表查询
		if (pagevo == null) {
			pagevo = new PageVo(0, 16);
		}
		Page<BProjSum> page = bProjSumService.getBProjSumList(pagevo,
				vo.getMap());
		for (BProjSum bproj : page) {
			bproj.setSaleamountsum((double) Math.round(bproj.getSaleamountsum() / 10000));
		}

		return ResultMessage.successPage(page);
	}

	/**
	 * 列表 查询在售
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	// @AuthPassport(rightCode = "pmp.bprojsum")
	@RequestMapping(value = "/projectHouseOnList")
	public @ResponseBody
	ResultMessage Onlist(@ModelAttribute SearchVo vo, PageVo pagevo) {

		// 列表查询
		if (pagevo == null) {
			pagevo = new PageVo(0, 16);
		}
		Page<BProjSum> page = bProjSumService.getBProjSumOnList(pagevo,
				vo.getMap());

		// 金额亿转万 四舍五入 保留整数
		for (BProjSum bproj : page) {
			bproj.setSaleamountsum((double) Math.round(bproj.getSaleamountsum() / 10000));
		}

		return ResultMessage.successPage(page);
	}

	/**
	 * 列表 查询在售
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	// @AuthPassport(rightCode = "pmp.bprojsum")
	@RequestMapping(value = "/projectHouseEndList")
	public @ResponseBody
	ResultMessage Endlist(@ModelAttribute SearchVo vo, PageVo pagevo) {

		// 列表查询
		if (pagevo == null) {
			pagevo = new PageVo(0, 16);
		}
		Page<BProjSum> page = bProjSumService.getBProjSumEndList(pagevo,
				vo.getMap());

		for (BProjSum bproj : page) {
			bproj.setSaleamountsum((double) Math.round(bproj.getSaleamountsum() / 10000));
		}

		return ResultMessage.successPage(page);
	}

	/**
	 * 增加 项目汇总信息
	 * 
	 * @return
	 */
	@AuthPassport(rightCode = "pmp.bprojsum")
	@RequestMapping(value = "/bProjSumAdd")
	public @ResponseBody
	ResultMessage add(@Valid @RequestBody BProjSumModel bProjSumModel,
			Errors errors) {
		BProjSum bprojsum = new BProjSum();
		BeanUtils.copyProperties(bProjSumModel, bprojsum);
		bprojsum.setCreate_time((Timestamp) new Date());
		bProjSumService.insert(bprojsum);
		return ResultMessage.successMsg("添加成功");
	}

	/**
	 * 按区域ID，城市ID来查询
	 * 
	 * @param userId
	 * @return
	 */
	// @AuthPassport(rightCode = "pmp.bprojsum")
	@RequestMapping(value = "/Search")
	public @ResponseBody
	ResultMessage detail(@RequestParam String areaName, String companyName) {
		String message = "";
		if (companyName == null) {
			message = "系统城市ID不能空";
			return ResultMessage.errorMsg(message);
		}
		Map map = new HashMap();
		map.put("areaName",areaName);
		map.put("companyName",companyName);

		List<BProjSum> list = bProjSumService.getBProjSumById(
				(String)map.get("areaName"), (String)map.get("companyName"));
		if (list == null) {
			message = "未找到该系统区域或者城市";
			return ResultMessage.errorMsg(message);
		}
		
		for (BProjSum bproj : list) {
			bproj.setSaleamountsum((double) Math.round(bproj.getSaleamountsum() / 10000));
		}
		
		Map maps = new HashMap();
		maps.put("list", list);
		
		return ResultMessage.successMsg("获取成功", maps);
	}

	@RequestMapping(value = "/projectHouseQueryList")
	public @ResponseBody
	ResultMessage init() {
		List<BareaCompany> arealist = new ArrayList<BareaCompany>();
		List<BareaCompany> list = bareaCompanyService.getAreaList();
		BareaCompany bac1 = new BareaCompany();
		bac1.setAreaName("集团");
		bac1.setAreaCode("0");
		arealist.add(bac1);
		arealist.addAll(list);
		
		try {
			String str = gnerateJsonFromObject(arealist);
			System.out.println(str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ResultMessage.successMsg("获取成功", arealist);
	}
	
	
	@RequestMapping(value = "/getCompany")
	public @ResponseBody
	ResultMessage getCompany(@RequestParam String areaCode) {
		if(areaCode == null){
			return ResultMessage.errorMsg("获取数据失败");
		}
		List<BareaCompany> arealist = new ArrayList<BareaCompany>();
		if(!"0".equals(areaCode)){
			List<BareaCompany> list = bareaCompanyService.getCompanyList(areaCode);
			BareaCompany bac1 = new BareaCompany();
			/*bac1.setCompanyName("不限");
			bac1.setCompanyCode("0");
			arealist.add(bac1);*/
			arealist.addAll(list);
		}
		
		return ResultMessage.successMsg("获取成功", arealist);
	}

	@RequestMapping(value = "/projectList")
	public @ResponseBody
	ResultMessage queryCounts() {
		int counts = bProjSumService.queryByCount();
		Map map = new HashMap();
		map.put("counts", counts);
		return ResultMessage.successMsg("获取成功", map);
	}

	public static String gnerateJsonFromObject(Object object) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(object);
	}

}
