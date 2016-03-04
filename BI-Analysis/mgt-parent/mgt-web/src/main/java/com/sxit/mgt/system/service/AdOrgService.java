package com.sxit.mgt.system.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.system.dao.AdOrgDao;
import com.sxit.mgt.system.dao.BOrgDao;
import com.sxit.model.system.BOrg;
import com.sxit.model.system.SysAdOrg;

/**
 * @公司:深讯信科
 * @功能:ad组织 Service
 * @作者:张如兵
 * @日期:2015-12-11 14:43:07
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
public class AdOrgService {

	@Autowired
	private AdOrgDao adOrgDao;

	@Autowired
	private BOrgDao bOrgDao;

	/**
	 * 新增 ad组织
	 **/
	@Transactional
	public int insert(SysAdOrg adOrg) {
		return adOrgDao.insert(adOrg);
	}

	/**
	 * 批量新增 ad组织
	 **/
	@Transactional
	public void insertList(List<SysAdOrg> list) {
		if (list.size() > 0) {
			adOrgDao.insertList(list);
		}

	}

	/**
	 * 批量修改 ad组织
	 **/
	@Transactional
	public void updateList(List<SysAdOrg> list) {
		if (list.size() > 0) {
			adOrgDao.updateList(list);
		}
	}

	/**
	 * 修改 ad组织
	 **/
	@Transactional
	public int update(SysAdOrg adOrg) {
		return adOrgDao.update(adOrg);
	}

	@Transactional
	public int checkOk(SysAdOrg adOrg) {

		if (StringUtils.isNotBlank(adOrg.getOrgGuid())) {
			BOrg borg = bOrgDao.getBOrgById(adOrg.getOrgGuid());

			if (borg != null) {
				HashMap map = new HashMap();

				map.put("orgguid", borg.getOrgguid());
				map.put("orgname", borg.getOrgname());
				map.put("adGuid", adOrg.getAdGuid());
				adOrgDao.updateUser(map);
			}
		}

		return adOrgDao.update(adOrg);
	}

	/**
	 * 是否存在 ad组织
	 **/
	public int isHave(String adGuid) {
		return adOrgDao.isHave(adGuid);
	}

	/**
	 * 删除ad组织
	 **/
	@Transactional
	public int delete(String adGuid) {
		return adOrgDao.delete(adGuid);
	}

	/**
	 * 标识删除ad组织
	 **/
	@Transactional
	public int updateToDelete(String adGuid) {
		return adOrgDao.updateToDelete(adGuid);
	}

	/**
	 * 分页列表 ad组织
	 **/
	public Page<SysAdOrg> getAdOrgList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return adOrgDao.getAdOrgList(map);
	}

	/**
	 * 已经存在的列表 ad组织
	 **/
	public List<SysAdOrg> getHaveAdOrgList(List<SysAdOrg> list) {
		return adOrgDao.getHaveAdOrgList(list);
	}

	/**
	 * 根据ID获取ad组织
	 */
	public SysAdOrg getAdOrgById(String adGuid) {
		return adOrgDao.getAdOrgById(adGuid);
	}

	/**
	 * ID Map ad组织
	 **/
	public Map<String, String> getIdMap() {
		Map<String, String> map = new HashMap();
		for (String id : adOrgDao.getIdList()) {
			map.put(id, id);
		}
		return map;
	}

}
