package com.sxit.tree.config;

import com.alibaba.fastjson.JSONObject;

public abstract class TreeConfig {
	
	
	public abstract boolean config(JSONObject json) throws Exception;
	
}
