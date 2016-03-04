package com.sxit.mgt.customer.dao;

import java.util.List;
import java.util.Map;

import com.sxit.mgt.customer.vo.BProjectModel;
import com.sxit.mgt.customer.vo.FromOPP;
import com.sxit.mgt.customer.vo.UnionTrade;
import com.sxit.model.member.CstMember;

public interface CstMemberDao {

	public List<CstMember> getCstMember(long cstGUID);
	
	public List<BProjectModel> getTradeRoomList(String productCode);
	
	public List<BProjectModel> getTradeProjList(String projGUID);
	
	public List<BProjectModel> getTradeBBuilding(String bldGUID);
	
	public List<UnionTrade> getUnionTradeBuilding(String bldGUID);
	
	public List<BProjectModel> getOppList(long cstGUID);
	
	public int getSProductOrderCount(long cstGUID);
	
	public List<String> getOppGUIDsFromOPP(long cstGUID);
	
	public List<FromOPP> getFromOPP(Map<String, Object> map);
	
	public List<FromOPP> getFromTCstTrade(Map<String, Object> map);
	
	public int getFromTContract(Map<String, Object> map);
}
