package com.sxit.model.customer;

import java.util.Date;

public class ClientList {

	private Long cstGUID;
	private String cstName;
	private Long gender;
	private String mobileTel;
	private String cardID;
	private String ageGroup;
//	private String childNum;
//	private String familyStructure;
//	private String degree;
//	private String sourceChannel;
//	private String workArea;
//	private String lifeArea;
//	private String companyType;
//	private String projectIntent;
	private Long formats;
//	private String userGUID;
//	private Date firstVistTime;
//	private Date bookingDate;
//	private Date orderDate;
	private Date contractDate;
//	private Date rentDate;
//	private Date createTime;
//	private String status;
//	private String createMan;
	private String areaID;
	private String cityID;
	private String projGUID;
	
	public ClientList(){
		super();
	}

	public Long getCstGUID() {
		return cstGUID;
	}

	public void setCstGUID(Long cstGUID) {
		this.cstGUID = cstGUID;
	}

	public String getCstName() {
		return cstName;
	}

	public void setCstName(String cstName) {
		this.cstName = cstName;
	}

	public Long getGender() {
		return gender;
	}

	public void setGender(Long gender) {
		this.gender = gender;
	}

	public String getMobileTel() {
		return mobileTel;
	}

	public void setMobileTel(String mobileTel) {
		this.mobileTel = mobileTel;
	}

	public String getCardID() {
		return cardID;
	}

	public void setCardID(String cardID) {
		this.cardID = cardID;
	}

	public String getAgeGroup() {
		return ageGroup;
	}

	public void setAgeGroup(String ageGroup) {
		this.ageGroup = ageGroup;
	}

	public String getProjGUID() {
		return projGUID;
	}

	public void setProjGUID(String projGUID) {
		this.projGUID = projGUID;
	}

	public Long getFormats() {
		return formats;
	}

	public void setFormats(Long formats) {
		this.formats = formats;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}

	public String getAreaID() {
		return areaID;
	}

	public void setAreaID(String areaID) {
		this.areaID = areaID;
	}

	public String getCityID() {
		return cityID;
	}

	public void setCityID(String cityID) {
		this.cityID = cityID;
	}

}
