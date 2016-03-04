package com.sxit.model.system;

import java.util.Date;
import java.util.List;
/**
 * @公司:深讯信科
 * @功能:业态 Model
 * @作者:张如兵    
 * @日期:2015-12-16 16:44:46  
 * @版本:1.0
 * @修改:
 */
 
public class BIndustry {

  	/**
	 *业态ID 
	 */
	private String industryid; 
	/**
	 *业态名称 
	 */
	private String industryname; 
	/**
	 *创建时间 
	 */
	private Date createtime; 
	
	
	private List<String> orgGuidList;
	
	public BIndustry() { 
	  super();
	}
	
	/**
	 * 获取业态ID 
	 */
	public String getIndustryid() {
		return industryid;
	}
	
	/**
	 * 设置业态ID 
	 */
	public void setIndustryid(String industryid) {
		this.industryid = industryid;
	}
	
	/**
	 * 获取业态名称 
	 */
	public String getIndustryname() {
		return industryname;
	}
	
	/**
	 * 设置业态名称 
	 */
	public void setIndustryname(String industryname) {
		this.industryname = industryname;
	}
	
	/**
	 * 获取创建时间 
	 */
	public Date getCreatetime() {
		return createtime;
	}
	
	/**
	 * 设置创建时间 
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	public List<String> getOrgGuidList() {
		return orgGuidList;
	}

	public void setOrgGuidList(List<String> orgGuidList) {
		this.orgGuidList = orgGuidList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((industryid == null) ? 0 : industryid.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		   BIndustry other = (BIndustry) obj;
		if (industryid == null) {
			if (other.industryid != null)
				return false;
		} else if (!industryid.equals(other.getIndustryid()))
		    return false;
	    return true;
	}
	


}
