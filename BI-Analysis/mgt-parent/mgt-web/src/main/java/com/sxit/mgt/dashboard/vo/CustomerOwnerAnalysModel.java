package com.sxit.mgt.dashboard.vo;

public class CustomerOwnerAnalysModel {

	private String name;
	private Long number;
	private String percent;
	
	public CustomerOwnerAnalysModel(){
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}
	
}
