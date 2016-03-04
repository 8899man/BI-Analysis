package com.sxit.mgt.customer.vo;

import java.util.List;

import com.sxit.model.customer.ClientList;

public class ClientListModel {
	
	private List<ClientList> clientList;
	private int totalPages;
	private int totalRows;
	private int PageSize;
	
	public ClientListModel(){
		super();
	}

	public List<ClientList> getClientList() {
		return clientList;
	}

	public void setClientList(List<ClientList> clientList) {
		this.clientList = clientList;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getPageSize() {
		return PageSize;
	}

	public void setPageSize(int PageSize) {
		this.PageSize = PageSize;
	}
	
}
