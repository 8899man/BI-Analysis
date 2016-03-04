package com.sxit.mgt.system.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

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

import com.sxit.common.action.BaseAction;
import com.sxit.common.annatation.AuthPassport;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.dto.SearchVo;
import com.sxit.common.excel.ExcelExport;
import com.sxit.common.excel.ExcelUtil;
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.common.utils.MyBeanUtils;
import com.sxit.common.utils.tree.StringNode;
import com.sxit.common.utils.tree.TreeUtils;
import com.sxit.mgt.system.dto.AdNode;
import com.sxit.mgt.system.dto.AdOrgModel;
import com.sxit.mgt.system.dto.FunctionNode;
import com.sxit.mgt.system.dto.OrgNode;
import com.sxit.mgt.system.service.AdOrgService;
import com.sxit.model.system.BOrg;
import com.sxit.model.system.BaseUser;
import com.sxit.model.system.SysAdOrg;
import com.sxit.model.system.SysFunction;

/**
 * @公司:深讯信科
 * @功能:ad组织 Action
 * @作者:张如兵
 * @日期:2015-12-11 14:43:07
 * @版本:1.0
 * @修改:
 */

@Controller
@RequestMapping("/system")
public class AdOrgAction extends BaseAction {

	@Autowired
	private AdOrgService adOrgService;

	/**
	 * 列表
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "System.AdOrg")
	@RequestMapping(value = "/adOrgList")
	public @ResponseBody
	ResultMessage list(@ModelAttribute SearchVo vo, PageVo pagevo) {

		// 列表查询
		if (pagevo == null) {
			pagevo = new PageVo(0, 10);
		}

		pagevo.setPageSize(20000);

		Page<SysAdOrg> page = adOrgService.getAdOrgList(pagevo, vo.getMap());

		List<StringNode> nodelist = new ArrayList<StringNode>();

		for (SysAdOrg org : page) {
			AdNode node = new AdNode(org);
			nodelist.add(node);
		}

		List<StringNode> tree = TreeUtils.getStringTreeList(nodelist);

		return ResultMessage.successMsg("ok", tree);

	}

	@AuthPassport(rightCode = "common")
	@RequestMapping(value = "/adOrgTree")
	public @ResponseBody
	List<AdNode> tree(@ModelAttribute SearchVo vo, PageVo pagevo) {
		BaseUser user = this.getCurUser();
		if (pagevo == null) {
			pagevo = new PageVo(0, 10);
		}

		pagevo.setPageSize(20000);

		Page<SysAdOrg> list = adOrgService.getAdOrgList(pagevo, vo.getMap());

		List<AdNode> nodelist = new ArrayList<AdNode>();

		for (SysAdOrg org : list) {
			
			if(org.getCheckState()==1)
			{
				AdNode node = new AdNode(org);
				nodelist.add(node);
			}
			
		}

		List<AdNode> tree = AdNode.buildTree(nodelist);

		return tree;
	}

	/**
	 * 导出Excel
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "System.AdOrg")
	@RequestMapping(value = "/adOrgExport")
	public @ResponseBody
	ResultMessage export(@ModelAttribute SearchVo vo, PageVo pagevo) {

		pagevo = new PageVo(0, 5000);

		List list = adOrgService.getAdOrgList(pagevo, vo.getMap());

		if (list != null && list.size() > 0) {
			Map map = new HashMap();

			Map<Integer, String> stateMap = new HashMap<Integer, String>();
			stateMap.put(0, "禁用");
			stateMap.put(1, "正常");
			stateMap.put(2, "冻结");
			map.put("stateMap", stateMap);

			try {
				ExcelExport export = ExcelUtil.exportList(list, "adOrgData",
						"ad组织数据", map);

				if (export != null) {
					this.dowloadExcel(export, "adOrgdata.xls");
					return ResultMessage.successMsg("下载成功!");

				} else {
					return ResultMessage.errorMsg("请检查导出参数adOrgData是否配置");
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
	 * @param adGuid
	 * @return
	 */
	@AuthPassport(rightCode = "System.AdOrg")
	@RequestMapping(value = "/adOrgDetail")
	public @ResponseBody
	ResultMessage detail(@RequestParam String adGuid) {
		String message = "";
		if (adGuid == null) {
			message = "ad组织ID不能空";
			return ResultMessage.errorMsg(message);
		}

		SysAdOrg adOrg = adOrgService.getAdOrgById(adGuid);
		if (adOrg == null) {
			message = "未找到该ad组织";
			return ResultMessage.errorMsg(message);
		}

		return ResultMessage.successMsg("获取成功", adOrg);
	}

	/**
	 * 增加
	 * 
	 * @return
	 */
	@AuthPassport(rightCode = "System.AdOrg")
	@RequestMapping(value = "/adOrgAdd")
	public @ResponseBody
	ResultMessage add(@Valid @RequestBody AdOrgModel adOrgModel, Errors errors) {
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
		SysAdOrg adOrg = new SysAdOrg();
		BeanUtils.copyProperties(adOrgModel, adOrg);
		adOrg.setCreateTime(new Date());
		// adOrg.setState(1);
		adOrgService.insert(adOrg);
		return ResultMessage.successMsg("添加成功");
	}

	/**
	 * 编辑
	 * 
	 * @param vo
	 * @param adGuid
	 * @param errors
	 * @return
	 */
	@AuthPassport(rightCode = "System.AdOrg")
	@RequestMapping(value = "/adOrgEdit")
	public @ResponseBody
	ResultMessage edit(@Valid @RequestBody AdOrgModel adOrgModel, Errors errors) {
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

		String adGuid = adOrgModel.getAdGuid();
		String message = "";
		if (adGuid == null) {
			message = "ad组织ID不能空";
			return ResultMessage.errorMsg(message);
		}

		SysAdOrg adOrg = adOrgService.getAdOrgById(adGuid);
		if (adOrg == null) {
			message = "未找到该ad组织";
			return ResultMessage.errorMsg(message);
		}

		MyBeanUtils.copyProperties(adOrgModel, adOrg, adOrgModel.colset);
		// adOrg.setModifyTime(new Date());

		adOrgService.update(adOrg);

		return ResultMessage.successMsg("修改成功");
	}

	/**
	 * 审批
	 * 
	 * @param adOrgModel
	 * @param errors
	 * @return
	 */
	@AuthPassport(rightCode = "System.AdOrg")
	@RequestMapping(value = "/adOrgCheck")
	public @ResponseBody
	ResultMessage check(@Valid @RequestBody AdOrgModel adOrgModel, Errors errors) {
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

		String adGuid = adOrgModel.getAdGuid();
		String message = "";
		if (adGuid == null) {
			message = "ad组织ID不能空";
			return ResultMessage.errorMsg(message);
		}

		SysAdOrg adOrg = adOrgService.getAdOrgById(adGuid);
		if (adOrg == null) {
			message = "未找到该ad组织";
			return ResultMessage.errorMsg(message);
		}

		MyBeanUtils.copyProperties(adOrgModel, adOrg, adOrgModel.colset);
		// adOrg.setModifyTime(new Date());

		adOrg.setCheckState(1);
		adOrg.setState(1);

		adOrgService.checkOk(adOrg);

		return ResultMessage.successMsg("修改成功");
	}

	/**
	 * 
	 * @param adGuid
	 * @return
	 */
	@AuthPassport(rightCode = "System.AdOrg")
	@RequestMapping(value = "/adOrgDelete")
	public @ResponseBody
	ResultMessage delete(@RequestParam String adGuid) {

		if (adGuid == null) {
			return ResultMessage.errorMsg("ad组织ID不能空");
		}

		SysAdOrg adOrg = adOrgService.getAdOrgById(adGuid);
		if (adOrg == null) {
			return ResultMessage.errorMsg("未找到该ad组织");
		}

		// 判断状态
		// if(adOrg.getState()==2)
		// {
		adOrgService.delete(adGuid);
		// }else{

		// adOrgService.updateToDelete(adGuid);
		// }

		return ResultMessage.successMsg("删除成功");
	}

}
