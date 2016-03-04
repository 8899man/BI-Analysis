package com.sxit.mgt.pmp.dto;

import java.util.Date;

/**
 * @公司:深讯信科
 * @功能:FormatConvert Model
 * @作者:Edson.di   
 * @日期:2015-09-23 09:43:07  
 * @版本:1.0
 * @修改:
 */

public class FormatConvertModel{
	
	private Long format_convert_id;//   
	private String proj_guid;//   
	private String index_format_type;//
	private double incoming_visit_sum;//   
	private double visit_confess_sum;//   
	private double visti_subscribe_sum;//   
	private double confess_subscribe_sum;//   
	private double subscribe_contract_sum;//   
	private double contract_returned_sum;//
	private Date create_time;//
	private double incoming_tele_sum;//   来电客户数
	private double visit_cst_num;//   到访客户数
	private double confess_cst_num;//   认筹客户数
	private double subscribe_cst_num;//   认购客户数
	private double contract_cst_num;//   签约客户数 
	
	public Long getFormat_convert_id() {
	    return this.format_convert_id;
	}
	public void setFormat_convert_id(Long format_convert_id) {
	    this.format_convert_id=format_convert_id;
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
	public double getIncoming_visit_sum() {
	    return this.incoming_visit_sum;
	}
	public void setIncoming_visit_sum(double incoming_visit_sum) {
	    this.incoming_visit_sum=incoming_visit_sum;
	}
	public double getVisit_confess_sum() {
	    return this.visit_confess_sum;
	}
	public void setVisit_confess_sum(double visit_confess_sum) {
	    this.visit_confess_sum=visit_confess_sum;
	}
	public double getVisti_subscribe_sum() {
	    return this.visti_subscribe_sum;
	}
	public void setVisti_subscribe_sum(double visti_subscribe_sum) {
	    this.visti_subscribe_sum=visti_subscribe_sum;
	}
	public double getConfess_subscribe_sum() {
	    return this.confess_subscribe_sum;
	}
	public void setConfess_subscribe_sum(double confess_subscribe_sum) {
	    this.confess_subscribe_sum=confess_subscribe_sum;
	}
	public double getSubscribe_contract_sum() {
	    return this.subscribe_contract_sum;
	}
	public void setSubscribe_contract_sum(double subscribe_contract_sum) {
	    this.subscribe_contract_sum=subscribe_contract_sum;
	}
	public double getContract_returned_sum() {
	    return this.contract_returned_sum;
	}
	public void setContract_returned_sum(double contract_returned_sum) {
	    this.contract_returned_sum=contract_returned_sum;
	}
	public Date getCreate_time() {
	    return this.create_time;
	}
	public void setCreate_time(Date create_time) {
	    this.create_time=create_time;
	}
	
	public double getIncoming_tele_sum() {
		return incoming_tele_sum;
	}
	public void setIncoming_tele_sum(double incoming_tele_sum) {
		this.incoming_tele_sum = incoming_tele_sum;
	}
	public double getVisit_cst_num() {
		return visit_cst_num;
	}
	public void setVisit_cst_num(double visit_cst_num) {
		this.visit_cst_num = visit_cst_num;
	}
	public double getConfess_cst_num() {
		return confess_cst_num;
	}
	public void setConfess_cst_num(double confess_cst_num) {
		this.confess_cst_num = confess_cst_num;
	}
	public double getSubscribe_cst_num() {
		return subscribe_cst_num;
	}
	public void setSubscribe_cst_num(double subscribe_cst_num) {
		this.subscribe_cst_num = subscribe_cst_num;
	}
	public double getContract_cst_num() {
		return contract_cst_num;
	}
	public void setContract_cst_num(double contract_cst_num) {
		this.contract_cst_num = contract_cst_num;
	}
	
}
