package com.sxit.mgt.reports.dto;

import java.util.List;

public class BAreaCompany {

	private String id;
	private String name;
	private List<BAreaCompany> child;
	
	public BAreaCompany(){
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<BAreaCompany> getChild() {
		return child;
	}

	public void setChild(List<BAreaCompany> child) {
		this.child = child;
	}
	
}
