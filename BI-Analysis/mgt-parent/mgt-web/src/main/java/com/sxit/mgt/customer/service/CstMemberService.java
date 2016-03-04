package com.sxit.mgt.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.customer.dao.CstMemberDao;
import com.sxit.mgt.customer.vo.BProjectModel;
import com.sxit.mgt.customer.vo.FromOPP;
import com.sxit.mgt.customer.vo.UnionTrade;
import com.sxit.model.member.CstMember;

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
public class CstMemberService {

	@Autowired
	private CstMemberDao cstMemberDao;

	/**
	 * 新增 客户画像
	 **/
	public List<CstMember> getCstMember(long oriCstGUID){
		return cstMemberDao.getCstMember(oriCstGUID);
	}
	
	public List<BProjectModel> getTradeRoomList(String productCode){
		return cstMemberDao.getTradeRoomList(productCode);
	}
	
	public List<BProjectModel> getTradeProjList(String projGUID){
		return cstMemberDao.getTradeProjList(projGUID);
	}
	
	public List<BProjectModel> getTradeBBuilding(String bldGUID){
		return cstMemberDao.getTradeBBuilding(bldGUID);
	}
	
	public List<UnionTrade> getUnionTradeBuilding(String bldGUID){
		return cstMemberDao.getUnionTradeBuilding(bldGUID);
	}
	
	public List<BProjectModel> getOppList(long cstGUID){
		return cstMemberDao.getOppList(cstGUID);
	}
	
	public int getSProductOrderCount(long cstGUID){
		return cstMemberDao.getSProductOrderCount(cstGUID);
	}
	
//	public List<FromOPP> getFromOPP(long cstGUID){
//		return cstMemberDao.getFromOPP(cstGUID);
//	}
	
	public List<String> getOppGUIDsFromOPP(long cstGUID){
		return cstMemberDao.getOppGUIDsFromOPP(cstGUID);
	}
	
	public List<FromOPP> getFromOPP(List<String> oppIds){
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("oppIds", oppIds);
		return cstMemberDao.getFromOPP(map);
	}
	
	public List<FromOPP> getFromTCstTrade(String oppGUID, String roomGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oppGUID", oppGUID);
		map.put("roomGUID", roomGUID);
		return cstMemberDao.getFromTCstTrade(map);
	}
	
	public int getFromTContract(String oppGUID, String roomGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oppGUID", oppGUID);
		map.put("roomGUID", roomGUID);
		return cstMemberDao.getFromTContract(map);
	}
}


