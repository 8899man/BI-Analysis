package com.sxit.mgt.system.dto;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.sxit.model.common.CheckBoxVo;

/**
 * @公司:深讯信科
 * @功能:系统功能 Model
 * @作者:张如兵    
 * @日期:2015-06-17 16:45:33  
 * @版本:1.0
 * @修改:
 */
 

@JsonIgnoreProperties(ignoreUnknown=true)
public class FunctionModel {

  	public Set<String> colset = new HashSet<String>(0);
	/**
	 *功能ID 
	 */
	// @NotNull(message = "功能ID不能为空")
	private Integer functionId; 
	/**
	 *功能名称 
	 */
	 @NotBlank(message = "功能名称不能为空")
	private String functionName; 
	/**
	 *功能编码 
	 */
	 @NotBlank(message = "功能编码不能为空")
	private String functionCode; 

	/**
	 *功能级别 
	 */
	// @NotNull(message = "功能级别不能为空")
	private Integer functionLevel; 
	/**
	 *父功能 
	 */
	// @NotNull(message = "父功能不能为空")
	private Integer parentId; 
	/**
	 *排序 
	 */
	// @NotNull(message = "排序不能为空")
	private Integer sort; 
	/**
	 *类别 
	 */
	// @NotNull(message = "类别不能为空")
	private Integer type; 
	
	/**
	 *状态 
	 */
	private Integer state; 
	
	private List<CheckBoxVo> roleList;
	
	public FunctionModel() { 
	  super();
	}
	
	public Integer getFunctionId() {
		return functionId;
	}
	
	public void setFunctionId(Integer functionId) {
	    colset.add("functionId");
		this.functionId = functionId;
	}
	
	public String getFunctionName() {
		return functionName;
	}
	
	public void setFunctionName(String functionName) {
	    colset.add("functionName");
		this.functionName = functionName;
	}
	
	public String getFunctionCode() {
		return functionCode;
	}
	
	public void setFunctionCode(String functionCode) {
	    colset.add("functionCode");
		this.functionCode = functionCode;
	}
	
	
	public Integer getFunctionLevel() {
		return functionLevel;
	}
	
	public void setFunctionLevel(Integer functionLevel) {
	    colset.add("functionLevel");
		this.functionLevel = functionLevel;
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
	
	public Integer getType() {
		return type;
	}
	
	public void setType(Integer type) {
	    colset.add("type");
		this.type = type;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		colset.add("state");
		this.state = state;
	}

	public List<CheckBoxVo> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<CheckBoxVo> roleList) {
		 colset.add("roleList");
		this.roleList = roleList;
	}
	


}
