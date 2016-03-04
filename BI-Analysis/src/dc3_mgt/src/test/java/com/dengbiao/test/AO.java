package com.dengbiao.test;

import java.util.Map;

public abstract class AO {
	
	private Map<String, Object> k_v;
	
	public AO ao;
	
	public void setK_V(AO _ao) {
		k_v.putAll(_ao.k_v);
		this.ao = _ao;
	}
	
	public String getK_V() { //还没写完
		return ao.toString();
	}
	
	
}
