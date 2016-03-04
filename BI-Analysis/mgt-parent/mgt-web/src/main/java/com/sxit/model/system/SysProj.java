package com.sxit.model.system;

import java.util.Date;
/**
 * @公司:深讯信科
 * @功能:角色 Model
 * @作者:张如兵    
 * @日期:2015-12-03 16:51:47  
 * @版本:1.0
 * @修改:
 */
 
public class SysProj {

  	/**
	 *源项目GUID 
	 */
	private String projguid; 
	/**
	 *项目名称 
	 */
	private String projname; 
	/**
	 *公司GUID 
	 */
	private String companyguid; 
	/**
	 *父级代码 
	 */
	private String parentguid; 
	/**
	 *是否最末级项目 
	 */
	private Integer ifend; 
	
	private Integer level; 
	
	public SysProj() { 
	  super();
	}
	
	/**
	 * 获取源项目GUID 
	 */
	public String getProjguid() {
		return projguid;
	}
	
	/**
	 * 设置源项目GUID 
	 */
	public void setProjguid(String projguid) {
		this.projguid = projguid;
	}
	
	/**
	 * 获取项目名称 
	 */
	public String getProjname() {
		return projname;
	}
	
	/**
	 * 设置项目名称 
	 */
	public void setProjname(String projname) {
		this.projname = projname;
	}
	
	/**
	 * 获取公司GUID 
	 */
	public String getCompanyguid() {
		return companyguid;
	}
	
	/**
	 * 设置公司GUID 
	 */
	public void setCompanyguid(String companyguid) {
		this.companyguid = companyguid;
	}
	
	/**
	 * 获取父级代码 
	 */
	public String getParentguid() {
		return parentguid;
	}
	
	/**
	 * 设置父级代码 
	 */
	public void setParentguid(String parentguid) {
		this.parentguid = parentguid;
	}
	
	/**
	 * 获取是否最末级项目 
	 */
	public Integer getIfend() {
		return ifend;
	}
	
	/**
	 * 设置是否最末级项目 
	 */
	public void setIfend(Integer ifend) {
		this.ifend = ifend;
	}
	
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((projguid == null) ? 0 : projguid.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		   SysProj other = (SysProj) obj;
		if (projguid == null) {
			if (other.projguid != null)
				return false;
		} else if (!projguid.equals(other.getProjguid()))
		    return false;
	    return true;
	}
	


}
