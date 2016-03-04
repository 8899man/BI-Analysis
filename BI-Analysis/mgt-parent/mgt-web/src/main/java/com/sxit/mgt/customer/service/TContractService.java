package com.sxit.mgt.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.customer.dao.TContractDao;
import com.sxit.mgt.customer.vo.TContractModel;

/**
 * @公司:深讯信科
 * @功能:客户画像 Service
 * @作者:xiongj    
 * @日期:2015-09-22 10:35:59  
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
public class TContractService {

	@Autowired
	private TContractDao tContractDao;

	public List<TContractModel> getSProductOrder(long cstguid){
		return tContractDao.getSProductOrder(cstguid);
	}
	
	public List<TContractModel> getBRoom(String productCode){
		return tContractDao.getBRoom(productCode);
	}
	
	public List<TContractModel> getBProj(String projGUID){
		return tContractDao.getBProj(projGUID);
	}
	
	public List<TContractModel> getBBuilding(String bldGUID){
		return tContractDao.getBBuilding(bldGUID);
	}
	
	public List<TContractModel> getTContract(String roomGUID){
		return tContractDao.getTContract(roomGUID);
	}
	
//	public List<TContractModel> getTContractRooms(long cstGUID){
//		return tContractDao.getTContractRooms(cstGUID);
//	}
}


