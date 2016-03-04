package com.sxit.mgt.label.dto;


import java.util.HashSet;
import java.util.Set;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * @公司:深讯信科
 * @功能:标签 Model
 * @作者:dengbiao    
 * @日期:2015-10-25 22:10:23  
 * @版本:1.0
 * @修改:
 */
 
public class LabelModel {

  	public Set<String> colset = new HashSet<String>(0);
	/**
	 * 
	 */
	 @NotNull(message = "不能为空")
	private Long labellocalDetailsId; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String rootid; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String rootvalue; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String lablekey; 
	/**
	 *ȫ 
	 */
	 @NotBlank(message = "ȫ不能为空")
	private String lablevalue; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String roottitle; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String suptitle; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String showsuptitle; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String hassubs; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String model; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String title; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String optionsname; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String optionsvalue; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String subsname; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String subsvalue; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String rootguid; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String pguid; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String isroot; 
	/**
	 * 
	 */
	 @NotBlank(message = "不能为空")
	private String isleaf; 
	
	public LabelModel() { 
	  super();
	}
	
	public Long getLabellocalDetailsId() {
		return labellocalDetailsId;
	}
	
	public void setLabellocalDetailsId(Long labellocalDetailsId) {
	    colset.add("labellocalDetailsId");
		this.labellocalDetailsId = labellocalDetailsId;
	}
	
	public String getRootid() {
		return rootid;
	}
	
	public void setRootid(String rootid) {
	    colset.add("rootid");
		this.rootid = rootid;
	}
	
	public String getRootvalue() {
		return rootvalue;
	}
	
	public void setRootvalue(String rootvalue) {
	    colset.add("rootvalue");
		this.rootvalue = rootvalue;
	}
	
	public String getLablekey() {
		return lablekey;
	}
	
	public void setLablekey(String lablekey) {
	    colset.add("lablekey");
		this.lablekey = lablekey;
	}
	
	public String getLablevalue() {
		return lablevalue;
	}
	
	public void setLablevalue(String lablevalue) {
	    colset.add("lablevalue");
		this.lablevalue = lablevalue;
	}
	
	public String getRoottitle() {
		return roottitle;
	}
	
	public void setRoottitle(String roottitle) {
	    colset.add("roottitle");
		this.roottitle = roottitle;
	}
	
	public String getSuptitle() {
		return suptitle;
	}
	
	public void setSuptitle(String suptitle) {
	    colset.add("suptitle");
		this.suptitle = suptitle;
	}
	
	public String getShowsuptitle() {
		return showsuptitle;
	}
	
	public void setShowsuptitle(String showsuptitle) {
	    colset.add("showsuptitle");
		this.showsuptitle = showsuptitle;
	}
	
	public String getHassubs() {
		return hassubs;
	}
	
	public void setHassubs(String hassubs) {
	    colset.add("hassubs");
		this.hassubs = hassubs;
	}
	
	public String getModel() {
		return model;
	}
	
	public void setModel(String model) {
	    colset.add("model");
		this.model = model;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
	    colset.add("title");
		this.title = title;
	}
	
	public String getOptionsname() {
		return optionsname;
	}
	
	public void setOptionsname(String optionsname) {
	    colset.add("optionsname");
		this.optionsname = optionsname;
	}
	
	public String getOptionsvalue() {
		return optionsvalue;
	}
	
	public void setOptionsvalue(String optionsvalue) {
	    colset.add("optionsvalue");
		this.optionsvalue = optionsvalue;
	}
	
	public String getSubsname() {
		return subsname;
	}
	
	public void setSubsname(String subsname) {
	    colset.add("subsname");
		this.subsname = subsname;
	}
	
	public String getSubsvalue() {
		return subsvalue;
	}
	
	public void setSubsvalue(String subsvalue) {
	    colset.add("subsvalue");
		this.subsvalue = subsvalue;
	}
	
	public String getRootguid() {
		return rootguid;
	}
	
	public void setRootguid(String rootguid) {
	    colset.add("rootguid");
		this.rootguid = rootguid;
	}
	
	public String getPguid() {
		return pguid;
	}
	
	public void setPguid(String pguid) {
	    colset.add("pguid");
		this.pguid = pguid;
	}
	
	public String getIsroot() {
		return isroot;
	}
	
	public void setIsroot(String isroot) {
	    colset.add("isroot");
		this.isroot = isroot;
	}
	
	public String getIsleaf() {
		return isleaf;
	}
	
	public void setIsleaf(String isleaf) {
	    colset.add("isleaf");
		this.isleaf = isleaf;
	}
	


}
