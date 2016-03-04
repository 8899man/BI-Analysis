package com.sxit.mgt.marketing.vo;

import java.util.List;

public class Subs {

	private String title;
	private String value;
	private List<Subs> subs;
	
	public Subs(){
		super();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public List<Subs> getSubs() {
		return subs;
	}

	public void setSubs(List<Subs> subs) {
		this.subs = subs;
	}
	
}
