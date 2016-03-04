package com.sxit.mgt.pmp.dto;

import java.util.List;

public class DealCity {
	private List<Object> categories;
	private List<Data> data;
	
	public DealCity(){
		super();
	}
	
	public List<Object> getCategories() {
		return categories;
	}
	public void setCategories(List<Object> categories) {
		this.categories = categories;
	}
	public List<Data> getData() {
		return data;
	}
	public void setData(List<Data> data) {
		this.data = data;
	}
}
