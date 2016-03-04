package com.sxit.model.customer;

import java.util.Date;

public class RptClassification {
	
	private String cstType;
	private String title;
	private Long finished;
	private Long allTotal;
	private Double proportion;
	private Date createTime;
	
	public RptClassification(){
		super();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getFinished() {
		return finished;
	}

	public void setFinished(Long finished) {
		this.finished = finished;
	}

	public String getCstType() {
		return cstType;
	}

	public void setCstType(String cstType) {
		this.cstType = cstType;
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
