package com.sxit.mgt.marketing.vo;

import java.util.List;

public class CustomerNumDetail {

	private String value;
	private String title;
	private String amount;
	private List<CustomerNumDetail> list;
	
	public CustomerNumDetail(){
		super();
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public List<CustomerNumDetail> getList() {
		return list;
	}

	public void setList(List<CustomerNumDetail> list) {
		this.list = list;
	}
	
}
