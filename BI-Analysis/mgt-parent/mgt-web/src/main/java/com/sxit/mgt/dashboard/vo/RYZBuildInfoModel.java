package com.sxit.mgt.dashboard.vo;

public class RYZBuildInfoModel {

	
	//取日期最大的一条
	private Long rentWeekAdd;
	private Long rentNum;
	private Long saleWeekAdd;
	private Long saleNum;
	
	public RYZBuildInfoModel(){
		super();
	}

	public Long getRentWeekAdd() {
		return rentWeekAdd;
	}

	public void setRentWeekAdd(Long rentWeekAdd) {
		this.rentWeekAdd = rentWeekAdd;
	}

	public Long getRentNum() {
		return rentNum;
	}

	public void setRentNum(Long rentNum) {
		this.rentNum = rentNum;
	}

	public Long getSaleWeekAdd() {
		return saleWeekAdd;
	}

	public void setSaleWeekAdd(Long saleWeekAdd) {
		this.saleWeekAdd = saleWeekAdd;
	}

	public Long getSaleNum() {
		return saleNum;
	}

	public void setSaleNum(Long saleNum) {
		this.saleNum = saleNum;
	}

}
