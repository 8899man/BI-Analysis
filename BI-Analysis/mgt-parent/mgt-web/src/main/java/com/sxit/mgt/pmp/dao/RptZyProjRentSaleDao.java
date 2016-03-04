package com.sxit.mgt.pmp.dao;

import java.util.Map;

import com.sxit.model.pmp.RptZyProjRentSale;;

/**
 * RptZyProjRentSale Mapper
 * @author Administrator
 *
 */
public interface RptZyProjRentSaleDao{
    public RptZyProjRentSale queryByAll();
	
	public RptZyProjRentSale querySeq(Map map);
	
}
