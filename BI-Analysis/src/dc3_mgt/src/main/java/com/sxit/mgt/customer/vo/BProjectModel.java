package com.sxit.mgt.customer.vo;

public class BProjectModel {

	/**
	 * 项目guid
	 */
	private String projGUID;
	/**
	 * 项目名称
	 */
	private String projName;
	
	/**
	 * 意向等级
	 */
	private String oppIntentLevel;
	
	/**
	 * 意向户型
	 */
	private String oppHuxingIntent;
	
	/**
	 * 意向面积
	 */
	private String oppRoomAreaIntent;
	
	/**
	 * 意向类型
	 */
	private String oppTypeIntent;
	
	/**
	 * 意向价格
	 */
	private String oppTotalIntent;
	
	/**
	 * 意向区域
	 */
	private String oppAreaIntent;
	
	/**
	 * 意向项目
	 */
	private String oppProjectIntent;
	
	private String bldGUID;
	/**
	 * 房产类型
	 */
	private String bldProPerty;
	/**
	 * 房产户型
	 */
	private String roomStru;
	
	/**
	 * 房产区域
	 */
	private String projArea;
	/**
	 * 房产总价
	 */
	private Double price;
	/**
	 * 房产面积
	 */
	private Double bldArea;
	
	public BProjectModel(){
		super();
	}

	public String getProjGUID() {
		return projGUID;
	}

	public void setProjGUID(String projGUID) {
		this.projGUID = projGUID;
	}

	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public String getOppIntentLevel() {
		return oppIntentLevel;
	}

	public void setOppIntentLevel(String oppIntentLevel) {
		this.oppIntentLevel = oppIntentLevel;
	}

	public String getOppHuxingIntent() {
		return oppHuxingIntent;
	}

	public void setOppHuxingIntent(String oppHuxingIntent) {
		this.oppHuxingIntent = oppHuxingIntent;
	}

	public String getOppRoomAreaIntent() {
		return oppRoomAreaIntent;
	}

	public void setOppRoomAreaIntent(String oppRoomAreaIntent) {
		this.oppRoomAreaIntent = oppRoomAreaIntent;
	}

	public String getOppTypeIntent() {
		return oppTypeIntent;
	}

	public void setOppTypeIntent(String oppTypeIntent) {
		this.oppTypeIntent = oppTypeIntent;
	}

	public String getOppTotalIntent() {
		return oppTotalIntent;
	}

	public void setOppTotalIntent(String oppTotalIntent) {
		this.oppTotalIntent = oppTotalIntent;
	}

	public String getOppAreaIntent() {
		return oppAreaIntent;
	}

	public void setOppAreaIntent(String oppAreaIntent) {
		this.oppAreaIntent = oppAreaIntent;
	}

	public String getOppProjectIntent() {
		return oppProjectIntent;
	}

	public void setOppProjectIntent(String oppProjectIntent) {
		this.oppProjectIntent = oppProjectIntent;
	}

	public String getBldProPerty() {
		return bldProPerty;
	}

	public void setBldProPerty(String bldProPerty) {
		this.bldProPerty = bldProPerty;
	}

	public String getRoomStru() {
		return roomStru;
	}

	public void setRoomStru(String roomStru) {
		this.roomStru = roomStru;
	}

	public String getProjArea() {
		return projArea;
	}

	public void setProjArea(String projArea) {
		this.projArea = projArea;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getBldArea() {
		return bldArea;
	}

	public void setBldArea(Double bldArea) {
		this.bldArea = bldArea;
	}

	public String getBldGUID() {
		return bldGUID;
	}

	public void setBldGUID(String bldGUID) {
		this.bldGUID = bldGUID;
	}
	
}
