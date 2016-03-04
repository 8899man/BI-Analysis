package com.sxit.model.customer;

import java.util.Date;
/**
 * @公司:深讯信科
 * @功能:客户轨迹 Model
 * @作者:xiongj    
 * @日期:2015-09-22 10:06:05  
 * @版本:1.0
 * @修改:
 */
 
public class SFollowrecord {

  	/**
	 *主键uuid 
	 */
	private String followrecordid; 
	/**
	 *销售线索GUID 
	 */
	private String salesleadguid; 
	/**
	 *销售机会GUID 
	 */
	private String oppguid; 
	/**
	 *类型1=线索跟进2=机会跟进 
	 */
	private Integer type; 
	/**
	 *客户ID 
	 */
	private Long cstguid; 
	/**
	 *跟进时间 
	 */
	private Date followdate; 
	/**
	 *置业顾问GUID 
	 */
	private String userguid; 
	/**
	 *客户明源GUID 
	 */
	private String oricstguid; 
	/**
	 *公司GUID 
	 */
	private String companyguid; 
	/**
	 *序列号 
	 */
	private Integer sequence; 
	/**
	 *跟进类型 
	 */
	private Integer followtype; 
	/**
	 *子类型 
	 */
	private Integer subtype; 
	/**
	 *跟进内容 
	 */
	private String followcontent; 
	/**
	 *跟进来源 
	 */
	private String srouceapp; 
	/**
	 *项目GUID 
	 */
	private String projguid; 
	/**
	 *一级项目GUID 
	 */
	private String parentprojguid; 
	/**
	 *关联GUID 
	 */
	private String myguid; 
	/**
	 *成交状态时的交易ID 
	 */
	private String tradeguid; 
	/**
	 *下次跟进时间 
	 */
	private Date nextfollowtime; 
	/**
	 *下次跟进内容 
	 */
	private String nextfollowcontent; 
	/**
	 *实际完成时间 
	 */
	private Date realfinishtime; 
	/**
	 *认知途径 
	 */
	private String cognizepath; 
	/**
	 *媒体活动 
	 */
	private String activitysource; 
	/**
	 *成交几率1=A级2=B级3=C级4=D级 
	 */
	private Integer rate; 
	/**
	 *备注 
	 */
	private String remark; 
	/**
	 *创建时间 
	 */
	private Date createtime; 
	/**
	 *修改时间 
	 */
	private Date modifytime; 
	
	public SFollowrecord() { 
	  super();
	}
	
	/**
	 * 获取主键uuid 
	 */
	public String getFollowrecordid() {
		return followrecordid;
	}
	
	/**
	 * 设置主键uuid 
	 */
	public void setFollowrecordid(String followrecordid) {
		this.followrecordid = followrecordid;
	}
	
	/**
	 * 获取销售线索GUID 
	 */
	public String getSalesleadguid() {
		return salesleadguid;
	}
	
	/**
	 * 设置销售线索GUID 
	 */
	public void setSalesleadguid(String salesleadguid) {
		this.salesleadguid = salesleadguid;
	}
	
	/**
	 * 获取销售机会GUID 
	 */
	public String getOppguid() {
		return oppguid;
	}
	
	/**
	 * 设置销售机会GUID 
	 */
	public void setOppguid(String oppguid) {
		this.oppguid = oppguid;
	}
	
	/**
	 * 获取类型1=线索跟进2=机会跟进 
	 */
	public Integer getType() {
		return type;
	}
	
	/**
	 * 设置类型1=线索跟进2=机会跟进 
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	
	/**
	 * 获取客户ID 
	 */
	public Long getCstguid() {
		return cstguid;
	}
	
	/**
	 * 设置客户ID 
	 */
	public void setCstguid(Long cstguid) {
		this.cstguid = cstguid;
	}
	
	/**
	 * 获取跟进时间 
	 */
	public Date getFollowdate() {
		return followdate;
	}
	
	/**
	 * 设置跟进时间 
	 */
	public void setFollowdate(Date followdate) {
		this.followdate = followdate;
	}
	
	/**
	 * 获取置业顾问GUID 
	 */
	public String getUserguid() {
		return userguid;
	}
	
	/**
	 * 设置置业顾问GUID 
	 */
	public void setUserguid(String userguid) {
		this.userguid = userguid;
	}
	
	/**
	 * 获取客户明源GUID 
	 */
	public String getOricstguid() {
		return oricstguid;
	}
	
	/**
	 * 设置客户明源GUID 
	 */
	public void setOricstguid(String oricstguid) {
		this.oricstguid = oricstguid;
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
	 * 获取序列号 
	 */
	public Integer getSequence() {
		return sequence;
	}
	
	/**
	 * 设置序列号 
	 */
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	
	/**
	 * 获取跟进类型 
	 */
	public Integer getFollowtype() {
		return followtype;
	}
	
	/**
	 * 设置跟进类型 
	 */
	public void setFollowtype(Integer followtype) {
		this.followtype = followtype;
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
	 * 获取跟进内容 
	 */
	public String getFollowcontent() {
		return followcontent;
	}
	
	/**
	 * 设置跟进内容 
	 */
	public void setFollowcontent(String followcontent) {
		this.followcontent = followcontent;
	}
	
	/**
	 * 获取跟进来源 
	 */
	public String getSrouceapp() {
		return srouceapp;
	}
	
	/**
	 * 设置跟进来源 
	 */
	public void setSrouceapp(String srouceapp) {
		this.srouceapp = srouceapp;
	}
	
	/**
	 * 获取项目GUID 
	 */
	public String getProjguid() {
		return projguid;
	}
	
	/**
	 * 设置项目GUID 
	 */
	public void setProjguid(String projguid) {
		this.projguid = projguid;
	}
	
	/**
	 * 获取一级项目GUID 
	 */
	public String getParentprojguid() {
		return parentprojguid;
	}
	
	/**
	 * 设置一级项目GUID 
	 */
	public void setParentprojguid(String parentprojguid) {
		this.parentprojguid = parentprojguid;
	}
	
	/**
	 * 获取关联GUID 
	 */
	public String getMyguid() {
		return myguid;
	}
	
	/**
	 * 设置关联GUID 
	 */
	public void setMyguid(String myguid) {
		this.myguid = myguid;
	}
	
	/**
	 * 获取成交状态时的交易ID 
	 */
	public String getTradeguid() {
		return tradeguid;
	}
	
	/**
	 * 设置成交状态时的交易ID 
	 */
	public void setTradeguid(String tradeguid) {
		this.tradeguid = tradeguid;
	}
	
	/**
	 * 获取下次跟进时间 
	 */
	public Date getNextfollowtime() {
		return nextfollowtime;
	}
	
	/**
	 * 设置下次跟进时间 
	 */
	public void setNextfollowtime(Date nextfollowtime) {
		this.nextfollowtime = nextfollowtime;
	}
	
	/**
	 * 获取下次跟进内容 
	 */
	public String getNextfollowcontent() {
		return nextfollowcontent;
	}
	
	/**
	 * 设置下次跟进内容 
	 */
	public void setNextfollowcontent(String nextfollowcontent) {
		this.nextfollowcontent = nextfollowcontent;
	}
	
	/**
	 * 获取实际完成时间 
	 */
	public Date getRealfinishtime() {
		return realfinishtime;
	}
	
	/**
	 * 设置实际完成时间 
	 */
	public void setRealfinishtime(Date realfinishtime) {
		this.realfinishtime = realfinishtime;
	}
	
	/**
	 * 获取认知途径 
	 */
	public String getCognizepath() {
		return cognizepath;
	}
	
	/**
	 * 设置认知途径 
	 */
	public void setCognizepath(String cognizepath) {
		this.cognizepath = cognizepath;
	}
	
	/**
	 * 获取媒体活动 
	 */
	public String getActivitysource() {
		return activitysource;
	}
	
	/**
	 * 设置媒体活动 
	 */
	public void setActivitysource(String activitysource) {
		this.activitysource = activitysource;
	}
	
	/**
	 * 获取成交几率1=A级2=B级3=C级4=D级 
	 */
	public Integer getRate() {
		return rate;
	}
	
	/**
	 * 设置成交几率1=A级2=B级3=C级4=D级 
	 */
	public void setRate(Integer rate) {
		this.rate = rate;
	}
	
	/**
	 * 获取备注 
	 */
	public String getRemark() {
		return remark;
	}
	
	/**
	 * 设置备注 
	 */
	public void setRemark(String remark) {
		this.remark = remark;
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
	
	/**
	 * 获取修改时间 
	 */
	public Date getModifytime() {
		return modifytime;
	}
	
	/**
	 * 设置修改时间 
	 */
	public void setModifytime(Date modifytime) {
		this.modifytime = modifytime;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((followrecordid == null) ? 0 : followrecordid.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		   SFollowrecord other = (SFollowrecord) obj;
		if (followrecordid == null) {
			if (other.followrecordid != null)
				return false;
		} else if (!followrecordid.equals(other.getFollowrecordid()))
		    return false;
	    return true;
	}
	


}
