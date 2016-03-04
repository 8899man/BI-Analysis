package com.sxit.model.customer;

import java.util.Date;

public class RptCstNumber {

	private Long cstType;
	private String title;
	private Long yesterdayAdded;
	private Long monthAdded;
	private Long totalAmount;
	private Long allTotal;
	private Double proportion;
	private Date createTime;
	
	public RptCstNumber(){
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

	public Long getYesterdayAdded() {
		return yesterdayAdded;
	}

	public void setYesterdayAdded(Long yesterdayAdded) {
		this.yesterdayAdded = yesterdayAdded;
	}

	public Long getMonthAdded() {
		return monthAdded;
	}

	public void setMonthAdded(Long monthAdded) {
		this.monthAdded = monthAdded;
	}

	public Long getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Long totalAmount) {
		this.totalAmount = totalAmount;
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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
