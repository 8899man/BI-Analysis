package com.sxit.model.label;

import java.sql.Timestamp;
import java.util.Date;

public class Label {
	private int label_id;
	private String label_guid;
	private Date createTime;
	private String label_name;
	private String label_info;
	private String querySql;
	private Timestamp execTime;
	private String creatorguid;
	private String label_type;
	private String isNet;
	private int label_cst_num;
	
	
	public int getLabel_cst_num() {
		return label_cst_num;
	}
	public void setLabel_cst_num(int label_cst_num) {
		this.label_cst_num = label_cst_num;
	}
	
	public String getIsNet() {
		return isNet;
	}
	public void setIsNet(String isNet) {
		this.isNet = isNet;
	}
	public int getLabel_id() {
		return label_id;
	}
	public void setLabel_id(int label_id) {
		this.label_id = label_id;
	}
	public String getLabel_guid() {
		return label_guid;
	}
	public void setLabel_guid(String label_guid) {
		this.label_guid = label_guid;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getLabel_name() {
		return label_name;
	}
	public void setLabel_name(String label_name) {
		this.label_name = label_name;
	}
	public String getLabel_info() {
		return label_info;
	}
	public void setLabel_info(String label_info) {
		this.label_info = label_info;
	}
	public String getQuerySql() {
		return querySql;
	}
	public void setQuerySql(String querySql) {
		this.querySql = querySql;
	}
	
	public String getCreatorguid() {
		return creatorguid;
	}
	public void setCreatorguid(String creatorguid) {
		this.creatorguid = creatorguid;
	}
	public String getLabel_type() {
		return label_type;
	}
	public void setLabel_type(String label_type) {
		this.label_type = label_type;
	}
	public Timestamp getExecTime() {
		return execTime;
	}
	public void setExecTime(Timestamp execTime) {
		this.execTime = execTime;
	}
	
	
}
