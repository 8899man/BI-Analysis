package com.sxit.mgt.reports.dto;

import java.util.List;

public class Map2Data {

	private String name;
	private List<Integer> data;
	
	public Map2Data(){
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Integer> getData() {
		return data;
	}

	public void setData(List<Integer> data) {
		this.data = data;
	}
	
}
