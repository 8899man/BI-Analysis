package com.sxit.mgt.dashboard.vo;

public class MonthOpenedModel {

	private String projName;
	private String projGUID;
	private String openDate;
	
	public MonthOpenedModel(){
		super();
	}

	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public String getProjGUID() {
		return projGUID;
	}

	public void setProjGUID(String projGUID) {
		this.projGUID = projGUID;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	
}
