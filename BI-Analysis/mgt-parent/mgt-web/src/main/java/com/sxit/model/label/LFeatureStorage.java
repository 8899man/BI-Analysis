package com.sxit.model.label;

import java.util.Date;

public class LFeatureStorage {
	private Long storageId;
	private Integer featureType;
	private String labelGuid;
//	private String labelType;
//	private String labelName;
//	private String labelInfo;
	private String  featureTitle;
	private String optionName;
	private String optionvalue;
	private Date createTime;
	private Date updateTime;
	private String model;
	private String tableName;
	private String featureExpress;
	private String templateGuid;
	private String sys_user_id;
	private String sourceChannel;
	private String sourceApp;
	
	public Long getStorageId() {
		return storageId;
	}
	public void setStorageId(Long storageId) {
		this.storageId = storageId;
	}
	public Integer getFeatureType() {
		return featureType;
	}
	public void setFeatureType(Integer featureType) {
		this.featureType = featureType;
	}
//	public String getLabelType() {
//		return labelType;
//	}
//	public void setLabelType(String labelType) {
//		this.labelType = labelType;
//	}
	public String getFeatureTitle() {
		return featureTitle;
	}
	public void setFeatureTitle(String featureTitle) {
		this.featureTitle = featureTitle;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getOptionvalue() {
		return optionvalue;
	}
	public void setOptionvalue(String optionvalue) {
		this.optionvalue = optionvalue;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getFeatureExpress() {
		return featureExpress;
	}
	public void setFeatureExpress(String featureExpress) {
		this.featureExpress = featureExpress;
	}
	public String getLabelGuid() {
		return labelGuid;
	}
	public void setLabelGuid(String labelGuid) {
		this.labelGuid = labelGuid;
	}
	public String getTemplateGuid() {
		return templateGuid;
	}
	public void setTemplateGuid(String templateGuid) {
		this.templateGuid = templateGuid;
	}
	public String getSys_user_id() {
		return sys_user_id;
	}
	public void setSys_user_id(String sys_user_id) {
		this.sys_user_id = sys_user_id;
	}
	public String getSourceChannel() {
		return sourceChannel;
	}
	public void setSourceChannel(String sourceChannel) {
		this.sourceChannel = sourceChannel;
	}
	public String getSourceApp() {
		return sourceApp;
	}
	public void setSourceApp(String sourceApp) {
		this.sourceApp = sourceApp;
	} 
}
