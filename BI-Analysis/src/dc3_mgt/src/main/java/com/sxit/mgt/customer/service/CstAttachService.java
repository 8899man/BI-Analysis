package com.sxit.mgt.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.sxit.mgt.customer.dao.CstAttachDao;
import com.sxit.model.customer.CstAttach;

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
public class CstAttachService {

	@Autowired
	private CstAttachDao cstAttachDao;

	/**
	 * 新增 客户画像
	 **/
	public List<CstAttach> getCstAttachValues(long cstguid, String projGUID, String attachCode, String tab){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cstguid", cstguid);
		if(projGUID != null && !"".equals(projGUID)){
			map.put("projGUID", projGUID);
		}
		if(attachCode != null && !"".equals(attachCode)){
			map.put("attachCode", attachCode);
		}
		if(tab != null && !"".equals(tab)){
			map.put("tabname", tab);
		}
		return cstAttachDao.getCstAttachValues(map);
	}
	
//	public List<String> getProjs(String cstguid){
//		return cstAttachDao.getProjs(cstguid);
//	}
}


