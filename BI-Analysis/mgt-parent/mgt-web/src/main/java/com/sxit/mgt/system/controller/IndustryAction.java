package com.sxit.mgt.system.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxit.common.utils.MyBeanUtils;

import com.sxit.common.excel.ExcelExport;
import com.sxit.common.excel.ExcelUtil;

import com.sxit.common.action.BaseAction;
import com.sxit.common.annatation.AuthPassport;
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.dto.SearchVo;
import com.sxit.mgt.system.service.IndustryService;
import com.sxit.mgt.system.dto.IndustryModel;
import com.sxit.model.system.BIndustry;

/**
 * @公司:深讯信科
 * @功能:业态 Action
 * @作者:张如兵
 * @日期:2015-12-16 16:44:46
 * @版本:1.0
 * @修改:
 */

@Controller
@RequestMapping("/system")
public class IndustryAction extends BaseAction {

	@Autowired
	private IndustryService industryService;

	/**
	 * 列表
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "System.Industry")
	@RequestMapping(value = "/industryList")
	public @ResponseBody
	ResultMessage list(@ModelAttribute SearchVo vo, PageVo pagevo) {

		// 列表查询
		if (pagevo == null) {
			pagevo = new PageVo(0, 10);
		}

		Page page = industryService.getIndustryList(pagevo, vo.getMap());

		return ResultMessage.successPage(page);
	}

	/**
	 * 导出Excel
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "System.Industry")
	@RequestMapping(value = "/industryExport")
	public @ResponseBody
	ResultMessage export(@ModelAttribute SearchVo vo, PageVo pagevo) {

		pagevo = new PageVo(0, 5000);

		List list = industryService.getIndustryList(pagevo, vo.getMap());

		if (list != null && list.size() > 0) {
			Map map = new HashMap();

			Map<Integer, String> stateMap = new HashMap<Integer, String>();
			stateMap.put(0, "禁用");
			stateMap.put(1, "正常");
			stateMap.put(2, "冻结");
			map.put("stateMap", stateMap);

			try {
				ExcelExport export = ExcelUtil.exportList(list, "industryData",
						"业态数据", map);

				if (export != null) {
					this.dowloadExcel(export, "industrydata.xls");
					return ResultMessage.successMsg("下载成功!");

				} else {
					return ResultMessage.errorMsg("请检查导出参数industryData是否配置");
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
	 * @param industryid
	 * @return
	 */
	@AuthPassport(rightCode = "System.Industry")
	@RequestMapping(value = "/industryDetail")
	public @ResponseBody
	ResultMessage detail(@RequestParam String industryid) {
		String message = "";
		if (industryid == null) {
			message = "业态ID不能空";
			return ResultMessage.errorMsg(message);
		}

		BIndustry industry = industryService.getIndustryById(industryid);
		if (industry == null) {
			message = "未找到该业态";
			return ResultMessage.errorMsg(message);
		}

		// 数据权限
		List<String> orgGuidList = industryService.getOrgIdList(industryid);

		industry.setOrgGuidList(orgGuidList);

		return ResultMessage.successMsg("获取成功", industry);
	}

	/**
	 * 增加
	 * 
	 * @return
	 */
	@AuthPassport(rightCode = "System.Industry")
	@RequestMapping(value = "/industryAdd")
	public @ResponseBody
	ResultMessage add(@Valid @RequestBody IndustryModel industryModel,
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
		BIndustry industry = new BIndustry();
		BeanUtils.copyProperties(industryModel, industry);
		industry.setCreatetime(new Date());
		// industry.setState(1);
		industryService.insert(industry);
		return ResultMessage.successMsg("添加成功");
	}

	/**
	 * 编辑
	 * 
	 * @param vo
	 * @param industryid
	 * @param errors
	 * @return
	 */
	@AuthPassport(rightCode = "System.Industry")
	@RequestMapping(value = "/industryEdit")
	public @ResponseBody
	ResultMessage edit(@Valid @RequestBody IndustryModel industryModel,
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

		String industryid = industryModel.getIndustryid();
		String message = "";
		if (industryid == null) {
			message = "业态ID不能空";
			return ResultMessage.errorMsg(message);
		}

		BIndustry industry = industryService.getIndustryById(industryid);
		if (industry == null) {
			message = "未找到该业态";
			return ResultMessage.errorMsg(message);
		}

		MyBeanUtils.copyProperties(industryModel, industry,
				industryModel.colset);
		// industry.setModifyTime(new Date());

		industryService.update(industry);

		return ResultMessage.successMsg("修改成功");
	}

	@AuthPassport(rightCode = "System.Industry")
	@RequestMapping(value = "/industryUpdateOrg")
	public @ResponseBody
	ResultMessage updateOrg(@Valid @RequestBody IndustryModel industryModel,
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
		String industryid = industryModel.getIndustryid();
		String message = "";
		if (industryid == null) {
			message = "业态ID不能空";
			return ResultMessage.errorMsg(message);
		}
		BIndustry industry = industryService.getIndustryById(industryid);
		if (industry == null) {
			message = "未找到该业态";
			return ResultMessage.errorMsg(message);
		}

		MyBeanUtils.copyProperties(industryModel, industry,
				industryModel.colset);

		industryService.updateOrg(industry);

		return ResultMessage.successMsg("修改成功");
	}

	/**
	 * 
	 * @param industryid
	 * @return
	 */
	@AuthPassport(rightCode = "System.Industry")
	@RequestMapping(value = "/industryDelete")
	public @ResponseBody
	ResultMessage delete(@RequestParam String industryid) {

		if (industryid == null) {
			return ResultMessage.errorMsg("业态ID不能空");
		}

		BIndustry industry = industryService.getIndustryById(industryid);
		if (industry == null) {
			return ResultMessage.errorMsg("未找到该业态");
		}

		// 判断状态
		// if(industry.getState()==2)
		// {
		industryService.delete(industryid);
		// }else{

		// industryService.updateToDelete(industryid);
		// }

		return ResultMessage.successMsg("删除成功");
	}

}
