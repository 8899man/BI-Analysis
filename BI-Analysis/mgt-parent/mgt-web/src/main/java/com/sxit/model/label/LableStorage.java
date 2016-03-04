package com.sxit.model.label;

import java.util.Date;

public class LableStorage {
	private Long storageId;
	private Integer lableKey;
	private String id;
	private String lableType;
	private String labelAttr;
	private Long persons;
	private Date updateTime;
	private String info;
	private String sortTitle;
	private String optionName;
	private Date createTime;
	private String model;
	private String optionvalue;
	
	public LableStorage(){
		super();
	}

	public Long getStorageId() {
		return storageId;
	}

	public void setStorageId(Long storageId) {
		this.storageId = storageId;
	}

	public Integer getLableKey() {
		return lableKey;
	}

	public void setLableKey(Integer lableKey) {
		this.lableKey = lableKey;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLabelAttr() {
		return labelAttr;
	}

	public void setLabelAttr(String labelAttr) {
		this.labelAttr = labelAttr;
	}

	public Long getPersons() {
		return persons;
	}

	public void setPersons(Long persons) {
		this.persons = persons;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getSortTitle() {
		return sortTitle;
	}

	public void setSortTitle(String sortTitle) {
		this.sortTitle = sortTitle;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getLableType() {
		return lableType;
	}

	public void setLableType(String lableType) {
		this.lableType = lableType;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getOptionvalue() {
		return optionvalue;
	}

	public void setOptionvalue(String optionvalue) {
		this.optionvalue = optionvalue;
	}
	
}
