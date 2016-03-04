package com.sxit.mgt.pmp.dto;

import java.util.Date;

/**
 * @公司:深讯信科
 * @功能:BProjSum Model
 * @作者:Edson.di   
 * @日期:2015-09-23 09:43:07  
 * @版本:1.0
 * @修改:
 */

public class BProjSumModel {
	private Long proj_sum_id;//序列号
	private String proj_guid;//项目GUID   
	private String proj_name;//项目名称   
	private String area_id;//区域ID   
	private String cityCode;//城市ID 
	private Integer sale_sum;//总成交套数   
	private double saleamountsum;//总成交金额   
	private double sale_scale;//已销比例   
	private Integer trade_sum;//总投诉单数   
	private Integer repairs_sum;//总报修单数   
	private Integer family_sum;//总户数
	private String status;//状态  1=在售,2=已售
	private Date create_time;//统计时间
	private Integer subsc_sum;

	public Integer getSubsc_sum() {
		return subsc_sum;
	}
	public void setSubsc_sum(Integer subsc_sum) {
		this.subsc_sum = subsc_sum;
	}

	public Long getProj_sum_id() {
	    return this.proj_sum_id;
	}
	public void setProj_sum_id(Long proj_sum_id) {
	    this.proj_sum_id=proj_sum_id;
	}
	public String getProj_guid() {
	    return this.proj_guid;
	}
	public void setProj_guid(String proj_guid) {
	    this.proj_guid=proj_guid;
	}
	public String getProj_name() {
	    return this.proj_name;
	}
	public void setProj_name(String proj_name) {
	    this.proj_name=proj_name;
	}
	public String getArea_id() {
	    return this.area_id;
	}
	public void setArea_id(String area_id) {
	    this.area_id=area_id;
	}
	public String getCityCode() {
	    return this.cityCode;
	}
	public void setCityCode(String cityCode) {
	    this.cityCode=cityCode;
	}
	public Integer getSale_sum() {
	    return this.sale_sum;
	}
	public void setSale_sum(Integer sale_sum) {
	    this.sale_sum=sale_sum;
	}
	public double getSaleamountsum() {
	    return this.saleamountsum;
	}
	public void setSaleamountsum(double saleamountsum) {
	    this.saleamountsum=saleamountsum;
	}
	public double getSale_scale() {
	    return this.sale_scale;
	}
	public void setSale_scale(double sale_scale) {
	    this.sale_scale=sale_scale;
	}
	public Integer getTrade_sum() {
	    return this.trade_sum;
	}
	public void setTrade_sum(Integer trade_sum) {
	    this.trade_sum=trade_sum;
	}
	public Integer getRepairs_sum() {
	    return this.repairs_sum;
	}
	public void setRepairs_sum(Integer repairs_sum) {
	    this.repairs_sum=repairs_sum;
	}
	public Integer getFamily_sum() {
	    return this.family_sum;
	}
	public void setFamily_sum(Integer family_sum) {
	    this.family_sum=family_sum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreate_time() {
	    return this.create_time;
	}
	public void setCreate_time(Date date) {
	    this.create_time=date;
	}
}
