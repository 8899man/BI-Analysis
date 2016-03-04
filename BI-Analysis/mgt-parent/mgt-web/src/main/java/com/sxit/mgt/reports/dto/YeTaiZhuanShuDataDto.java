package com.sxit.mgt.reports.dto;

public class YeTaiZhuanShuDataDto {
	private String cityName;
	private Integer compPromNum;
	private Integer finishedNum;
	private Integer timeoFinishedNum;
	private Integer waitDealPromble;
	
	public YeTaiZhuanShuDataDto(){
		super();
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Integer getCompPromNum() {
		return compPromNum;
	}

	public void setCompPromNum(Integer compPromNum) {
		this.compPromNum = compPromNum;
	}

	public Integer getFinishedNum() {
		return finishedNum;
	}

	public void setFinishedNum(Integer finishedNum) {
		this.finishedNum = finishedNum;
	}

	public Integer getTimeoFinishedNum() {
		return timeoFinishedNum;
	}

	public void setTimeoFinishedNum(Integer timeoFinishedNum) {
		this.timeoFinishedNum = timeoFinishedNum;
	}

	public Integer getWaitDealPromble() {
		return waitDealPromble;
	}

	public void setWaitDealPromble(Integer waitDealPromble) {
		this.waitDealPromble = waitDealPromble;
	}
	
}
