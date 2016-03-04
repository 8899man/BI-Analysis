package com.sxit.mgt.dashboard.vo;

public class RYZProjInfoModel {

	private String dataDate;
	private Integer saleNum;
	private Integer rentNum;
	private Double saleAmount;
	private Double rentAmount;
	
	public RYZProjInfoModel(){
		super();
	}

	public String getDataDate() {
		return dataDate;
	}

	public void setDataDate(String dataDate) {
		this.dataDate = dataDate;
	}

	public Integer getSaleNum() {
		return saleNum;
	}

	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}

	public Integer getRentNum() {
		return rentNum;
	}

	public void setRentNum(Integer rentNum) {
		this.rentNum = rentNum;
	}

	public Double getSaleAmount() {
		return saleAmount;
	}

	public void setSaleAmount(Double saleAmount) {
		this.saleAmount = saleAmount;
	}

	public Double getRentAmount() {
		return rentAmount;
	}

	public void setRentAmount(Double rentAmount) {
		this.rentAmount = rentAmount;
	}
	
}
