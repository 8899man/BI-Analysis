package com.sxit.mgt.system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import com.sxit.common.pagehelper.PageVo;
import com.sxit.common.utils.MyBeanUtils;
import com.sxit.common.utils.tree.StringNode;
import com.sxit.common.utils.tree.TreeUtils;
import com.sxit.mgt.system.dto.BOrgModel;
import com.sxit.mgt.system.dto.OrgNode;
import com.sxit.mgt.system.service.BOrgService;
import com.sxit.model.system.BOrg;
import com.sxit.model.system.BaseUser;
import com.sxit.model.system.SysProj;

/**
 * @公司:深讯信科
 * @功能:组织 Action
 * @作者:张如兵
 * @日期:2015-11-27 16:57:02
 * @版本:1.0
 * @修改:
 */

@Controller
@RequestMapping("/system")
public class BOrgAction extends BaseAction {

	@Autowired
	private BOrgService bOrgService;

	/**
	 * 列表
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "System.BOrg")
	@RequestMapping(value = "/bOrgList")
	public @ResponseBody
	ResultMessage list(@ModelAttribute SearchVo vo, PageVo pagevo) {

		List<BOrg> list = bOrgService.getAllBOrgList(vo.getMap());

		List<StringNode> nodelist = new ArrayList<StringNode>();

		for (BOrg org : list) {
			OrgNode node = new OrgNode(org.getOrgguid(), org.getOrgname(),
					org.getParentguid(), org.getOrgtype(),org.getSubtype());
			nodelist.add(node);
		}
 
		List<StringNode> tree = TreeUtils.getStringTree(nodelist);

		return ResultMessage.successMsg("ok", tree);
	}

	@AuthPassport(rightCode = "common")
	@RequestMapping(value = "/orgTree")
	public @ResponseBody
	List<StringNode> tree(@ModelAttribute SearchVo vo, PageVo pagevo) {

		BaseUser user = this.getCurUser();
		List<BOrg> list = bOrgService.getAllBOrgList(null);

		List<StringNode> nodelist = new ArrayList<StringNode>();

		for (BOrg org : list) {
			OrgNode node = new OrgNode(org.getOrgguid(), org.getOrgname(),
					org.getParentguid(),org.getOrgtype(), org.getSubtype());
			nodelist.add(node);
		}

		List tree = TreeUtils.getStringTree(nodelist);

		if (user.getUserType() == 1 || user.getUserType() == 99) {
			return tree;
		} else {

			for (StringNode orgnode : nodelist) {
				if (orgnode.getId().equals(user.getOrgId())) {
					List<StringNode> list2 = new ArrayList<StringNode>();
					list2.add(orgnode);
					return list2;
				}
			}
		}
		return new ArrayList<StringNode>();
	}

	/**
	 * 权限树
	 * @param vo
	 * @param pagevo
	 * @return
	 */
	@AuthPassport(rightCode = "common")
	@RequestMapping(value = "/dataTree")
	public @ResponseBody
	List<StringNode> dataTree(@ModelAttribute SearchVo vo, PageVo pagevo) {

		BaseUser user = this.getCurUser();
		List<BOrg> list = bOrgService.getAllBOrgListByPower();

		List<StringNode> nodelist = new ArrayList<StringNode>();

		for (BOrg org : list) {

			if (org.getParentguid() == null || "0".equals(org.getParentguid())) {
				OrgNode node = new OrgNode("o_" + org.getOrgguid(),
						org.getOrgname(), org.getParentguid(),org.getOrgtype(),org.getSubtype());
				node.setType("org");
				nodelist.add(node);
			} else {

				OrgNode node = new OrgNode("o_" + org.getOrgguid(),
						org.getOrgname(), "o_" + org.getParentguid(),org.getOrgtype(),
						org.getSubtype());
				node.setType("org");
				nodelist.add(node);
			}

		}

		List<SysProj> list_p = bOrgService.getAllProjList();

		for (SysProj p : list_p) {
			
			
			if(p.getLevel().intValue()==2)
			{
				OrgNode node = new OrgNode("p_" + p.getProjguid(),
						p.getProjname(), "o_" + p.getCompanyguid(), null,null);
				node.setType("project");
				nodelist.add(node);
				
				System.out.println( "p_" + p.getProjguid() +"----" + "o_" + p.getCompanyguid());
				
			}else if(p.getLevel().intValue()==3){
				
				OrgNode node = new OrgNode("p_" + p.getProjguid(),
						p.getProjname(), "p_" + p.getParentguid(),null, null);
				node.setType("project");
				nodelist.add(node);
				
				System.out.println("p_" + p.getProjguid() +"====" + "o_" + p.getParentguid());
				
			}

			System.out.println("Parentguid:"+p.getParentguid());
		}

		
		List<StringNode> tree = TreeUtils.getStringTree(nodelist);
				
				//OrgNode.buildTree(nodelist);

		if (user.getUserType() == 1 || user.getUserType() == 99) {
			return tree;
		} else {

			for (StringNode orgnode : nodelist) {
				if (orgnode.getId().equals("o_" + user.getOrgId())) {
					List<StringNode> list2 = new ArrayList<StringNode>();
					list2.add(orgnode);
					return list2;
				}
			}

		}
		return new ArrayList<StringNode>();

		// return ResultMessage.successMsg("成功", tree);
	}

	/**
	 * 全部组织树
	 * @param vo
	 * @param pagevo
	 * @return
	 */
	@AuthPassport(rightCode = "common")
	@RequestMapping(value = "/orgTreeAll")
	public @ResponseBody
	List<OrgNode> treeAll(@ModelAttribute SearchVo vo, PageVo pagevo) {

		BaseUser user = this.getCurUser();
		List<BOrg> list = bOrgService.getAllBOrgList(null);

		List<OrgNode> nodelist = new ArrayList<OrgNode>();

		for (BOrg org : list) {
			OrgNode node = new OrgNode(org.getOrgguid(), org.getOrgname(),
					org.getParentguid(),org.getOrgtype(), org.getSubtype());
			node.setType("org");
			nodelist.add(node);
		}

		List<OrgNode> tree = OrgNode.buildTree(nodelist);

		return tree;

	}
	
	/**
	 * 业态树
	 * @param vo
	 * @param pagevo
	 * @return
	 */
	@AuthPassport(rightCode = "common")
	@RequestMapping(value = "/orgIndustryTree")
	public @ResponseBody
	List<OrgNode> orgIndustryTree(@ModelAttribute SearchVo vo, PageVo pagevo) {

		BaseUser user = this.getCurUser();
		List<BOrg> list = bOrgService.getAllBOrgListByIndustry();

		List<OrgNode> nodelist = new ArrayList<OrgNode>();

		for (BOrg org : list) {
			OrgNode node = new OrgNode(org.getOrgguid(), org.getOrgname(),
					org.getParentguid(),org.getOrgtype(), org.getSubtype());
			node.setType("org");
			nodelist.add(node);
		}

		List<OrgNode> tree = OrgNode.buildTree(nodelist);

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
	@AuthPassport(rightCode = "System.BOrg")
	@RequestMapping(value = "/bOrgExport")
	public @ResponseBody
	ResultMessage export(@ModelAttribute SearchVo vo, PageVo pagevo) {

		pagevo = new PageVo(0, 5000);

		List list = bOrgService.getBOrgList(pagevo, vo.getMap());

		if (list != null && list.size() > 0) {
			Map map = new HashMap();

			Map<Integer, String> stateMap = new HashMap<Integer, String>();
			stateMap.put(0, "禁用");
			stateMap.put(1, "正常");
			stateMap.put(2, "冻结");
			map.put("stateMap", stateMap);

			try {
				ExcelExport export = ExcelUtil.exportList(list, "bOrgData",
						"组织数据", map);

				if (export != null) {
					this.dowloadExcel(export, "bOrgdata.xls");
					return ResultMessage.successMsg("下载成功!");

				} else {
					return ResultMessage.errorMsg("请检查导出参数bOrgData是否配置");
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
	 * @param orgguid
	 * @return
	 */
	@AuthPassport(rightCode = "System.BOrg")
	@RequestMapping(value = "/bOrgDetail")
	public @ResponseBody
	ResultMessage detail(@RequestParam String orgguid) {
		String message = "";
		if (orgguid == null) {
			message = "组织ID不能空";
			return ResultMessage.errorMsg(message);
		}

		BOrg bOrg = bOrgService.getBOrgById(orgguid);
		if (bOrg == null) {
			message = "未找到该组织";
			return ResultMessage.errorMsg(message);
		}

		return ResultMessage.successMsg("获取成功", bOrg);
	}

	/**
	 * 增加
	 * 
	 * @return
	 */
	@AuthPassport(rightCode = "System.BOrg")
	@RequestMapping(value = "/bOrgAdd")
	public @ResponseBody
	ResultMessage add(@Valid @RequestBody BOrgModel bOrgModel, Errors errors) {
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
		BOrg bOrg = new BOrg();
		BeanUtils.copyProperties(bOrgModel, bOrg);

		bOrg.setOrgguid(UUID.randomUUID().toString());
		// bOrg.setState(1);
		bOrgService.insert(bOrg);
		return ResultMessage.successMsg("添加成功");
	}

	/**
	 * 编辑
	 * 
	 * @param vo
	 * @param orgguid
	 * @param errors
	 * @return
	 */
	@AuthPassport(rightCode = "System.BOrg")
	@RequestMapping(value = "/bOrgEdit")
	public @ResponseBody
	ResultMessage edit(@Valid @RequestBody BOrgModel bOrgModel, Errors errors) {
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

		String orgguid = bOrgModel.getOrgguid();
		String message = "";
		if (orgguid == null) {
			message = "组织ID不能空";
			return ResultMessage.errorMsg(message);
		}

		BOrg bOrg = bOrgService.getBOrgById(orgguid);
		if (bOrg == null) {
			message = "未找到该组织";
			return ResultMessage.errorMsg(message);
		}

		MyBeanUtils.copyProperties(bOrgModel, bOrg, bOrgModel.colset);
		// bOrg.setModifyTime(new Date());

		bOrgService.update(bOrg);

		return ResultMessage.successMsg("修改成功");
	}

	/**
	 * 
	 * @param orgguid
	 * @return
	 */
	@AuthPassport(rightCode = "System.BOrg")
	@RequestMapping(value = "/bOrgDelete")
	public @ResponseBody
	ResultMessage delete(@RequestParam String orgguid) {

		if (orgguid == null) {
			return ResultMessage.errorMsg("组织ID不能空");
		}

		BOrg bOrg = bOrgService.getBOrgById(orgguid);
		if (bOrg == null) {
			return ResultMessage.errorMsg("未找到该组织");
		}

		// 判断状态
		// if(bOrg.getState()==2)
		// {
		bOrgService.delete(orgguid);
		// }else{

		// bOrgService.updateToDelete(orgguid);
		// }

		return ResultMessage.successMsg("删除成功");
	}

}
