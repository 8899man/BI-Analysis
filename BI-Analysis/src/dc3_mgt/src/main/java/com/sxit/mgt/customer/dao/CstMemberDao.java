package com.sxit.mgt.customer.dao;

import java.util.List;

import com.sxit.mgt.customer.vo.BProjectModel;
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
}
