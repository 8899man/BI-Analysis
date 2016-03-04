package com.sxit.model.reports;

import java.util.Date;
/**
 * @公司:深讯信科
 * @功能:标签 Model
 * @作者:dengbiao    
 * @日期:2015-11-02 18:07:18  
 * @版本:1.0
 * @修改:
 */
 
public class ReportCstDealMidOwn {

  	/**
	 *子女个数 
	 */
	private String childrenNum; 
	/**
	 *年龄段 
	 */
	private String ageSegment; 
	/**
	 *项目户型(户型) 
	 */
	private String projHouseType; 
	/**
	 *居住业态 
	 */
	private String liveFormat; 
	/**
	 *面积 
	 */
	private String roomAcreage; 
	/**
	 *客户数量 
	 */
	private Integer cstNum; 
	/**
	 *业主数量 
	 */
	private Integer ownerNum; 
	/**
	 *销售面积总数 
	 */
	private String saleAcreage; 
	/**
	 *销售总金额 
	 */
	private String saleAmount; 
	/**
	 * 
	 */
	private String workArea; 
	/**
	 * 
	 */
	private String liveArea; 
	/**
	 * 
	 */
	private String dealDate; 
	/**
	 * 
	 */
	private String bigArea; 
	/**
	 * 
	 */
	private String prjectName; 
	/**
	 * 
	 */
	private String cityName; 
	/**
	 * 
	 */
	private String roomguid; 
	/**
	 * 
	 */
	private String bldguid; 
	/**
	 * 
	 */
	private Long cstguid; 
	/**
	 * 
	 */
	private String birthDay; 
	/**
	 *项目编号 
	 */
	private String projguid; 
	/**
	 *公司编号 
	 */
	private String companyguid; 
	/**
	 * 
	 */
	private String liveFormatOrig; 
	/**
	 * 
	 */
	private String projHouseTypeOrig; 
	/**
	 * 
	 */
	private String workAreaOrig; 
	/**
	 * 
	 */
	private String liveAreaOrig; 
	/**
	 * 
	 */
	private String childrenNumOrig; 
	/**
	 *身份证号码 
	 */
	private String cardid; 
	/**
	 *10.001=房产 
	 */
	private String subtype; 
	/**
	 *客户类型1=个人 2=公司 
	 */
	private Integer csttype; 
	/**
	 *1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它 
	 */
	private Integer cardtype; 
	/**
	 * 
	 */
	private String roomAcreSegment; 
	/**
	 * 
	 */
	private Integer cstnum; 
	/**
	 * 
	 */
	private Double propertyrate; 
	/**
	 * 
	 */
	private String tradeguid; 
	/**
	 * 
	 */
	private String cstoriginplace; 
	/**
	 * 
	 */
	private String cstindustry; 
	/**
	 * 
	 */
	private String cstcuryl; 
	/**
	 * 
	 */
	private Date jfdate; 
	/**
	 * 
	 */
	private Long id; 
	
	public ReportCstDealMidOwn() { 
	  super();
	}
	
	/**
	 * 获取子女个数 
	 */
	public String getChildrenNum() {
		return childrenNum;
	}
	
	/**
	 * 设置子女个数 
	 */
	public void setChildrenNum(String childrenNum) {
		this.childrenNum = childrenNum;
	}
	
	/**
	 * 获取年龄段 
	 */
	public String getAgeSegment() {
		return ageSegment;
	}
	
	/**
	 * 设置年龄段 
	 */
	public void setAgeSegment(String ageSegment) {
		this.ageSegment = ageSegment;
	}
	
	/**
	 * 获取项目户型(户型) 
	 */
	public String getProjHouseType() {
		return projHouseType;
	}
	
	/**
	 * 设置项目户型(户型) 
	 */
	public void setProjHouseType(String projHouseType) {
		this.projHouseType = projHouseType;
	}
	
	/**
	 * 获取居住业态 
	 */
	public String getLiveFormat() {
		return liveFormat;
	}
	
	/**
	 * 设置居住业态 
	 */
	public void setLiveFormat(String liveFormat) {
		this.liveFormat = liveFormat;
	}
	
	/**
	 * 获取面积 
	 */
	public String getRoomAcreage() {
		return roomAcreage;
	}
	
	/**
	 * 设置面积 
	 */
	public void setRoomAcreage(String roomAcreage) {
		this.roomAcreage = roomAcreage;
	}
	
	/**
	 * 获取客户数量 
	 */
	public Integer getCstNum() {
		return cstNum;
	}
	
	/**
	 * 设置客户数量 
	 */
	public void setCstNum(Integer cstNum) {
		this.cstNum = cstNum;
	}
	
	/**
	 * 获取业主数量 
	 */
	public Integer getOwnerNum() {
		return ownerNum;
	}
	
	/**
	 * 设置业主数量 
	 */
	public void setOwnerNum(Integer ownerNum) {
		this.ownerNum = ownerNum;
	}
	
	/**
	 * 获取销售面积总数 
	 */
	public String getSaleAcreage() {
		return saleAcreage;
	}
	
	/**
	 * 设置销售面积总数 
	 */
	public void setSaleAcreage(String saleAcreage) {
		this.saleAcreage = saleAcreage;
	}
	
	/**
	 * 获取销售总金额 
	 */
	public String getSaleAmount() {
		return saleAmount;
	}
	
	/**
	 * 设置销售总金额 
	 */
	public void setSaleAmount(String saleAmount) {
		this.saleAmount = saleAmount;
	}
	
	/**
	 * 获取 
	 */
	public String getWorkArea() {
		return workArea;
	}
	
	/**
	 * 设置 
	 */
	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}
	
	/**
	 * 获取 
	 */
	public String getLiveArea() {
		return liveArea;
	}
	
	/**
	 * 设置 
	 */
	public void setLiveArea(String liveArea) {
		this.liveArea = liveArea;
	}
	
	/**
	 * 获取 
	 */
	public String getDealDate() {
		return dealDate;
	}
	
	/**
	 * 设置 
	 */
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	
	/**
	 * 获取 
	 */
	public String getBigArea() {
		return bigArea;
	}
	
	/**
	 * 设置 
	 */
	public void setBigArea(String bigArea) {
		this.bigArea = bigArea;
	}
	
	/**
	 * 获取 
	 */
	public String getPrjectName() {
		return prjectName;
	}
	
	/**
	 * 设置 
	 */
	public void setPrjectName(String prjectName) {
		this.prjectName = prjectName;
	}
	
	/**
	 * 获取 
	 */
	public String getCityName() {
		return cityName;
	}
	
	/**
	 * 设置 
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
	/**
	 * 获取 
	 */
	public String getRoomguid() {
		return roomguid;
	}
	
	/**
	 * 设置 
	 */
	public void setRoomguid(String roomguid) {
		this.roomguid = roomguid;
	}
	
	/**
	 * 获取 
	 */
	public String getBldguid() {
		return bldguid;
	}
	
	/**
	 * 设置 
	 */
	public void setBldguid(String bldguid) {
		this.bldguid = bldguid;
	}
	
	/**
	 * 获取 
	 */
	public Long getCstguid() {
		return cstguid;
	}
	
	/**
	 * 设置 
	 */
	public void setCstguid(Long cstguid) {
		this.cstguid = cstguid;
	}
	
	/**
	 * 获取 
	 */
	public String getBirthDay() {
		return birthDay;
	}
	
	/**
	 * 设置 
	 */
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	
	/**
	 * 获取项目编号 
	 */
	public String getProjguid() {
		return projguid;
	}
	
	/**
	 * 设置项目编号 
	 */
	public void setProjguid(String projguid) {
		this.projguid = projguid;
	}
	
	/**
	 * 获取公司编号 
	 */
	public String getCompanyguid() {
		return companyguid;
	}
	
	/**
	 * 设置公司编号 
	 */
	public void setCompanyguid(String companyguid) {
		this.companyguid = companyguid;
	}
	
	/**
	 * 获取 
	 */
	public String getLiveFormatOrig() {
		return liveFormatOrig;
	}
	
	/**
	 * 设置 
	 */
	public void setLiveFormatOrig(String liveFormatOrig) {
		this.liveFormatOrig = liveFormatOrig;
	}
	
	/**
	 * 获取 
	 */
	public String getProjHouseTypeOrig() {
		return projHouseTypeOrig;
	}
	
	/**
	 * 设置 
	 */
	public void setProjHouseTypeOrig(String projHouseTypeOrig) {
		this.projHouseTypeOrig = projHouseTypeOrig;
	}
	
	/**
	 * 获取 
	 */
	public String getWorkAreaOrig() {
		return workAreaOrig;
	}
	
	/**
	 * 设置 
	 */
	public void setWorkAreaOrig(String workAreaOrig) {
		this.workAreaOrig = workAreaOrig;
	}
	
	/**
	 * 获取 
	 */
	public String getLiveAreaOrig() {
		return liveAreaOrig;
	}
	
	/**
	 * 设置 
	 */
	public void setLiveAreaOrig(String liveAreaOrig) {
		this.liveAreaOrig = liveAreaOrig;
	}
	
	/**
	 * 获取 
	 */
	public String getChildrenNumOrig() {
		return childrenNumOrig;
	}
	
	/**
	 * 设置 
	 */
	public void setChildrenNumOrig(String childrenNumOrig) {
		this.childrenNumOrig = childrenNumOrig;
	}
	
	/**
	 * 获取身份证号码 
	 */
	public String getCardid() {
		return cardid;
	}
	
	/**
	 * 设置身份证号码 
	 */
	public void setCardid(String cardid) {
		this.cardid = cardid;
	}
	
	/**
	 * 获取10.001=房产 
	 */
	public String getSubtype() {
		return subtype;
	}
	
	/**
	 * 设置10.001=房产 
	 */
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	
	/**
	 * 获取客户类型1=个人 2=公司 
	 */
	public Integer getCsttype() {
		return csttype;
	}
	
	/**
	 * 设置客户类型1=个人 2=公司 
	 */
	public void setCsttype(Integer csttype) {
		this.csttype = csttype;
	}
	
	/**
	 * 获取1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它 
	 */
	public Integer getCardtype() {
		return cardtype;
	}
	
	/**
	 * 设置1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它 
	 */
	public void setCardtype(Integer cardtype) {
		this.cardtype = cardtype;
	}
	
	/**
	 * 获取 
	 */
	public String getRoomAcreSegment() {
		return roomAcreSegment;
	}
	
	/**
	 * 设置 
	 */
	public void setRoomAcreSegment(String roomAcreSegment) {
		this.roomAcreSegment = roomAcreSegment;
	}
	
	/**
	 * 获取 
	 */
	public Integer getCstnum() {
		return cstnum;
	}
	
	/**
	 * 设置 
	 */
	public void setCstnum(Integer cstnum) {
		this.cstnum = cstnum;
	}
	
	/**
	 * 获取 
	 */
	public Double getPropertyrate() {
		return propertyrate;
	}
	
	/**
	 * 设置 
	 */
	public void setPropertyrate(Double propertyrate) {
		this.propertyrate = propertyrate;
	}
	
	/**
	 * 获取 
	 */
	public String getTradeguid() {
		return tradeguid;
	}
	
	/**
	 * 设置 
	 */
	public void setTradeguid(String tradeguid) {
		this.tradeguid = tradeguid;
	}
	
	/**
	 * 获取 
	 */
	public String getCstoriginplace() {
		return cstoriginplace;
	}
	
	/**
	 * 设置 
	 */
	public void setCstoriginplace(String cstoriginplace) {
		this.cstoriginplace = cstoriginplace;
	}
	
	/**
	 * 获取 
	 */
	public String getCstindustry() {
		return cstindustry;
	}
	
	/**
	 * 设置 
	 */
	public void setCstindustry(String cstindustry) {
		this.cstindustry = cstindustry;
	}
	
	/**
	 * 获取 
	 */
	public String getCstcuryl() {
		return cstcuryl;
	}
	
	/**
	 * 设置 
	 */
	public void setCstcuryl(String cstcuryl) {
		this.cstcuryl = cstcuryl;
	}
	
	/**
	 * 获取 
	 */
	public Date getJfdate() {
		return jfdate;
	}
	
	/**
	 * 设置 
	 */
	public void setJfdate(Date jfdate) {
		this.jfdate = jfdate;
	}
	
	/**
	 * 获取 
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * 设置 
	 */
	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		   ReportCstDealMidOwn other = (ReportCstDealMidOwn) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.getId()))
		    return false;
	    return true;
	}
	


}
