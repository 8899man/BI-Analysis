package com.sxit.model.system;

import java.util.Date;
/**
 * @公司:深讯信科
 * @功能:组织 Model
 * @作者:张如兵    
 * @日期:2015-11-27 15:09:48  
 * @版本:1.0
 * @修改:
 */
 
public class BOrg {

  	/**
	 *ID标识 
	 */
	private String orgguid; 
	/**
	 *父级组织 
	 */
	private String parentguid; 
	/**
	 *组织名称 
	 */
	private String orgname; 
	/**
	 *组织类型 | 1=代理公司2=中介公司3=销售团队4=区域公司/事业部 
	 */
	private Integer orgtype; 
	/**
	 *子类型 
	 */
	private Integer subtype; 
	/**
	 *简介 
	 */
	private String remark; 
	
	private String path; 
	
	public BOrg() { 
	  super();
	}
	
	/**
	 * 获取ID标识 
	 */
	public String getOrgguid() {
		return orgguid;
	}
	
	/**
	 * 设置ID标识 
	 */
	public void setOrgguid(String orgguid) {
		this.orgguid = orgguid;
	}
	
	/**
	 * 获取父级组织 
	 */
	public String getParentguid() {
		return parentguid;
	}
	
	/**
	 * 设置父级组织 
	 */
	public void setParentguid(String parentguid) {
		this.parentguid = parentguid;
	}
	
	/**
	 * 获取组织名称 
	 */
	public String getOrgname() {
		return orgname;
	}
	
	/**
	 * 设置组织名称 
	 */
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	
	/**
	 * 获取组织类型1=代理公司2=中介公司3=销售团队4=区域公司/事业部 
	 */
	public Integer getOrgtype() {
		return orgtype;
	}
	
	/**
	 * 设置组织类型1=代理公司2=中介公司3=销售团队4=区域公司/事业部 
	 */
	public void setOrgtype(Integer orgtype) {
		this.orgtype = orgtype;
	}
	
	/**
	 * 获取子类型 
	 */
	public Integer getSubtype() {
		return subtype;
	}
	
	/**
	 * 设置子类型 
	 */
	public void setSubtype(Integer subtype) {
		this.subtype = subtype;
	}
	
	/**
	 * 获取简介 
	 */
	public String getRemark() {
		return remark;
	}
	
	/**
	 * 设置简介 
	 */
	public void setRemark(String remark) {
		this.remark = remark;
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
		result = prime * result + ((orgguid == null) ? 0 : orgguid.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		   BOrg other = (BOrg) obj;
		if (orgguid == null) {
			if (other.orgguid != null)
				return false;
		} else if (!orgguid.equals(other.getOrgguid()))
		    return false;
	    return true;
	}
	


}
