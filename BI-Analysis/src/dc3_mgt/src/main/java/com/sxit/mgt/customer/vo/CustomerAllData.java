package com.sxit.mgt.customer.vo;

import java.util.List;

import com.sxit.model.customer.CstAttach;
import com.sxit.model.customer.Customer;
import com.sxit.model.member.CstMember;

public class CustomerAllData {
	
	//客户轨迹
	private List<SFollowRecordModel> sFollowRecordList;
	
	//会员关系
	private List<CstMember> cstMemberList;
	
	//交易关系
	private List<TContractModel> tContractList;
	
	//房产关系
	private List<TContractModel> tContractRoomList;
	
	//房产特征
	private List<BProjectModel> tradeList;
	
	//意向特征
	private List<BProjectModel> oppList;
	
	//客户基础信息
	private Customer customer;
	
	//关联房产
	private List<UnionTrade> unionTradeList;
	
	//邮箱地址
	private List<CstAttach> mailList;
	
	//房产区域
	private String lifeArea;
	
	//籍贯
	private String hometown;
	
	//工作区域
	private String address;
	
	//文化程度
	private String degree;
	
	//从事行业
	private String job;
	
	//工作职位
	private String position;
	
	public CustomerAllData(){
		super();
	}

	public List<SFollowRecordModel> getsFollowRecordList() {
		return sFollowRecordList;
	}

	public void setsFollowRecordList(List<SFollowRecordModel> sFollowRecordList) {
		this.sFollowRecordList = sFollowRecordList;
	}

	public List<CstMember> getCstMemberList() {
		return cstMemberList;
	}

	public void setCstMemberList(List<CstMember> cstMemberList) {
		this.cstMemberList = cstMemberList;
	}

	public List<TContractModel> gettContractList() {
		return tContractList;
	}

	public void settContractList(List<TContractModel> tContractList) {
		this.tContractList = tContractList;
	}

	public List<TContractModel> gettContractRoomList() {
		return tContractRoomList;
	}

	public void settContractRoomList(List<TContractModel> tContractRoomList) {
		this.tContractRoomList = tContractRoomList;
	}

	public List<BProjectModel> getTradeList() {
		return tradeList;
	}

	public void setTradeList(List<BProjectModel> tradeList) {
		this.tradeList = tradeList;
	}

	public List<BProjectModel> getOppList() {
		return oppList;
	}

	public void setOppList(List<BProjectModel> oppList) {
		this.oppList = oppList;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<UnionTrade> getUnionTradeList() {
		return unionTradeList;
	}

	public void setUnionTradeList(List<UnionTrade> unionTradeList) {
		this.unionTradeList = unionTradeList;
	}

	public List<CstAttach> getMailList() {
		return mailList;
	}

	public void setMailList(List<CstAttach> mailList) {
		this.mailList = mailList;
	}

	public String getLifeArea() {
		return lifeArea;
	}

	public void setLifeArea(String lifeArea) {
		this.lifeArea = lifeArea;
	}

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
}
