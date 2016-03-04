package com.sxit.mgt.pmp.dto;

import java.util.Date;


public class RptCustomerCountMainModel{
	
		private Long customer_count_id;//   序列号	private String proj_id;//   项目编号	private String index_format_type;//   业态类型	private String customer_type;//   客户类型	private Integer customer_bought_sum;//   已购客户数	private Integer customer_intention_sum;//   意向客户数	private Date create_time;//   统计时间	public Long getCustomer_count_id() {	    return this.customer_count_id;	}	public void setCustomer_count_id(Long customer_count_id) {	    this.customer_count_id=customer_count_id;	}	public String getProj_id() {	    return this.proj_id;	}	public void setProj_id(String proj_id) {	    this.proj_id=proj_id;	}	public String getIndex_format_type() {	    return this.index_format_type;	}	public void setIndex_format_type(String index_format_type) {	    this.index_format_type=index_format_type;	}	public String getCustomer_type() {	    return this.customer_type;	}	public void setCustomer_type(String customer_type) {	    this.customer_type=customer_type;	}	public Integer getCustomer_bought_sum() {	    return this.customer_bought_sum;	}	public void setCustomer_bought_sum(Integer customer_bought_sum) {	    this.customer_bought_sum=customer_bought_sum;	}	public Integer getCustomer_intention_sum() {	    return this.customer_intention_sum;	}	public void setCustomer_intention_sum(Integer customer_intention_sum) {	    this.customer_intention_sum=customer_intention_sum;	}	public Date getCreate_time() {	    return this.create_time;	}	public void setCreate_time(Date create_time) {	    this.create_time=create_time;	}
}
