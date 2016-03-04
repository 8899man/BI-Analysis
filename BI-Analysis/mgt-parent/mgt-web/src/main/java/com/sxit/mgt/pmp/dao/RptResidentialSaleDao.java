package com.sxit.mgt.pmp.dao;

import java.util.Map;

import com.sxit.model.pmp.RptResidentialSale;

/**
 * RptResidentialSale Mapper
 * @author Administrator
 *
 */
public interface RptResidentialSaleDao{
	public RptResidentialSale queryByAll();
	
	public RptResidentialSale querySeq(Map map);
	
}
