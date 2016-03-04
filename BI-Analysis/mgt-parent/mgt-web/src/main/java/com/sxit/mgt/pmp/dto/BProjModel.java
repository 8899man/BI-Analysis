package com.sxit.mgt.pmp.dto;

public class BProjModel {
	
	private String projGUID;
	private String projCode;
	private String projAddress;
	private String occupyArea;
	private String buildArea;
	private String orgName;
	private Integer buildNum;
	private Integer roomNum;
	private Integer selledNum;
	private Integer noSellNum;
	
	public BProjModel(){
		super();
	}

	public String getProjGUID() {
		return projGUID;
	}

	public void setProjGUID(String projGUID) {
		this.projGUID = projGUID;
	}

	public String getProjCode() {
		return projCode;
	}

	public void setProjCode(String projCode) {
		this.projCode = projCode;
	}

	public String getProjAddress() {
		return projAddress;
	}

	public void setProjAddress(String projAddress) {
		this.projAddress = projAddress;
	}

	public String getOccupyArea() {
		return occupyArea;
	}

	public void setOccupyArea(String occupyArea) {
		this.occupyArea = occupyArea;
	}

	public String getBuildArea() {
		return buildArea;
	}

	public void setBuildArea(String buildArea) {
		this.buildArea = buildArea;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public Integer getBuildNum() {
		return buildNum;
	}

	public void setBuildNum(Integer buildNum) {
		this.buildNum = buildNum;
	}

	public Integer getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}

	public Integer getSelledNum() {
		return selledNum;
	}

	public void setSelledNum(Integer selledNum) {
		this.selledNum = selledNum;
	}

	public Integer getNoSellNum() {
		return noSellNum;
	}

	public void setNoSellNum(Integer noSellNum) {
		this.noSellNum = noSellNum;
	}
	
}
