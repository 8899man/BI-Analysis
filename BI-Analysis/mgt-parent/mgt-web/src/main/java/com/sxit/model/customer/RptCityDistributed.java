package com.sxit.model.customer;

public class RptCityDistributed {
	
	private String cityId;
	private String cityName;
	private String areaId;
	private String areaName;
	private Long amount;
	private Integer sortIf;
	private Long sort;
	
	public RptCityDistributed(){
		super();
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public Integer getSortIf() {
		return sortIf;
	}

	public void setSortIf(Integer sortIf) {
		this.sortIf = sortIf;
	}

	public Long getSort() {
		return sort;
	}

	public void setSort(Long sort) {
		this.sort = sort;
	}
	
}
