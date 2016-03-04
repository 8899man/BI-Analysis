package com.sxit.mgt.dashboard.vo;

public class RYKMonthAnalyseModel {

	private Integer repairNum;
	private Integer complainNum;
	private String dataDate;
	
	public RYKMonthAnalyseModel(){
		super();
	}

	public Integer getRepairNum() {
		return repairNum;
	}

	public void setRepairNum(Integer repairNum) {
		this.repairNum = repairNum;
	}

	public Integer getComplainNum() {
		return complainNum;
	}

	public void setComplainNum(Integer complainNum) {
		this.complainNum = complainNum;
	}

	public String getDataDate() {
		return dataDate;
	}

	public void setDataDate(String dataDate) {
		this.dataDate = dataDate;
	}
	
}
