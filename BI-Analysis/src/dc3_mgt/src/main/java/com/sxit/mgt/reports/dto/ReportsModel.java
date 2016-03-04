package com.sxit.mgt.reports.dto;

import java.util.HashSet;
import java.util.Set;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @公司:深讯信科
 * @功能:标签 Model
 * @作者:dengbiao    
 * @日期:2015-11-02 18:07:18  
 * @版本:1.0
 * @修改:
 */
 
public class ReportsModel {

  	public Set<String> colset = new HashSet<String>(0);
	/**
	 *子女个数 
	 */
	 @NotBlank(message = "子女个数不能为空")
	private String childrenNum; 
	/**
	 *年龄段 
	 */
	 @NotBlank(message = "年龄段不能为空")
	private String ageSegment; 
	/**
	 *项目户型(户型) 
	 */
	 @NotBlank(message = "项目户型(户型)不能为空")
	private String projHouseType; 
	/**
	 *居住业态 
	 */
	 @NotBlank(message = "居住业态不能为空")
	private String liveFormat; 
	/**
	 *面积 
	 */
	 @NotBlank(message = "面积不能为空")
	private String roomAcreage; 
	/**
	 *客户数量 
	 */
	 @NotNull(message = "客户数量不能为空")
	private Integer cstNum; 
	/**
	 *业主数量 
	 */
	 @NotNull(message = "业主数量不能为空")
	private Integer ownerNum; 
	/**
	 *销售面积总数 
	 */
	 @NotBlank(message = "销售面积总数不能为空")
	private String saleAcreage; 
	/**
	 *销售总金额 
	 */
	 @NotBlank(message = "销售总金额不能为空")
	private String saleAmount; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String workArea; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String liveArea; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String dealDate; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String bigArea; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String prjectName; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String cityName; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String roomguid; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String bldguid; 
	/**
	 * 
	 */
	 @NotNull(message = "不能为空")
	private Long cstguid; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String birthDay; 
	/**
	 *项目编号 
	 */
	 @NotBlank(message = "项目编号不能为空")
	private String projguid; 
	/**
	 *公司编号 
	 */
	 @NotBlank(message = "公司编号不能为空")
	private String companyguid; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String liveFormatOrig; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String projHouseTypeOrig; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String workAreaOrig; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String liveAreaOrig; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String childrenNumOrig; 
	/**
	 *身份证号码 
	 */
	 @NotBlank(message = "身份证号码不能为空")
	private String cardid; 
	/**
	 *10.001=房产 
	 */
	 @NotBlank(message = "10.001=房产不能为空")
	private String subtype; 
	/**
	 *客户类型1=个人 2=公司 
	 */
	 @NotNull(message = "客户类型1=个人 2=公司不能为空")
	private Integer csttype; 
	/**
	 *1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它 
	 */
	 @NotNull(message = "1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它不能为空")
	private Integer cardtype; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String roomAcreSegment; 
	/**
	 * 
	 */
	 @NotNull(message = "不能为空")
	private Integer cstnum; 
	/**
	 * 
	 */
	 @NotNull(message = "不能为空")
	private Double propertyrate; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String tradeguid; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String cstoriginplace; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String cstindustry; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String cstcuryl; 
	/**
	 * 
	 */
	 @NotNull(message = "不能为空")
	private Date jfdate; 
	/**
	 * 
	 */
	 @NotNull(message = "不能为空")
	private Long id; 
	
	public ReportsModel() { 
	  super();
	}
	
	public String getChildrenNum() {
		return childrenNum;
	}
	
	public void setChildrenNum(String childrenNum) {
	    colset.add("childrenNum");
		this.childrenNum = childrenNum;
	}
	
	public String getAgeSegment() {
		return ageSegment;
	}
	
	public void setAgeSegment(String ageSegment) {
	    colset.add("ageSegment");
		this.ageSegment = ageSegment;
	}
	
	public String getProjHouseType() {
		return projHouseType;
	}
	
	public void setProjHouseType(String projHouseType) {
	    colset.add("projHouseType");
		this.projHouseType = projHouseType;
	}
	
	public String getLiveFormat() {
		return liveFormat;
	}
	
	public void setLiveFormat(String liveFormat) {
	    colset.add("liveFormat");
		this.liveFormat = liveFormat;
	}
	
	public String getRoomAcreage() {
		return roomAcreage;
	}
	
	public void setRoomAcreage(String roomAcreage) {
	    colset.add("roomAcreage");
		this.roomAcreage = roomAcreage;
	}
	
	public Integer getCstNum() {
		return cstNum;
	}
	
	public void setCstNum(Integer cstNum) {
	    colset.add("cstNum");
		this.cstNum = cstNum;
	}
	
	public Integer getOwnerNum() {
		return ownerNum;
	}
	
	public void setOwnerNum(Integer ownerNum) {
	    colset.add("ownerNum");
		this.ownerNum = ownerNum;
	}
	
	public String getSaleAcreage() {
		return saleAcreage;
	}
	
	public void setSaleAcreage(String saleAcreage) {
	    colset.add("saleAcreage");
		this.saleAcreage = saleAcreage;
	}
	
	public String getSaleAmount() {
		return saleAmount;
	}
	
	public void setSaleAmount(String saleAmount) {
	    colset.add("saleAmount");
		this.saleAmount = saleAmount;
	}
	
	public String getWorkArea() {
		return workArea;
	}
	
	public void setWorkArea(String workArea) {
	    colset.add("workArea");
		this.workArea = workArea;
	}
	
	public String getLiveArea() {
		return liveArea;
	}
	
	public void setLiveArea(String liveArea) {
	    colset.add("liveArea");
		this.liveArea = liveArea;
	}
	
	public String getDealDate() {
		return dealDate;
	}
	
	public void setDealDate(String dealDate) {
	    colset.add("dealDate");
		this.dealDate = dealDate;
	}
	
	public String getBigArea() {
		return bigArea;
	}
	
	public void setBigArea(String bigArea) {
	    colset.add("bigArea");
		this.bigArea = bigArea;
	}
	
	public String getPrjectName() {
		return prjectName;
	}
	
	public void setPrjectName(String prjectName) {
	    colset.add("prjectName");
		this.prjectName = prjectName;
	}
	
	public String getCityName() {
		return cityName;
	}
	
	public void setCityName(String cityName) {
	    colset.add("cityName");
		this.cityName = cityName;
	}
	
	public String getRoomguid() {
		return roomguid;
	}
	
	public void setRoomguid(String roomguid) {
	    colset.add("roomguid");
		this.roomguid = roomguid;
	}
	
	public String getBldguid() {
		return bldguid;
	}
	
	public void setBldguid(String bldguid) {
	    colset.add("bldguid");
		this.bldguid = bldguid;
	}
	
	public Long getCstguid() {
		return cstguid;
	}
	
	public void setCstguid(Long cstguid) {
	    colset.add("cstguid");
		this.cstguid = cstguid;
	}
	
	public String getBirthDay() {
		return birthDay;
	}
	
	public void setBirthDay(String birthDay) {
	    colset.add("birthDay");
		this.birthDay = birthDay;
	}
	
	public String getProjguid() {
		return projguid;
	}
	
	public void setProjguid(String projguid) {
	    colset.add("projguid");
		this.projguid = projguid;
	}
	
	public String getCompanyguid() {
		return companyguid;
	}
	
	public void setCompanyguid(String companyguid) {
	    colset.add("companyguid");
		this.companyguid = companyguid;
	}
	
	public String getLiveFormatOrig() {
		return liveFormatOrig;
	}
	
	public void setLiveFormatOrig(String liveFormatOrig) {
	    colset.add("liveFormatOrig");
		this.liveFormatOrig = liveFormatOrig;
	}
	
	public String getProjHouseTypeOrig() {
		return projHouseTypeOrig;
	}
	
	public void setProjHouseTypeOrig(String projHouseTypeOrig) {
	    colset.add("projHouseTypeOrig");
		this.projHouseTypeOrig = projHouseTypeOrig;
	}
	
	public String getWorkAreaOrig() {
		return workAreaOrig;
	}
	
	public void setWorkAreaOrig(String workAreaOrig) {
	    colset.add("workAreaOrig");
		this.workAreaOrig = workAreaOrig;
	}
	
	public String getLiveAreaOrig() {
		return liveAreaOrig;
	}
	
	public void setLiveAreaOrig(String liveAreaOrig) {
	    colset.add("liveAreaOrig");
		this.liveAreaOrig = liveAreaOrig;
	}
	
	public String getChildrenNumOrig() {
		return childrenNumOrig;
	}
	
	public void setChildrenNumOrig(String childrenNumOrig) {
	    colset.add("childrenNumOrig");
		this.childrenNumOrig = childrenNumOrig;
	}
	
	public String getCardid() {
		return cardid;
	}
	
	public void setCardid(String cardid) {
	    colset.add("cardid");
		this.cardid = cardid;
	}
	
	public String getSubtype() {
		return subtype;
	}
	
	public void setSubtype(String subtype) {
	    colset.add("subtype");
		this.subtype = subtype;
	}
	
	public Integer getCsttype() {
		return csttype;
	}
	
	public void setCsttype(Integer csttype) {
	    colset.add("csttype");
		this.csttype = csttype;
	}
	
	public Integer getCardtype() {
		return cardtype;
	}
	
	public void setCardtype(Integer cardtype) {
	    colset.add("cardtype");
		this.cardtype = cardtype;
	}
	
	public String getRoomAcreSegment() {
		return roomAcreSegment;
	}
	
	public void setRoomAcreSegment(String roomAcreSegment) {
	    colset.add("roomAcreSegment");
		this.roomAcreSegment = roomAcreSegment;
	}
	
	public Integer getCstnum() {
		return cstnum;
	}
	
	public void setCstnum(Integer cstnum) {
	    colset.add("cstnum");
		this.cstnum = cstnum;
	}
	
	public Double getPropertyrate() {
		return propertyrate;
	}
	
	public void setPropertyrate(Double propertyrate) {
	    colset.add("propertyrate");
		this.propertyrate = propertyrate;
	}
	
	public String getTradeguid() {
		return tradeguid;
	}
	
	public void setTradeguid(String tradeguid) {
	    colset.add("tradeguid");
		this.tradeguid = tradeguid;
	}
	
	public String getCstoriginplace() {
		return cstoriginplace;
	}
	
	public void setCstoriginplace(String cstoriginplace) {
	    colset.add("cstoriginplace");
		this.cstoriginplace = cstoriginplace;
	}
	
	public String getCstindustry() {
		return cstindustry;
	}
	
	public void setCstindustry(String cstindustry) {
	    colset.add("cstindustry");
		this.cstindustry = cstindustry;
	}
	
	public String getCstcuryl() {
		return cstcuryl;
	}
	
	public void setCstcuryl(String cstcuryl) {
	    colset.add("cstcuryl");
		this.cstcuryl = cstcuryl;
	}
	
	public Date getJfdate() {
		return jfdate;
	}
	
	public void setJfdate(Date jfdate) {
	    colset.add("jfdate");
		this.jfdate = jfdate;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
	    colset.add("id");
		this.id = id;
	}
	


}
