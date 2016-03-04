package com.sxit.mgt.customer.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @公司:深讯信科
 * @功能:客户轨迹 Model
 * @作者:xiongj    
 * @日期:2015-09-22 10:06:05  
 * @版本:1.0
 * @修改:
 */
 
public class SFollowRecordModel {
	
	/**
	 * 项目id
	 */
	private String projguid;

	/**
	 *项目名称
	 */
	 @NotNull(message = "项目名称不能为空")
	private String projname; 
	/**
	 *客户ID 
	 */
	 @NotNull(message = "客户ID不能为空")
	private Long cstguid; 
	/**
	 *跟进类型 
	 */
	 @NotNull(message = "跟进类型不能为空")
	private Integer followtype; 
	 /**
		 *跟进类内容
		 */
	 @NotNull(message = "跟进内容不能为空")
	private String followcontent;
	/**
	 *备注 
	 */
	 @NotBlank(message = "备注不能为空")
	private String remark; 
	/**
	 *创建时间 
	 */
	 @NotNull(message = "创建时间不能为空")
	private Date createtime; 
	
	/**	
	 * 置业顾问姓名
	 */
	 @NotNull(message = "置业顾问姓名不能为空")
	private String consultantname;
	
	/**
	 * 置业顾问手机
	 */
	private String consultantmobile;
	
	public SFollowRecordModel() { 
	  super();
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

	public Long getCstguid() {
		return cstguid;
	}

	public void setCstguid(Long cstguid) {
		this.cstguid = cstguid;
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
	
}
