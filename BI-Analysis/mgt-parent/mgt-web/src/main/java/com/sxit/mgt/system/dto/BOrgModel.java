package com.sxit.mgt.system.dto;

import java.util.HashSet;
import java.util.Set;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @公司:深讯信科
 * @功能:组织 Model
 * @作者:张如兵    
 * @日期:2015-11-27 16:57:02  
 * @版本:1.0
 * @修改:
 */
 
public class BOrgModel {

  	public Set<String> colset = new HashSet<String>(0);
	/**
	 *ID标识 
	 */
	// @NotBlank(message = "ID标识不能为空")
	private String orgguid; 
	/**
	 *父级组织 
	 */
	
	private String parentguid; 
	/**
	 *组织名称 
	 */
	 @NotBlank(message = "组织名称不能为空")
	private String orgname; 
	/**
	 *组织类型1=代理公司2=中介公司3=销售团队4=区域公司/事业部 
	 */
	 @NotNull(message = "组织类型1=代理公司2=中介公司3=销售团队4=区域公司/事业部不能为空")
	private Integer orgtype; 
	/**
	 *子类型 
	 */
	 @NotNull(message = "子类型不能为空")
	private Integer subtype; 
	/**
	 *简介 
	 */

	private String remark; 
	
	public BOrgModel() { 
	  super();
	}
	
	public String getOrgguid() {
		return orgguid;
	}
	
	public void setOrgguid(String orgguid) {
	    colset.add("orgguid");
		this.orgguid = orgguid;
	}
	
	public String getParentguid() {
		return parentguid;
	}
	
	public void setParentguid(String parentguid) {
	    colset.add("parentguid");
		this.parentguid = parentguid;
	}
	
	public String getOrgname() {
		return orgname;
	}
	
	public void setOrgname(String orgname) {
	    colset.add("orgname");
		this.orgname = orgname;
	}
	
	public Integer getOrgtype() {
		return orgtype;
	}
	
	public void setOrgtype(Integer orgtype) {
	    colset.add("orgtype");
		this.orgtype = orgtype;
	}
	
	public Integer getSubtype() {
		return subtype;
	}
	
	public void setSubtype(Integer subtype) {
	    colset.add("subtype");
		this.subtype = subtype;
	}
	
	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
	    colset.add("remark");
		this.remark = remark;
	}
	


}
