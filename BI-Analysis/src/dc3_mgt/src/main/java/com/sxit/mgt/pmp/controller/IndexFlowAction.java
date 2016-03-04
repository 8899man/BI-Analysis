package com.sxit.mgt.pmp.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;


import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.sxit.common.action.BaseAction;
import com.sxit.common.annatation.AuthPassport;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.dto.SearchVo;
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.pmp.dao.IndexFlowDao;
import com.sxit.mgt.pmp.dto.IndexFlowModel;
import com.sxit.model.pmp.IndexFlow;
import com.sxit.mgt.pmp.service.IndexFlowService;

/**
 * @公司:深讯信科
 * @功能:IndexFlow Action
 * @作者:Edson.di   
 * @日期:2015-09-23 09:43:07  
 * @版本:1.0
 * @修改:
 */

@Controller
@RequestMapping("/pmp") 
public class IndexFlowAction extends BaseAction {
	
	private final static Logger log= Logger.getLogger(IndexFlowAction.class);
	
	
	@Autowired
	private IndexFlowService indexFlowService;
	
	/**
	 * 列表  查询所有
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "pmp.indexFlow")
	@RequestMapping(value = "/indexFlowList")
	public @ResponseBody
	ResultMessage list(@ModelAttribute SearchVo vo, PageVo pagevo) {

		// 列表查询
		if (pagevo == null) {
			pagevo = new PageVo(0, 10);
		}

		Page page = indexFlowService.getindexFlowList(pagevo, vo.getMap());

		return ResultMessage.successPage(page);
	}
	
	
	/**
	 * 增加  项目汇总信息
	 * 
	 * @return
	 */
	@AuthPassport(rightCode = "pmp.indexFlow")
	@RequestMapping("/indexFlowAdd")
	public @ResponseBody
	ResultMessage add(@Valid @RequestBody IndexFlowModel indexFlowModel,
			Errors errors) {
		IndexFlow indexFlow = new IndexFlow();
		BeanUtils.copyProperties(indexFlowModel, indexFlow);
		indexFlow.setCreatetime((Timestamp) new Date());
		indexFlowService.insert(indexFlow);
		return ResultMessage.successMsg("添加成功");
	}
}
