package com.sxit.mgt.pmp.dao;

import java.util.List;
import java.util.Map;

import com.sxit.model.pmp.RptContract;

/**
 * RptContract Mapper
 * @author Administrator
 *
 */
public interface RptContractDao{
	
	/**
	 * 根据客户特征表汇总相关数据
	 */
	public List<RptContract> queryByList(Map map);
	
	public List<RptContract> queryByDistinct();

	
	
}
