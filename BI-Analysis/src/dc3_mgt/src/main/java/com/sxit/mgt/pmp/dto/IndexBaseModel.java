package com.sxit.mgt.pmp.dto;

/**
 * @公司:深讯信科
 * @功能:IndexBase Model
 * @作者:Edson.di   
 * @日期:2015-09-23 09:43:07  
 * @版本:1.0
 * @修改:
 */

public class IndexBaseModel{
	
	private Long index_base_id;//   
	private String proj_guid;//   
	private String index_format_type;//
	private Integer follow_customer_sum;// 
	private Integer new_visitors_sum;// 
	private Integer old_visitors_sum;// 
	private Integer confess_customer_sum;// 
	private Integer confess_cycle_sum;// 
	private double confess_amount_sum;// 
	private Integer subscribe_customer_sum;//  
	private Integer subscribe_cycle_sum;// 
	private double subscribe_amount_sum;// 
	private Integer contract_customer_sum;//
	private Integer contract_cycle_sum;//
	private double contract_amount_sum;//
	private Integer returned_customer_sum;//  
	private Integer returned_cycle_sum;// 
	private double returned_amount_sum;//   
	private java.sql.Timestamp create_time;//
	public Long getIndex_base_id() {
	    return this.index_base_id;
	}
	public void setIndex_base_id(Long index_base_id) {
	    this.index_base_id=index_base_id;
	}
	public String getProj_guid() {
	    return this.proj_guid;
	}
	public void setProj_guid(String proj_guid) {
	    this.proj_guid=proj_guid;
	}
	public String getIndex_format_type() {
	    return this.index_format_type;
	}
	public void setIndex_format_type(String index_format_type) {
	    this.index_format_type=index_format_type;
	}
	public Integer getFollow_customer_sum() {
	    return this.follow_customer_sum;
	}
	public void setFollow_customer_sum(Integer follow_customer_sum) {
	    this.follow_customer_sum=follow_customer_sum;
	}
	public Integer getNew_visitors_sum() {
	    return this.new_visitors_sum;
	}
	public void setNew_visitors_sum(Integer new_visitors_sum) {
	    this.new_visitors_sum=new_visitors_sum;
	}
	public Integer getOld_visitors_sum() {
	    return this.old_visitors_sum;
	}
	public void setOld_visitors_sum(Integer old_visitors_sum) {
	    this.old_visitors_sum=old_visitors_sum;
	}
	public Integer getConfess_customer_sum() {
	    return this.confess_customer_sum;
	}
	public void setConfess_customer_sum(Integer confess_customer_sum) {
	    this.confess_customer_sum=confess_customer_sum;
	}
	public Integer getConfess_cycle_sum() {
	    return this.confess_cycle_sum;
	}
	public void setConfess_cycle_sum(Integer confess_cycle_sum) {
	    this.confess_cycle_sum=confess_cycle_sum;
	}
	public double getConfess_amount_sum() {
	    return this.confess_amount_sum;
	}
	public void setConfess_amount_sum(double confess_amount_sum) {
	    this.confess_amount_sum=confess_amount_sum;
	}
	public Integer getSubscribe_customer_sum() {
	    return this.subscribe_customer_sum;
	}
	public void setSubscribe_customer_sum(Integer subscribe_customer_sum) {
	    this.subscribe_customer_sum=subscribe_customer_sum;
	}
	public Integer getSubscribe_cycle_sum() {
	    return this.subscribe_cycle_sum;
	}
	public void setSubscribe_cycle_sum(Integer subscribe_cycle_sum) {
	    this.subscribe_cycle_sum=subscribe_cycle_sum;
	}
	public double getSubscribe_amount_sum() {
	    return this.subscribe_amount_sum;
	}
	public void setSubscribe_amount_sum(double subscribe_amount_sum) {
	    this.subscribe_amount_sum=subscribe_amount_sum;
	}
	public Integer getContract_customer_sum() {
	    return this.contract_customer_sum;
	}
	public void setContract_customer_sum(Integer contract_customer_sum) {
	    this.contract_customer_sum=contract_customer_sum;
	}
	public Integer getContract_cycle_sum() {
	    return this.contract_cycle_sum;
	}
	public void setContract_cycle_sum(Integer contract_cycle_sum) {
	    this.contract_cycle_sum=contract_cycle_sum;
	}
	public double getContract_amount_sum() {
	    return this.contract_amount_sum;
	}
	public void setContract_amount_sum(double contract_amount_sum) {
	    this.contract_amount_sum=contract_amount_sum;
	}
	public Integer getReturned_customer_sum() {
	    return this.returned_customer_sum;
	}
	public void setReturned_customer_sum(Integer returned_customer_sum) {
	    this.returned_customer_sum=returned_customer_sum;
	}
	public Integer getReturned_cycle_sum() {
	    return this.returned_cycle_sum;
	}
	public void setReturned_cycle_sum(Integer returned_cycle_sum) {
	    this.returned_cycle_sum=returned_cycle_sum;
	}
	public double getReturned_amount_sum() {
	    return this.returned_amount_sum;
	}
	public void setReturned_amount_sum(double returned_amount_sum) {
	    this.returned_amount_sum=returned_amount_sum;
	}
	public java.sql.Timestamp getCreate_time() {
	    return this.create_time;
	}
	public void setCreate_time(java.sql.Timestamp create_time) {
	    this.create_time=create_time;
	}
	
}
