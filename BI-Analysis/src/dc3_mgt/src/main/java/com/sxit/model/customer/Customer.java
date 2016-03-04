package com.sxit.model.customer;

import java.util.Date;
/**
 * @公司:深讯信科
 * @功能:客户画像 Model
 * @作者:xiongj    
 * @日期:2015-09-22 10:35:59  
 * @版本:1.0
 * @修改:
 */
 
public class Customer {

  	/**
	 *客户GUID 
	 */
	private String cstguid; 
	/**
	 *客户姓名 
	 */
	private String cstname; 
	/**
	 *性别 
	 */
	private Integer gender; 
	/**
	 *生日 
	 */
	private Date birthdate; 
	/**
	 * 生日字符串
	 */
	private String birthStr;
	/**
	 * 年龄
	 */
	private String ageStr;
	/**
	 *客户类型1=个人2=公司 
	 */
	private Integer csttype; 
	/**
	 *证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它 
	 */
	private Integer cardtype; 
	/**
	 *证件号码 
	 */
	private String cardid; 
	/**
	 *手机 
	 */
	private String mobiletel; 
	/**
	 *办公电话 
	 */
	private String officetel; 
	/**
	 *家庭电话 
	 */
	private String hometel; 
	/**
	 *来源应用 
	 */
	private String sourceapp; 
	/**
	 *来源业态；参见特征定义 
	 */
	private String sourcebiz; 
	/**
	 *媒体活动；参见特征定义 
	 */
	private String activitysource; 
	/**
	 *是否合并0=无合并， 1=有合并 
	 */
	private Integer ismerge; 
	/**
	 *是否主数据1是，0否，默认0 
	 */
	private Integer ismaster; 
	/**
	 *联系电话列表，存当前的 
	 */
	private String contact; 
	/**
	 *业态ID列表，存现有的 
	 */
	private String myguidlist; 
	/**
	 *家庭地址 
	 */
	private String address; 
	/**
	 *创建时间 
	 */
	private Date createtime; 
	/**
	 *修改时间 
	 */
	private Date modifytime;
	/**
	 *会员卡号
	 */
	private String memCode;
	/**
	 *车牌号 
	 */
	private String carNo;
	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public Integer getCustomerType() {
		return customerType;
	}

	public void setCustomerType(Integer customerType) {
		this.customerType = customerType;
	}

	/**
	 * 客户类别
	 */
	private Integer customerType;	//1、表示意向客户，2、已购用户、3、既是意向客户又是已购
	
	public Customer() { 
	  super();
	}
	
	/**
	 * 获取客户GUID 
	 */
	public String getCstguid() {
		return cstguid;
	}
	
	/**
	 * 设置客户GUID 
	 */
	public void setCstguid(String cstguid) {
		this.cstguid = cstguid;
	}
	
	/**
	 * 获取客户姓名 
	 */
	public String getCstname() {
		return cstname;
	}
	
	/**
	 * 设置客户姓名 
	 */
	public void setCstname(String cstname) {
		this.cstname = cstname;
	}
	
	/**
	 * 获取性别 
	 */
	public Integer getGender() {
		return gender;
	}
	
	/**
	 * 设置性别 
	 */
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	
	/**
	 * 获取生日 
	 */
	public Date getBirthdate() {
		return birthdate;
	}
	
	/**
	 * 设置生日 
	 */
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	
	/**
	 * 获取客户类型1=个人2=公司 
	 */
	public Integer getCsttype() {
		return csttype;
	}
	
	/**
	 * 设置客户类型1=个人2=公司 
	 */
	public void setCsttype(Integer csttype) {
		this.csttype = csttype;
	}
	
	/**
	 * 获取证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它 
	 */
	public Integer getCardtype() {
		return cardtype;
	}
	
	/**
	 * 设置证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它 
	 */
	public void setCardtype(Integer cardtype) {
		this.cardtype = cardtype;
	}
	
	/**
	 * 获取证件号码 
	 */
	public String getCardid() {
		return cardid;
	}
	
	/**
	 * 设置证件号码 
	 */
	public void setCardid(String cardid) {
		this.cardid = cardid;
	}
	
	/**
	 * 获取手机 
	 */
	public String getMobiletel() {
		return mobiletel;
	}
	
	/**
	 * 设置手机 
	 */
	public void setMobiletel(String mobiletel) {
		this.mobiletel = mobiletel;
	}
	
	/**
	 * 获取办公电话 
	 */
	public String getOfficetel() {
		return officetel;
	}
	
	/**
	 * 设置办公电话 
	 */
	public void setOfficetel(String officetel) {
		this.officetel = officetel;
	}
	
	/**
	 * 获取家庭电话 
	 */
	public String getHometel() {
		return hometel;
	}
	
	/**
	 * 设置家庭电话 
	 */
	public void setHometel(String hometel) {
		this.hometel = hometel;
	}
	
	/**
	 * 获取来源应用 
	 */
	public String getSourceapp() {
		return sourceapp;
	}
	
	/**
	 * 设置来源应用 
	 */
	public void setSourceapp(String sourceapp) {
		this.sourceapp = sourceapp;
	}
	
	/**
	 * 获取来源业态；参见特征定义 
	 */
	public String getSourcebiz() {
		return sourcebiz;
	}
	
	/**
	 * 设置来源业态；参见特征定义 
	 */
	public void setSourcebiz(String sourcebiz) {
		this.sourcebiz = sourcebiz;
	}
	
	/**
	 * 获取媒体活动；参见特征定义 
	 */
	public String getActivitysource() {
		return activitysource;
	}
	
	/**
	 * 设置媒体活动；参见特征定义 
	 */
	public void setActivitysource(String activitysource) {
		this.activitysource = activitysource;
	}
	
	/**
	 * 获取是否合并0=无合并， 1=有合并 
	 */
	public Integer getIsmerge() {
		return ismerge;
	}
	
	/**
	 * 设置是否合并0=无合并， 1=有合并 
	 */
	public void setIsmerge(Integer ismerge) {
		this.ismerge = ismerge;
	}
	
	/**
	 * 获取是否主数据1是，0否，默认0 
	 */
	public Integer getIsmaster() {
		return ismaster;
	}
	
	/**
	 * 设置是否主数据1是，0否，默认0 
	 */
	public void setIsmaster(Integer ismaster) {
		this.ismaster = ismaster;
	}
	
	/**
	 * 获取联系电话列表，存当前的 
	 */
	public String getContact() {
		return contact;
	}
	
	/**
	 * 设置联系电话列表，存当前的 
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	/**
	 * 获取业态ID列表，存现有的 
	 */
	public String getMyguidlist() {
		return myguidlist;
	}
	
	/**
	 * 设置业态ID列表，存现有的 
	 */
	public void setMyguidlist(String myguidlist) {
		this.myguidlist = myguidlist;
	}
	
	/**
	 * 获取家庭地址 
	 */
	public String getAddress() {
		return address;
	}
	
	/**
	 * 设置家庭地址 
	 */
	public void setAddress(String address) {
		this.address = address;
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
	
	public String getMemCode() {
		return memCode;
	}

	public void setMemCode(String memCode) {
		this.memCode = memCode;
	}

	public String getBirthStr() {
		return birthStr;
	}

	public void setBirthStr(String birthStr) {
		this.birthStr = birthStr;
	}

	public String getAgeStr() {
		return ageStr;
	}

	public void setAgeStr(String ageStr) {
		this.ageStr = ageStr;
	}
	
}
