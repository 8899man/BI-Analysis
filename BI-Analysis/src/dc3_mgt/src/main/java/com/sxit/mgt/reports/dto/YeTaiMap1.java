package com.sxit.mgt.reports.dto;

import java.util.List;

public class YeTaiMap1 {

	private List<String> cityName;
	private List<Integer> compPromNum;
	
	public YeTaiMap1(){
		super();
	}

	public List<String> getCityName() {
		return cityName;
	}

	public void setCityName(List<String> cityName) {
		this.cityName = cityName;
	}

	public List<Integer> getCompPromNum() {
		return compPromNum;
	}

	public void setCompPromNum(List<Integer> compPromNum) {
		this.compPromNum = compPromNum;
	}
	
}
