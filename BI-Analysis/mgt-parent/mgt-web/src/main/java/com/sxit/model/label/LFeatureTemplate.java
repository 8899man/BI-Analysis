package com.sxit.model.label;
/**
 * @公司:深讯信科
 * @功能:标签 Model
 * @作者:dengbiao    
 * @日期:2015-11-23 10:56:53  
 * @版本:1.0
 * @修改:
 */
public class LFeatureTemplate {
	/**
	 *序列 
	 */
	private Long feaTemplateId; 
	/**
	 *树根节点 
	 */
	private String feaTemplateGuid; 
	/**
	 *标签大类名称(特征类别) 
	 */
	private String roottitle; 
	/**
	 *特征类型值 
	 */
	private String rootvalue; 
	/**
	 *标签小类名称 
	 */
	private String suptitle; 
	/**
	 *示表是全网还是本地的 
	 */
	private Integer lablekey; 
	/**
	 *签标名称中文 
	 */
	private String feaTemplateValue; 
	/**
	 *是否显示标签(true,false) 
	 */
	private String showsuptitle; 
	/**
	 *是否显示标签分类(ture,false) 
	 */
	private String hassubs; 
	/**
	 *标签分类(标签编号) 
	 */
	private String model; 
	/**
	 *标签分类名称 
	 */
	private String title; 
	/**
	 *标签key 
	 */
	private String optionsname; 
	/**
	 *标签value 
	 */
	private String optionsvalue; 
	/**
	 *标签区域key 
	 */
	private String subsname; 
	/**
	 *标签区域value 
	 */
	private String subsvalue; 
	/**
	 *父节点 
	 */
	private String parentguid; 
	/**
	 * 
	 */
	private Integer isroot; 
	/**
	 * 
	 */
	private Integer isleaf; 
	/**
	 *数据来源表明 
	 */
	private String tTablename; 
	/**
	 *Where sql表达式 
	 */
	private String tFeatureexpress; 
	/**
	 * 
	 */
	private String tSourcechannel; 
	/**
	 * 
	 */
	private String tSourceapp;
	
	private int isdel;
	
	private int isdisabled;
	
	private int tableType;
	
	public LFeatureTemplate() { 
	  super();
	}
	
	/**
	 * 获取序列 
	 */
	public Long getFeaTemplateId() {
		return feaTemplateId;
	}
	
	/**
	 * 设置序列 
	 */
	public void setFeaTemplateId(Long feaTemplateId) {
		this.feaTemplateId = feaTemplateId;
	}
	
	/**
	 * 获取树根节点 
	 */
	public String getFeaTemplateGuid() {
		return feaTemplateGuid;
	}
	
	/**
	 * 设置树根节点 
	 */
	public void setFeaTemplateGuid(String feaTemplateGuid) {
		this.feaTemplateGuid = feaTemplateGuid;
	}
	
	/**
	 * 获取标签大类名称(特征类别) 
	 */
	public String getRoottitle() {
		return roottitle;
	}
	
	/**
	 * 设置标签大类名称(特征类别) 
	 */
	public void setRoottitle(String roottitle) {
		this.roottitle = roottitle;
	}
	
	/**
	 * 获取特征类型值 
	 */
	public String getRootvalue() {
		return rootvalue;
	}
	
	/**
	 * 设置特征类型值 
	 */
	public void setRootvalue(String rootvalue) {
		this.rootvalue = rootvalue;
	}
	
	/**
	 * 获取标签小类名称 
	 */
	public String getSuptitle() {
		return suptitle;
	}
	
	/**
	 * 设置标签小类名称 
	 */
	public void setSuptitle(String suptitle) {
		this.suptitle = suptitle;
	}
	
	/**
	 * 获取示表是全网还是本地的 
	 */
	public Integer getLablekey() {
		return lablekey;
	}
	
	/**
	 * 设置示表是全网还是本地的 
	 */
	public void setLablekey(Integer lablekey) {
		this.lablekey = lablekey;
	}
	
	/**
	 * 获取签标名称中文 
	 */
	public String getFeaTemplateValue() {
		return feaTemplateValue;
	}
	
	/**
	 * 设置签标名称中文 
	 */
	public void setFeaTemplateValue(String feaTemplateValue) {
		this.feaTemplateValue = feaTemplateValue;
	}
	
	/**
	 * 获取是否显示标签(true,false) 
	 */
	public String getShowsuptitle() {
		return showsuptitle;
	}
	
	/**
	 * 设置是否显示标签(true,false) 
	 */
	public void setShowsuptitle(String showsuptitle) {
		this.showsuptitle = showsuptitle;
	}
	
	/**
	 * 获取是否显示标签分类(ture,false) 
	 */
	public String getHassubs() {
		return hassubs;
	}
	
	/**
	 * 设置是否显示标签分类(ture,false) 
	 */
	public void setHassubs(String hassubs) {
		this.hassubs = hassubs;
	}
	
	/**
	 * 获取标签分类(标签编号) 
	 */
	public String getModel() {
		return model;
	}
	
	/**
	 * 设置标签分类(标签编号) 
	 */
	public void setModel(String model) {
		this.model = model;
	}
	
	/**
	 * 获取标签分类名称 
	 */
	public String getTitle() {
		return title;
	}
	
	/**
	 * 设置标签分类名称 
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	
	/**
	 * 获取标签key 
	 */
	public String getOptionsname() {
		return optionsname;
	}
	
	/**
	 * 设置标签key 
	 */
	public void setOptionsname(String optionsname) {
		this.optionsname = optionsname;
	}
	
	/**
	 * 获取标签value 
	 */
	public String getOptionsvalue() {
		return optionsvalue;
	}
	
	/**
	 * 设置标签value 
	 */
	public void setOptionsvalue(String optionsvalue) {
		this.optionsvalue = optionsvalue;
	}
	
	/**
	 * 获取标签区域key 
	 */
	public String getSubsname() {
		return subsname;
	}
	
	/**
	 * 设置标签区域key 
	 */
	public void setSubsname(String subsname) {
		this.subsname = subsname;
	}
	
	/**
	 * 获取标签区域value 
	 */
	public String getSubsvalue() {
		return subsvalue;
	}
	
	/**
	 * 设置标签区域value 
	 */
	public void setSubsvalue(String subsvalue) {
		this.subsvalue = subsvalue;
	}
	
	/**
	 * 获取父节点 
	 */
	public String getParentguid() {
		return parentguid;
	}
	
	/**
	 * 设置父节点 
	 */
	public void setParentguid(String parentguid) {
		this.parentguid = parentguid;
	}
	
	/**
	 * 获取 
	 */
	public Integer getIsroot() {
		return isroot;
	}
	
	/**
	 * 设置 
	 */
	public void setIsroot(Integer isroot) {
		this.isroot = isroot;
	}
	
	/**
	 * 获取 
	 */
	public Integer getIsleaf() {
		return isleaf;
	}
	
	/**
	 * 设置 
	 */
	public void setIsleaf(Integer isleaf) {
		this.isleaf = isleaf;
	}
	
	/**
	 * 获取数据来源表明 
	 */
	public String getTTablename() {
		return tTablename;
	}
	
	/**
	 * 设置数据来源表明 
	 */
	public void setTTablename(String tTablename) {
		this.tTablename = tTablename;
	}
	
	/**
	 * 获取Where sql表达式 
	 */
	public String getTFeatureexpress() {
		return tFeatureexpress;
	}
	
	/**
	 * 设置Where sql表达式 
	 */
	public void setTFeatureexpress(String tFeatureexpress) {
		this.tFeatureexpress = tFeatureexpress;
	}
	
	/**
	 * 获取 
	 */
	public String getTSourcechannel() {
		return tSourcechannel;
	}
	
	/**
	 * 设置 
	 */
	public void setTSourcechannel(String tSourcechannel) {
		this.tSourcechannel = tSourcechannel;
	}
	
	/**
	 * 获取 
	 */
	public String getTSourceapp() {
		return tSourceapp;
	}
	
	/**
	 * 设置 
	 */
	public void setTSourceapp(String tSourceapp) {
		this.tSourceapp = tSourceapp;
	}
	
	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	public int getIsdisabled() {
		return isdisabled;
	}

	public void setIsdisabled(int isdisabled) {
		this.isdisabled = isdisabled;
	}

	public int getTableType() {
		return tableType;
	}

	public void setTableType(int tableType) {
		this.tableType = tableType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((feaTemplateId == null) ? 0 : feaTemplateId.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		   LFeatureTemplate other = (LFeatureTemplate) obj;
		if (feaTemplateId == null) {
			if (other.feaTemplateId != null)
				return false;
		} else if (!feaTemplateId.equals(other.getFeaTemplateId()))
		    return false;
	    return true;
	}
}
