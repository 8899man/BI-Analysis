package com.sxit.mgt.dashboard.vo;

public class RYTransAnalyseModel {

	private Double rentRate;
	private String rentWeek;
	private Double saleDealRate;
	private String saleDealWeek;
	
	public RYTransAnalyseModel(){
		super();
	}

	public Double getRentRate() {
		return rentRate;
	}

	public void setRentRate(Double rentRate) {
		this.rentRate = rentRate;
	}

	public String getRentWeek() {
		return rentWeek;
	}

	public void setRentWeek(String rentWeek) {
		this.rentWeek = rentWeek;
	}

	public Double getSaleDealRate() {
		return saleDealRate;
	}

	public void setSaleDealRate(Double saleDealRate) {
		this.saleDealRate = saleDealRate;
	}

	public String getSaleDealWeek() {
		return saleDealWeek;
	}

	public void setSaleDealWeek(String saleDealWeek) {
		this.saleDealWeek = saleDealWeek;
	}
	
}
