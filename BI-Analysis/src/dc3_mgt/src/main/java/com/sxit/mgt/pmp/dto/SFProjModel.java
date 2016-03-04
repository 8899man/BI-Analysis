package com.sxit.mgt.pmp.dto;

import java.util.Date;

public class SFProjModel {
	
	private Long cstGUID;
	private String projguid;
	private String projname; 
	private Integer followtype; 
	private String followcontent;
	private String remark; 
	private Date createtime; 
	private String consultantname;
	private String consultantmobile;
	private String cstName;
	
	public SFProjModel(){
		super();
	}

	public Long getCstGUID() {
		return cstGUID;
	}

	public void setCstGUID(Long cstGUID) {
		this.cstGUID = cstGUID;
	}

	public String getProjguid() {
		return projguid;
	}

	public void setProjguid(String projguid) {
		this.projguid = projguid;
	}

	public String getProjname() {
		return projname;
	}

	public void setProjname(String projname) {
		this.projname = projname;
	}

	public Integer getFollowtype() {
		return followtype;
	}

	public void setFollowtype(Integer followtype) {
		this.followtype = followtype;
	}

	public String getFollowcontent() {
		return followcontent;
	}

	public void setFollowcontent(String followcontent) {
		this.followcontent = followcontent;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getConsultantname() {
		return consultantname;
	}

	public void setConsultantname(String consultantname) {
		this.consultantname = consultantname;
	}

	public String getConsultantmobile() {
		return consultantmobile;
	}

	public void setConsultantmobile(String consultantmobile) {
		this.consultantmobile = consultantmobile;
	}

	public String getCstName() {
		return cstName;
	}

	public void setCstName(String cstName) {
		this.cstName = cstName;
	}
	
}
