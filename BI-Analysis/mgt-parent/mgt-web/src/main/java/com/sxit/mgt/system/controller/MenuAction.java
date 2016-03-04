package com.sxit.mgt.system.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.common.utils.MyBeanUtils;
import com.sxit.mgt.system.dto.MenuModel;
import com.sxit.mgt.system.dto.MenuNode;
import com.sxit.mgt.system.service.FunctionService;
import com.sxit.mgt.system.service.MenuService;
import com.sxit.model.system.SysFunction;
import com.sxit.model.system.SysMenu;

/**
 * @公司:深讯信科
 * @功能:系统功能 Action
 * @作者:张如兵
 * @日期:2015-06-17 16:45:33
 * @版本:1.0
 * @修改:
 */

@Controller
@RequestMapping("/system")
public class MenuAction extends BaseAction {

	@Autowired
	private MenuService menuService;

	@Autowired
	private FunctionService functionService;
	/**
	 * 列表
	 * 
	 * @param searchTxt
	 * @param page
	 * @param model
	 * @return
	 */
	@AuthPassport(rightCode = "System.Menu")
	@RequestMapping(value = "/menuList")
	public @ResponseBody
	ResultMessage list(@ModelAttribute SearchVo vo, PageVo pagevo) {

		// 列表查询
		if (pagevo == null) {
			pagevo = new PageVo(0, 100);
		}
		pagevo.setPageSize(1000);

		Page<SysMenu> page = menuService.getMenuList(pagevo,
				vo.getMap());

		List<MenuNode> nodelist = new ArrayList<MenuNode>();

		for (SysMenu menu : page) {
			MenuNode node = new MenuNode(menu);
			nodelist.add(node);
		}

		return ResultMessage.successMsg("success",
				MenuNode.buildTreeList(nodelist));
	}

	/**
	 * 明细
	 * 
	 * @param menuId
	 * @return
	 */
	@AuthPassport(rightCode = "System.Menu")
	@RequestMapping(value = "/menuDetail")
	public @ResponseBody
	ResultMessage detail(@RequestParam Integer menuId) {
		String message = "";
		if (menuId == null) {
			message = "系统功能ID不能空";
			return ResultMessage.errorMsg(message);
		}

		SysMenu menu = menuService.getMenuById(menuId);
		if (menu == null) {
			message = "未找到该系统功能";
			return ResultMessage.errorMsg(message);
		}

		return ResultMessage.successMsg("获取成功", menu);
	}

	/**
	 * 增加
	 * 
	 * @return
	 */
	@AuthPassport(rightCode = "System.Menu")
	@RequestMapping(value = "/menuAdd")
	public @ResponseBody
	ResultMessage add(@Valid @RequestBody MenuModel menuModel,
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
		SysMenu menu = new SysMenu();
		BeanUtils.copyProperties(menuModel, menu);
		
		
		menu.setFunctionId(menuModel.getMenuId());
		
		menu.setNavigation(menu.getMenuName());
		
		SysFunction function  = new SysFunction();
		
		function.setFunctionId(menu.getFunctionId());
		function.setFunctionName(menu.getMenuName());
		function.setFunctionLevel(menu.getMenuLevel());
		function.setParentId(menu.getParentId());
		function.setSort(menuModel.getSort());
		function.setFunctionCode(menuModel.getFunctionCode());
		function.setState(1);
		function.setType(1);

		menuService.insertMenuAndFunction(menu,function);
		
		
		return ResultMessage.successMsg("添加成功");
	}

	/**
	 * 编辑
	 * 
	 * @param vo
	 * @param menuId
	 * @param errors
	 * @return
	 */
	@AuthPassport(rightCode = "System.Menu")
	@RequestMapping(value = "/menuEdit")
	public @ResponseBody
	ResultMessage edit(@Valid @RequestBody MenuModel menuModel,
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

		Integer menuId = menuModel.getMenuId();
		String message = "";
		if (menuId == null) {
			message = "系统功能ID不能空";
			return ResultMessage.errorMsg(message);
		}

		SysMenu menu = menuService.getMenuById(menuId);
		if (menu == null) {
			message = "未找到该系统功能";
			return ResultMessage.errorMsg(message);
		}

		MyBeanUtils.copyProperties(menuModel, menu,
				menuModel.colset);

		menuService.update(menu);

		return ResultMessage.successMsg("修改成功");
	}

	/**
	 * 
	 * @param menuId
	 * @return
	 */
	@AuthPassport(rightCode = "System.Menu")
	@RequestMapping(value = "/menuDelete")
	public @ResponseBody
	ResultMessage delete(@RequestParam Integer menuId) {

		if (menuId == null) {
			return ResultMessage.errorMsg("系统功能ID不能空");
		}

		SysMenu menu = menuService.getMenuById(menuId);
		if (menu == null) {
			return ResultMessage.errorMsg("未找到该系统功能");
		}

		if(menu.getTarget()!=1)
		{
			functionService.delete(menu.getFunctionId());
		}
		
		menuService.delete(menuId);
		
		return ResultMessage.successMsg("删除成功");
	}

}
