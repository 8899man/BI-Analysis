package com.sxit.mgt.reports.dto;

import java.util.List;

public class SplineSeriesDto {

	private String name;
	private List<Object> data;
	
	public SplineSeriesDto(){
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Object> getData() {
		return data;
	}

	public void setData(List<Object> data) {
		this.data = data;
	}
	
}
