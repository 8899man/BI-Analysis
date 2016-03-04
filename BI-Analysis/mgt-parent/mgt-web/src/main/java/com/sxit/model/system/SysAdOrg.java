package com.sxit.model.system;

import java.util.Date;
/**
 * @公司:深讯信科
 * @功能:ad组织 Model
 * @作者:张如兵    
 * @日期:2015-12-11 14:43:07  
 * @版本:1.0
 * @修改:
 */
 
public class SysAdOrg {

  	/**
	 *ID标识 
	 */
	private String adGuid; 
	/**
	 *父级组织 
	 */
	private String parentGuid; 
	/**
	 *映射组织GUID 
	 */
	private String orgGuid; 
	/**
	 *组织名称 
	 */
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
	
	private String path;
	
	
	private String dsStr;
	
	
	private String objectclass;
	
	
	private String distinguishedname;
	
	
	private String objectcategory;
	
	
	
	public String getDsStr() {
		return dsStr;
	}

	public void setDsStr(String dsStr) {
		this.dsStr = dsStr;
	}

	public String getObjectclass() {
		return objectclass;
	}

	public void setObjectclass(String objectclass) {
		this.objectclass = objectclass;
	}

	public String getDistinguishedname() {
		return distinguishedname;
	}

	public void setDistinguishedname(String distinguishedname) {
		this.distinguishedname = distinguishedname;
	}

	public String getObjectcategory() {
		return objectcategory;
	}

	public void setObjectcategory(String objectcategory) {
		this.objectcategory = objectcategory;
	}

	public SysAdOrg() { 
	  super();
	}
	
	/**
	 * 获取ID标识 
	 */
	public String getAdGuid() {
		return adGuid;
	}
	
	/**
	 * 设置ID标识 
	 */
	public void setAdGuid(String adGuid) {
		this.adGuid = adGuid;
	}
	
	/**
	 * 获取父级组织 
	 */
	public String getParentGuid() {
		return parentGuid;
	}
	
	/**
	 * 设置父级组织 
	 */
	public void setParentGuid(String parentGuid) {
		this.parentGuid = parentGuid;
	}
	
	/**
	 * 获取映射组织GUID 
	 */
	public String getOrgGuid() {
		return orgGuid;
	}
	
	/**
	 * 设置映射组织GUID 
	 */
	public void setOrgGuid(String orgGuid) {
		this.orgGuid = orgGuid;
	}
	
	/**
	 * 获取组织名称 
	 */
	public String getOrgName() {
		return orgName;
	}
	
	/**
	 * 设置组织名称 
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	
	/**
	 * 获取状态 
	 */
	public Integer getState() {
		return state;
	}
	
	/**
	 * 设置状态 
	 */
	public void setState(Integer state) {
		this.state = state;
	}
	
	/**
	 * 获取审批状态 
	 */
	public Integer getCheckState() {
		return checkState;
	}
	
	/**
	 * 设置审批状态 
	 */
	public void setCheckState(Integer checkState) {
		this.checkState = checkState;
	}
	
	/**
	 * 获取创建时间 
	 */
	public Date getCreateTime() {
		return createTime;
	}
	
	/**
	 * 设置创建时间 
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	/**
	 * 获取修改时间 
	 */
	public Date getModifyTime() {
		return modifyTime;
	}
	
	/**
	 * 设置修改时间 
	 */
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((adGuid == null) ? 0 : adGuid.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		   SysAdOrg other = (SysAdOrg) obj;
		if (adGuid == null) {
			if (other.adGuid != null)
				return false;
		} else if (!adGuid.equals(other.getAdGuid()))
		    return false;
	    return true;
	}
	


}
