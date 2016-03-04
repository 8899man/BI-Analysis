package com.sxit.mgt.system.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.mgt.system.dao.BOrgDao;
import com.sxit.model.system.BOrg;
import com.sxit.model.system.SysProj;

/**
 * @公司:深讯信科
 * @功能:组织 Service
 * @作者:张如兵
 * @日期:2015-11-27 16:57:02
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
public class BOrgService {

	@Autowired
	private BOrgDao bOrgDao;

	/**
	 * 新增 组织
	 **/
	@Transactional
	public int insert(BOrg bOrg) {
		return bOrgDao.insert(bOrg);
	}

	/**
	 * 批量新增 组织
	 **/
	@Transactional
	public void insertList(List<BOrg> list) {
		if (list.size() > 0) {
			bOrgDao.insertList(list);
		}

	}

	/**
	 * 批量修改 组织
	 **/
	@Transactional
	public void updateList(List<BOrg> list) {
		if (list.size() > 0) {
			bOrgDao.updateList(list);
		}
	}

	/**
	 * 修改 组织
	 **/
	@Transactional
	public int update(BOrg bOrg) {
		return bOrgDao.update(bOrg);
	}

	/**
	 * 是否存在 组织
	 **/
	public int isHave(String orgguid) {
		return bOrgDao.isHave(orgguid);
	}

	/**
	 * 删除组织
	 **/
	@Transactional
	public int delete(String orgguid) {
		return bOrgDao.delete(orgguid);
	}

	/**
	 * 标识删除组织
	 **/
	@Transactional
	public int updateToDelete(String orgguid) {
		return bOrgDao.updateToDelete(orgguid);
	}

	/**
	 * 分页列表 组织
	 **/
	public Page<BOrg> getBOrgList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return bOrgDao.getBOrgList(map);
	}

	/**
	 * 取组织
	 * @return
	 */
	public List<BOrg> getAllBOrgList(Map map) {
		return bOrgDao.getAllBOrgList(map);
	}
	
	/**
	 * 业态组织
	 * @return
	 */
	public List<BOrg> getAllBOrgListByIndustry() {
		return bOrgDao.getAllBOrgListByIndustry();
	}
	
	/**
	 * 取权限组织
	 * @return
	 */
	public List<BOrg> getAllBOrgListByPower() {
		return bOrgDao.getAllBOrgListByPower();
	}

	/**
	 * 取项目
	 * @return
	 */
	public List<SysProj> getAllProjList() {
		return bOrgDao.getAllProjList();
	}

	/**
	 * 已经存在的列表 组织
	 **/
	public List<BOrg> getHaveBOrgList(List<BOrg> list) {
		return bOrgDao.getHaveBOrgList(list);
	}

	/**
	 * 根据ID获取组织
	 */
	public BOrg getBOrgById(String orgguid) {
		return bOrgDao.getBOrgById(orgguid);
	}

	/**
	 * ID Map 组织
	 **/
	public Map<String, String> getIdMap() {
		Map<String, String> map = new HashMap();
		for (String id : bOrgDao.getIdList()) {
			map.put(id, id);
		}
		return map;
	}
	
	public List<BAreaCompany> getAreaOrCompany(Integer subType, String parentGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subType", subType);
		map.put("parentGUID", parentGUID);
		return bOrgDao.getAreaOrCompany(map);
	}
	public List<BAreaCompany> getAreaByUserId(int userId){
		return bOrgDao.getAreaByUserId(userId);
	}
	public List<BAreaCompany> getCompanyByUserId(int userId, String parentGUID){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parentGUID", parentGUID);
		map.put("userId", userId);
		return bOrgDao.getCompanyByUserId(map);
	}

}
