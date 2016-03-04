package com.sxit.model.customer;

public class RptMutipleFormats {

	private Long cstType;
	private String title;
	private Long number;
	private Long allTotal;
	private Double proportion;
	
	public RptMutipleFormats(){
		super();
	}

	public Long getCstType() {
		return cstType;
	}

	public void setCstType(Long cstType) {
		this.cstType = cstType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	public Long getAllTotal() {
		return allTotal;
	}

	public void setAllTotal(Long allTotal) {
		this.allTotal = allTotal;
	}

	public Double getProportion() {
		return proportion;
	}

	public void setProportion(Double proportion) {
		this.proportion = proportion;
	}
	
}
