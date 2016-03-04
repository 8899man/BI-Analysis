package com.sxit.mgt.customer.vo;

public class UnionTrade {

	private String roomGUID;
	
	private Long roomId;
	
	private String room;
	
	private String projName;
	
	private String bldName;
	
	public UnionTrade(){
		super();
	}

	public String getRoom() {
		return room;
	}

	public String getRoomGUID() {
		return roomGUID;
	}

	public void setRoomGUID(String roomGUID) {
		this.roomGUID = roomGUID;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public String getBldName() {
		return bldName;
	}

	public void setBldName(String bldName) {
		this.bldName = bldName;
	}

	public Long getRoomId() {
		return roomId;
	}

	public void setRoomId(Long roomId) {
		this.roomId = roomId;
	}
	
}
