package com.sxit.mgt.dashboard.vo;

public class SalesMoneyModel {

	private String yesterdayDeal;
	private String thisMonthDeal;
	private String thisSeasonDeal;
	private String thisYearDeal;
	private String stock;
	
	public SalesMoneyModel(){
		super();
	}

	public String getYesterdayDeal() {
		return yesterdayDeal;
	}

	public void setYesterdayDeal(String yesterdayDeal) {
		this.yesterdayDeal = yesterdayDeal;
	}

	public String getThisMonthDeal() {
		return thisMonthDeal;
	}

	public void setThisMonthDeal(String thisMonthDeal) {
		this.thisMonthDeal = thisMonthDeal;
	}

	public String getThisSeasonDeal() {
		return thisSeasonDeal;
	}

	public void setThisSeasonDeal(String thisSeasonDeal) {
		this.thisSeasonDeal = thisSeasonDeal;
	}

	public String getThisYearDeal() {
		return thisYearDeal;
	}

	public void setThisYearDeal(String thisYearDeal) {
		this.thisYearDeal = thisYearDeal;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}
	
}
