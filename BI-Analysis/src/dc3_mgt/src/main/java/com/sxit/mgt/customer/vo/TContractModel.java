package com.sxit.mgt.customer.vo;

import java.util.Date;

public class TContractModel {
	
	private String projName;
	
	private Long roomId;
	
	private String roomGUID;
	
	private String room;
	
	private String projGUID;
	
	private String bldGUID;
	
	private Date qsDate;
	
	private String qsDateStr;
	
	private double htTotal;
	
	private String bldFullName;
	
	public TContractModel(){
		super();
	}

	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public Date getQsDate() {
		return qsDate;
	}

	public void setQsDate(Date qsDate) {
		this.qsDate = qsDate;
	}

	public double getHtTotal() {
		return htTotal;
	}

	public void setHtTotal(double htTotal) {
		this.htTotal = htTotal;
	}

	public String getBldFullName() {
		return bldFullName;
	}

	public void setBldFullName(String bldFullName) {
		this.bldFullName = bldFullName;
	}

	public String getQsDateStr() {
		return qsDateStr;
	}

	public void setQsDateStr(String qsDateStr) {
		this.qsDateStr =qsDateStr;
	}

	public Long getRoomId() {
		return roomId;
	}

	public void setRoomId(Long roomId) {
		this.roomId = roomId;
	}

	public String getRoomGUID() {
		return roomGUID;
	}

	public void setRoomGUID(String roomGUID) {
		this.roomGUID = roomGUID;
	}

	public String getProjGUID() {
		return projGUID;
	}

	public void setProjGUID(String projGUID) {
		this.projGUID = projGUID;
	}

	public String getBldGUID() {
		return bldGUID;
	}

	public void setBldGUID(String bldGUID) {
		this.bldGUID = bldGUID;
	}
	
}
