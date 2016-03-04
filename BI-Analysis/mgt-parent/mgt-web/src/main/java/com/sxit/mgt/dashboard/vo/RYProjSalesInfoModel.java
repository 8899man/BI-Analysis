package com.sxit.mgt.dashboard.vo;

public class RYProjSalesInfoModel {

	private String projGUID;
	private String name;
	private Double money;
	
	public RYProjSalesInfoModel(){
		super();
	}

	public String getProjGUID() {
		return projGUID;
	}

	public void setProjGUID(String projGUID) {
		this.projGUID = projGUID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

}
