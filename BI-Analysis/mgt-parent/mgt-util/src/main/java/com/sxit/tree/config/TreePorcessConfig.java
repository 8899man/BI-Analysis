package com.sxit.tree.config;

import com.alibaba.fastjson.JSONObject;

public class TreePorcessConfig extends TreeConfig {

	private String pidField;
	
	private String startPid;
	
	public TreePorcessConfig(String pidField, String startPid) {
		this.pidField = pidField;
		this.startPid = startPid;
	}
	
	public boolean config(JSONObject json) throws Exception {
		
		return false;
	}

	public String getPidField() {
		return pidField;
	}

	

	public String getStartPid() {
		return startPid;
	}

	
	
}
