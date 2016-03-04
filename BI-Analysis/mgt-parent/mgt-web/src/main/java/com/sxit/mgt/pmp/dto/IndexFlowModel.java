package com.sxit.mgt.pmp.dto;

import java.util.Date;

/**
 * @公司:深讯信科
 * @功能:IndexFlow Model
 * @作者:Edson.di   
 * @日期:2015-09-23 09:43:07  
 * @版本:1.0
 * @修改:
 */

public class IndexFlowModel{
	private Long index_flow_id;//   
	private String proj_guid;//   
	private String index_format_type;//
	private Integer visit_days;//   
	private Integer average_baseline_days;//
	private Integer overstep_days;//
	private Integer confess_days;//
	private Integer average_order_baseline_days;//
	private Date createtime;//
	public Long getIndex_flow_id() {
	    return this.index_flow_id;
	}
	public void setIndex_flow_id(Long index_flow_id) {
	    this.index_flow_id=index_flow_id;
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
	public Integer getVisit_days() {
	    return this.visit_days;
	}
	public void setVisit_days(Integer visit_days) {
	    this.visit_days=visit_days;
	}
	public Integer getAverage_baseline_days() {
	    return this.average_baseline_days;
	}
	public void setAverage_baseline_days(Integer average_baseline_days) {
	    this.average_baseline_days=average_baseline_days;
	}
	public Integer getOverstep_days() {
	    return this.overstep_days;
	}
	public void setOverstep_days(Integer overstep_days) {
	    this.overstep_days=overstep_days;
	}
	public Integer getConfess_days() {
	    return this.confess_days;
	}
	public void setConfess_days(Integer confess_days) {
	    this.confess_days=confess_days;
	}
	public Integer getAverage_order_baseline_days() {
		return average_order_baseline_days;
	}
	public void setAverage_order_baseline_days(Integer average_order_baseline_days) {
		this.average_order_baseline_days = average_order_baseline_days;
	}
	public Date getCreatetime() {
	    return this.createtime;
	}
	public void setCreatetime(Date date) {
	    this.createtime=date;
	}
	
}
