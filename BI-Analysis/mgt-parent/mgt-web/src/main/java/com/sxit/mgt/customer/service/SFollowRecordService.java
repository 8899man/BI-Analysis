package com.sxit.mgt.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.mgt.customer.dao.SFollowRecordDao;
import com.sxit.mgt.customer.vo.SFollowRecordModel;

@Service
@Transactional(readOnly = true)
public class SFollowRecordService {

	@Autowired
	private SFollowRecordDao sfollowRecordDao;
	
	public List<SFollowRecordModel> getSFollowRecordById(long cstGUID){
		return sfollowRecordDao.getSFollowRecordById(cstGUID);
	}
}
