package com.sxit.mgt.customer.vo;

import java.util.List;

public class RptChart {
	private List<String> categories;
	private List<Long> data;
	
	public RptChart(){
		super();
	}

	public List<String> getCategories() {
		return categories;
	}

	public void setCategories(List<String> categories) {
		this.categories = categories;
	}

	public List<Long> getData() {
		return data;
	}

	public void setData(List<Long> data) {
		this.data = data;
	}
	
}
