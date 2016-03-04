package com.sxit.mgt.customer.dao;

import java.util.List;

import com.sxit.mgt.customer.vo.TContractModel;

public interface TContractDao {

	public List<TContractModel> getSProductOrder(long cstGUID);
	
	public List<TContractModel> getBRoom(String productCode);
	
	public List<TContractModel> getBProj(String projGUID);
	
	public List<TContractModel> getBBuilding(String bldGUID);
	
	public List<TContractModel> getTContract(String roomGUID);
	
//	public List<TContractModel> getTContractRooms(long cstGUID);
}
