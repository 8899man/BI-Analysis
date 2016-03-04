package com.sxit.mgt.system.dto;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

/**
 * @公司:深讯信科
 * @功能:系统菜单 Model
 * @作者:张如兵
 * @日期:2015-06-17 16:46:49
 * @版本:1.0
 * @修改:
 */

public class MenuModel {

	public Set<String> colset = new HashSet<String>(0);
	/**
	 * 菜单ID
	 */
	@NotNull(message = "菜单ID不能为空")
	private Integer menuId;
	/**
	 * 功能ID
	 */
	//@NotNull(message = "功能ID不能为空")
	private Integer functionId;
	/**
	 * 菜单名称
	 */
	@NotBlank(message = "菜单名称不能为空")
	private String menuName;
	/**
	 * 菜单地址
	 */
	@NotBlank(message = "请求路径不能为空")
	private String action;
	/**
	 * 菜单层级
	 */
	//@NotNull(message = "菜单层级不能为空")
	private Integer menuLevel;
	/**
	 * 菜单样式
	 */
	//@NotBlank(message = "菜单样式不能为空")
	private String menuClass;

	/**
	 * 父菜单
	 */
	// @NotNull(message = "父菜单不能为空")
	private Integer parentId;
	/**
	 * 排序
	 */
	//@NotNull(message = "排序不能为空")
	private Integer sort;

	/**
	 * 目标
	 */
	private Integer target;
	
	/**
	 * 
	 */
	private String functionCode;
	

	public MenuModel() {
		super();
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		colset.add("menuId");
		this.menuId = menuId;
	}

	public Integer getFunctionId() {
		return functionId;
	}

	public void setFunctionId(Integer functionId) {
		colset.add("functionId");
		this.functionId = functionId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		colset.add("menuName");
		this.menuName = menuName;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		colset.add("action");
		this.action = action;
	}

	public Integer getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(Integer menuLevel) {
		colset.add("menuLevel");
		this.menuLevel = menuLevel;
	}

	public String getMenuClass() {
		return menuClass;
	}

	public void setMenuClass(String menuClass) {
		colset.add("menuClass");
		this.menuClass = menuClass;
	}


	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		colset.add("parentId");
		this.parentId = parentId;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		colset.add("sort");
		this.sort = sort;
	}

	public Integer getTarget() {
		return target;
	}

	public void setTarget(Integer target) {
		colset.add("target");
		this.target = target;
	}

	public String getFunctionCode() {
		return functionCode;
	}

	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}

}
