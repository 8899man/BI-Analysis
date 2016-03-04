package com.sxit.mgt.customer.dao;

import java.util.List;

import com.sxit.mgt.customer.vo.SFollowRecordModel;

public interface SFollowRecordDao {
	
	public List<SFollowRecordModel> getSFollowRecordById(long cstGUID);
}
