package com.sxit.mgt.system.dto;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @公司:深讯信科
 * @功能:业态 Model
 * @作者:张如兵    
 * @日期:2015-12-16 16:44:46  
 * @版本:1.0
 * @修改:
 */
 
public class IndustryModel {

  	public Set<String> colset = new HashSet<String>(0);
	/**
	 *业态ID 
	 */
	 @NotBlank(message = "业态ID不能为空")
	private String industryid; 
	/**
	 *业态名称 
	 */
	 @NotBlank(message = "业态名称不能为空")
	private String industryname; 
	/**
	 *创建时间 
	 */
	// @NotNull(message = "创建时间不能为空")
	private Date createtime; 
	 
	 private List<String> orgGuidList;
	
	public IndustryModel() { 
	  super();
	}
	
	public String getIndustryid() {
		return industryid;
	}
	
	public void setIndustryid(String industryid) {
	    colset.add("industryid");
		this.industryid = industryid;
	}
	
	public String getIndustryname() {
		return industryname;
	}
	
	public void setIndustryname(String industryname) {
	    colset.add("industryname");
		this.industryname = industryname;
	}
	
	public Date getCreatetime() {
		return createtime;
	}
	
	public void setCreatetime(Date createtime) {
	    colset.add("createtime");
		this.createtime = createtime;
	}

	public List<String> getOrgGuidList() {
		return orgGuidList;
	}

	public void setOrgGuidList(List<String> orgGuidList) {
		 colset.add("orgGuidList");
		this.orgGuidList = orgGuidList;
	}
	


}
