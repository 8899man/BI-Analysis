package com.sxit.tree.config;

import com.alibaba.fastjson.JSONObject;

/**
 * 从指定节点开始便利的其实条件
 * @author kenny
 *
 */
public class TreeStartFormNodeConfig extends TreeConfig {

	private String idField;
	
	private String startValue;
	
	public TreeStartFormNodeConfig(String idField, String startValue) {
		this.idField = idField;
		this.startValue = startValue;
	}
	
	public boolean config(JSONObject json) throws Exception {
		
		if (!json.containsKey(idField)) {
			throw new Exception();
		}
		
		String id = json.getString(idField);
		
		boolean b = false;
		if (id != null && id.equals(startValue)) {
			b = true;
		}
		
		return b;
	}

}
