package com.sxit.mgt.pmp.dto;

import java.util.List;

public class CustomerFeature {
	private String title;
	private List<Arr> arr;
	
	public CustomerFeature(){
		super();
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Arr> getArr() {
		return arr;
	}
	public void setArr(List<Arr> arr) {
		this.arr = arr;
	}
}
