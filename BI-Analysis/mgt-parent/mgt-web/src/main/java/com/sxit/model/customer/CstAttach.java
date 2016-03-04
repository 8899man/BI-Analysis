package com.sxit.model.customer;

public class CstAttach {
	
	private String cstguid;
	
	private String projguid;
	
	private String projname;
	
	private String attachCode;
	
	private String attachName;
	
	private String attachValue;
	
	public CstAttach(){
		super();
	}

	public String getCstguid() {
		return cstguid;
	}

	public void setCstguid(String cstguid) {
		this.cstguid = cstguid;
	}

	public String getProjguid() {
		return projguid;
	}

	public void setProjguid(String projguid) {
		this.projguid = projguid;
	}

	public String getProjname() {
		return projname;
	}

	public void setProjname(String projname) {
		this.projname = projname;
	}

	public String getAttachValue() {
		return attachValue;
	}

	public void setAttachValue(String attachValue) {
		this.attachValue = attachValue;
	}

	public String getAttachCode() {
		return attachCode;
	}

	public void setAttachCode(String attachCode) {
		this.attachCode = attachCode;
	}

	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}
	
}
