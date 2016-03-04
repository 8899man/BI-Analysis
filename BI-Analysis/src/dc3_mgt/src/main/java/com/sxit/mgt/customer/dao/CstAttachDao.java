package com.sxit.mgt.customer.dao;

import java.util.List;
import java.util.Map;

import com.sxit.model.customer.CstAttach;

public interface CstAttachDao {

	public List<CstAttach> getCstAttachValues(Map<String, Object> map);
	
}
