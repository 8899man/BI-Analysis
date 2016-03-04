package com.sxit.mgt.label.dto;

import java.util.List;

import com.sxit.model.label.LableStorage;

public class LocalLableStorage {

	private List<LableStorage> agingList;
	
	private List<LableStorage> notAgingList;
	
	public LocalLableStorage(){
		super();
	}

	public List<LableStorage> getAgingList() {
		return agingList;
	}

	public void setAgingList(List<LableStorage> agingList) {
		this.agingList = agingList;
	}

	public List<LableStorage> getNotAgingList() {
		return notAgingList;
	}

	public void setNotAgingList(List<LableStorage> notAgingList) {
		this.notAgingList = notAgingList;
	}
	
}
