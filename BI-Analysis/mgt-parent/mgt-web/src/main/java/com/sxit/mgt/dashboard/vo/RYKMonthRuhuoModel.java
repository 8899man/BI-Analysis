package com.sxit.mgt.dashboard.vo;

public class RYKMonthRuhuoModel {

	private Long currSeq;
	private String projGUID;
	private String projName;
	private String ruhuoDate;
	private String checkinRange;
	private Long houseHoldNum;
	
	public RYKMonthRuhuoModel(){
		super();
	}

	public Long getCurrSeq() {
		return currSeq;
	}

	public void setCurrSeq(Long currSeq) {
		this.currSeq = currSeq;
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

	public String getRuhuoDate() {
		return ruhuoDate;
	}

	public void setRuhuoDate(String ruhuoDate) {
		this.ruhuoDate = ruhuoDate;
	}

	public String getCheckinRange() {
		return checkinRange;
	}

	public void setCheckinRange(String checkinRange) {
		this.checkinRange = checkinRange;
	}

	public Long getHouseHoldNum() {
		return houseHoldNum;
	}

	public void setHouseHoldNum(Long houseHoldNum) {
		this.houseHoldNum = houseHoldNum;
	}
	
}
