package com.sxit.mgt.system.service;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.sxit.mgt.system.dao.IndustryDao;
import com.sxit.model.system.BIndustry;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.common.pagehelper.PageHelper;

/**
 * @公司:深讯信科
 * @功能:业态 Service
 * @作者:张如兵    
 * @日期:2015-12-16 16:44:46  
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
public class IndustryService {

	@Autowired
	private IndustryDao industryDao;

	/**
	 * 新增 业态
	 **/
	@Transactional
	public int insert(BIndustry industry) {
		return industryDao.insert(industry);
	}

	/**
	 * 批量新增 业态
	 **/
	@Transactional
	public void insertList(List<BIndustry> list) {
		if(list.size()>0)
		{
			industryDao.insertList(list);
		}
		 
	}

	/**
	 * 批量修改 业态
	 **/
	@Transactional
	public void updateList(List<BIndustry> list) {
		if(list.size()>0)
		{
		 industryDao.updateList(list);
		}
	}

	/**
	 * 修改 业态
	 **/
	@Transactional
	public int update(BIndustry industry) {
		return industryDao.update(industry);
	}
	
	/**
	 * 修改业态的组织
	 * @param industry
	 * @return
	 */
	@Transactional
	public void updateOrg(BIndustry industry) {
		
		List<String> oldList = industryDao.getOrgIdList(industry.getIndustryid());
		
		List<String> newList = new ArrayList();
		
		for (String id : industry.getOrgGuidList()) {
			newList.add(id);
		}
		
		List<String> addList = new ArrayList();

		addList.addAll(newList);
		addList.removeAll(oldList);

		List<String> delList = new ArrayList();
		delList.addAll(oldList);
		delList.removeAll(newList);

		if (addList.size() > 0) {
			Map map = new HashMap();
			map.put("industryid", industry.getIndustryid());
			map.put("list", addList);
			industryDao.addIndustryOrg(map);
		}

		if (delList.size() > 0) {
			Map map = new HashMap();
			map.put("industryid", industry.getIndustryid());
			map.put("list", delList);
			industryDao.deleteIndustryOrg(map);
		}
	}
	
		/**
	 * 是否存在 业态
	 **/
	public int isHave(String industryid) {
		return industryDao.isHave(industryid);
	}

	/**
	 *  删除业态
	 **/
	@Transactional
	public int delete(String industryid){
	       return industryDao.delete(industryid);
	}


	/**
	 *  标识删除业态
	 **/
	@Transactional
	public int updateToDelete(String industryid){
	       return industryDao.updateToDelete(industryid);
	}

	/**
	 * 分页列表 业态
	 **/
	public Page<BIndustry> getIndustryList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return industryDao.getIndustryList(map);
	}

	/**
	 * 已经存在的列表 业态
	 **/
	public List<BIndustry> getHaveIndustryList(List<BIndustry> list) {
		return industryDao.getHaveIndustryList(list);
	}

	/**
	 * 根据ID获取业态
	 */
	public BIndustry getIndustryById(String industryid){
	       return industryDao.getIndustryById(industryid);
	}

	/**
	 * ID Map 业态
	 **/
	public Map<String,String> getIdMap(){
		Map<String,String> map = new HashMap();
		for(String id:industryDao.getIdList())
		{
			map.put(id, id);
		}
		return map;
	}
	
	
	public List<String> getOrgIdList(String industryid) {
		return industryDao.getOrgIdList(industryid);
	}

}


