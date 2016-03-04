package com.sxit.mgt.reports.dto;

import java.util.List;

public class YeTaiMap2 {
	private List<String> categories;
//	private List<Map2Data> columnSeries;
	private List<Map2Data> splineSeries;
	
	public YeTaiMap2(){
		super();
	}

	public List<String> getCategories() {
		return categories;
	}

	public void setCategories(List<String> categories) {
		this.categories = categories;
	}

//	public List<Map2Data> getColumnSeries() {
//		return columnSeries;
//	}
//
//	public void setColumnSeries(List<Map2Data> columnSeries) {
//		this.columnSeries = columnSeries;
//	}

	public List<Map2Data> getSplineSeries() {
		return splineSeries;
	}

	public void setSplineSeries(List<Map2Data> splineSeries) {
		this.splineSeries = splineSeries;
	}

}
