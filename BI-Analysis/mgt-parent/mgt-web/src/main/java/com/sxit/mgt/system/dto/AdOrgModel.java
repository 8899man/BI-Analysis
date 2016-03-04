package com.sxit.mgt.system.dto;

import java.util.HashSet;
import java.util.Set;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @公司:深讯信科
 * @功能:ad组织 Model
 * @作者:张如兵    
 * @日期:2015-12-11 14:43:07  
 * @版本:1.0
 * @修改:
 */
 
public class AdOrgModel {

  	public Set<String> colset = new HashSet<String>(0);
	/**
	 *ID标识 
	 */
	 @NotBlank(message = "ID标识不能为空")
	private String adGuid; 
	/**
	 *父级组织 
	 */
	
	private String parentGuid; 
	/**
	 *映射组织GUID 
	 */
	 @NotBlank(message = "映射组织GUID不能为空")
	private String orgGuid; 
	/**
	 *组织名称 
	 */
	 @NotBlank(message = "组织名称不能为空")
	private String orgName; 
	/**
	 *状态 
	 */
	
	private Integer state; 
	/**
	 *审批状态 
	 */
	 
	private Integer checkState; 
	/**
	 *创建时间 
	 */
	
	private Date createTime; 
	/**
	 *修改时间 
	 */
	
	private Date modifyTime; 
	
	public AdOrgModel() { 
	  super();
	}
	
	public String getAdGuid() {
		return adGuid;
	}
	
	public void setAdGuid(String adGuid) {
	    colset.add("adGuid");
		this.adGuid = adGuid;
	}
	
	public String getParentGuid() {
		return parentGuid;
	}
	
	public void setParentGuid(String parentGuid) {
	    colset.add("parentGuid");
		this.parentGuid = parentGuid;
	}
	
	public String getOrgGuid() {
		return orgGuid;
	}
	
	public void setOrgGuid(String orgGuid) {
	    colset.add("orgGuid");
		this.orgGuid = orgGuid;
	}
	
	public String getOrgName() {
		return orgName;
	}
	
	public void setOrgName(String orgName) {
	    colset.add("orgName");
		this.orgName = orgName;
	}
	
	public Integer getState() {
		return state;
	}
	
	public void setState(Integer state) {
	    colset.add("state");
		this.state = state;
	}
	
	public Integer getCheckState() {
		return checkState;
	}
	
	public void setCheckState(Integer checkState) {
	    colset.add("checkState");
		this.checkState = checkState;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(Date createTime) {
	    colset.add("createTime");
		this.createTime = createTime;
	}
	
	public Date getModifyTime() {
		return modifyTime;
	}
	
	public void setModifyTime(Date modifyTime) {
	    colset.add("modifyTime");
		this.modifyTime = modifyTime;
	}
	


}
