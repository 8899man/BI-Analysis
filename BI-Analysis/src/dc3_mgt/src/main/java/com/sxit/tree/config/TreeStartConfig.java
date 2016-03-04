package com.sxit.tree.config;

import com.alibaba.fastjson.JSONObject;

/**
 * 从根节点开始遍历的其实条件
 * @author kenny
 *
 */
public class TreeStartConfig extends TreeConfig {
	
	private String pidField;
	
	private String startValue;
	
	public TreeStartConfig(String pidField, String startValue) {
		this.pidField = pidField;
		this.startValue = startValue;
	}
	
	public boolean config(JSONObject json) throws Exception {
		
		if (!json.containsKey(pidField)) {
			throw new Exception();
		}
		
		String pid = json.getString(pidField);
		
		boolean b = false;
		if (pid != null && pid.equals(startValue)) {
			b = true;
		}
		
		return b;
	}

	public String getPidField() {
		return pidField;
	}

	

	public String getStartValue() {
		return startValue;
	}

	
	
	
}
