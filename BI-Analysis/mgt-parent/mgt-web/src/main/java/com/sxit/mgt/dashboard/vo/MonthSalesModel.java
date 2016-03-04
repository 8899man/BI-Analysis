package com.sxit.mgt.dashboard.vo;

public class MonthSalesModel {

	private String dataDate;
	private Integer dealSet;
	private Integer orderSet;
	private Integer newNum;
	
	public MonthSalesModel(){
		super();
	}

	public String getDataDate() {
		return dataDate;
	}

	public void setDataDate(String dataDate) {
		this.dataDate = dataDate;
	}

	public Integer getDealSet() {
		return dealSet;
	}

	public void setDealSet(Integer dealSet) {
		this.dealSet = dealSet;
	}

	public Integer getOrderSet() {
		return orderSet;
	}

	public void setOrderSet(Integer orderSet) {
		this.orderSet = orderSet;
	}

	public Integer getNewNum() {
		return newNum;
	}

	public void setNewNum(Integer newNum) {
		this.newNum = newNum;
	}

}
