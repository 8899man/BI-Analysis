package com.sxit.mgt.system.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.system.dao.SysUserDao;
import com.sxit.model.common.CheckBoxStringVo;
import com.sxit.model.common.CheckBoxVo;
import com.sxit.model.system.BaseUser;
import com.sxit.model.system.SysRole;
import com.sxit.model.system.SysUser;

/**
 * @公司:深讯信科
 * @功能:系统用户 Service
 * @作者:张如兵
 * @日期:2015-06-26 09:43:07
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
public class SysUserService {

	@Autowired
	private SysUserDao sysUserDao;

	/**
	 * 新增 系统用户
	 **/
	@Transactional
	public void insert(SysUser sysUser) {

		sysUserDao.insert(sysUser);

		List<Integer> addList = CheckBoxVo
				.getCheckedList(sysUser.getRoleList());

		if (addList != null && addList.size() > 0) {
			Map map = new HashMap();
			map.put("userId", sysUser.getUserId());
			map.put("list", addList);
			sysUserDao.addUserRole(map);
		}
	}

	/**
	 * 修改 系统用户
	 **/
	@Transactional
	public void update(SysUser sysUser, BaseUser user) {

		sysUserDao.update(sysUser);

		Map map1 = new HashMap();
		map1.put("userId", sysUser.getUserId());
		map1.put("orgId", user.getOrgId());

		List<Integer> oldList = sysUserDao.getRoleIdListByMap(map1);

		List<Integer> addList = CheckBoxVo.getAddList(oldList,
				sysUser.getRoleList());

		List<Integer> delList = CheckBoxVo.getDeleteList(oldList,
				sysUser.getRoleList());

		if (addList.size() > 0) {
			Map map = new HashMap();
			map.put("userId", sysUser.getUserId());
			map.put("list", addList);
			sysUserDao.addUserRole(map);
		}

		if (delList.size() > 0) {
			Map map = new HashMap();
			map.put("userId", sysUser.getUserId());
			map.put("list", delList);
			sysUserDao.deleteUserRole(map);
		}
	}

	@Transactional
	public void updateDataPower(SysUser sysUser, BaseUser user) {

		Map map1 = new HashMap();
		map1.put("userId", sysUser.getUserId());
		map1.put("orgId", user.getOrgId());

		//List<String> oldList = sysUserDao.getProjectIdListByMap(map1);
		List<String> list = sysUserDao.getProjectIdList(sysUser.getUserId());
		List<String> oldList = new ArrayList();
		for (String id : list) {
			if(id != null && !"".equals(id) && id.startsWith("p_")){
				oldList.add(id.replaceAll("p_", ""));
			}
		}
		
		List<String> newList = new ArrayList();
		for (String id : sysUser.getProjGuidList()) {
			if(id != null && !"".equals(id) && id.startsWith("p_")){
				newList.add(id.replaceAll("p_", ""));
			}
		}
		
		List<String> addList = new ArrayList();

		addList.addAll(newList);
		addList.removeAll(oldList);

		List<String> delList = new ArrayList();
		delList.addAll(oldList);
		delList.removeAll(newList);

		if (addList.size() > 0) {
			Map map = new HashMap();
			map.put("userId", sysUser.getUserId());
			map.put("list", addList);
			sysUserDao.addUserProject(map);
		}

		if (delList.size() > 0) {
			Map map = new HashMap();
			map.put("userId", sysUser.getUserId());
			map.put("list", delList);
			sysUserDao.deleteUserProject(map);
		}
		
		// 处理组织权限
				map1 = new HashMap();
				map1.put("userId", sysUser.getUserId());
				map1.put("orgId", user.getOrgId());
				List<String> oldOrgIdList = sysUserDao.getOrgIdListByMap(map1);

				List<String> newOrgIdList = new ArrayList();

				for (String id : sysUser.getProjGuidList()) {
					if (id != null && !"".equals(id) && id.startsWith("o_")) {
						newOrgIdList.add(id.replaceAll("o_", ""));
					}
				}

				List<String> addOrgList = new ArrayList();
				addOrgList.addAll(newOrgIdList);
				addOrgList.removeAll(oldOrgIdList);

				List<String> delOrgList = new ArrayList();
				delOrgList.addAll(oldOrgIdList);
				delOrgList.removeAll(newOrgIdList);

				if (addOrgList.size() > 0) {
					Map map = new HashMap();
					map.put("userId", sysUser.getUserId());
					map.put("list", addOrgList);
					sysUserDao.addUserOrg(map);
				}

				if (delOrgList.size() > 0) {
					Map map = new HashMap();
					map.put("userId", sysUser.getUserId());
					map.put("list", delOrgList);
					sysUserDao.deleteUserOrg(map);
				}
		
		//业态
		Map map = new HashMap();
		map.put("userId", sysUser.getUserId());
		List<String> oldIndustryList = sysUserDao.getIndustryIdListByUserId(map);

		List<String> addIndustryList = CheckBoxStringVo.getAddList(oldIndustryList,
				sysUser.getIndustryList());

		List<String> delIndustryList = CheckBoxStringVo.getDeleteList(oldIndustryList,
				sysUser.getIndustryList());

		if (addIndustryList.size() > 0) {
			map = new HashMap();
			map.put("userId", sysUser.getUserId());
			map.put("list", addIndustryList);
			sysUserDao.addUserIndustry(map);
		}

		if (delIndustryList.size() > 0) {
			 map = new HashMap();
			map.put("userId", sysUser.getUserId());
			map.put("list", delIndustryList);
			sysUserDao.deleteUserIndustry(map);
		}
		
	}
	
	/**
	 * 是否存在 系统用户
	 **/
	public int isHave(Integer userId) {
		return sysUserDao.isHave(userId);
	}

	/**
	 * 删除系统用户
	 **/
	@Transactional
	public int delete(Integer userId) {
		return sysUserDao.delete(userId);
	}

	/**
	 * 标识删除系统用户
	 **/
	@Transactional
	public int updateToDelete(Integer userId) {
		return sysUserDao.updateToDelete(userId);
	}

	/**
	 * 分页列表 系统用户
	 **/
	public Page<SysUser> getSysUserList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return sysUserDao.getSysUserList(map);
	}

	/**
	 * 角色
	 **/
	public List<SysRole> getRoleList() {
		return sysUserDao.getRoleList();
	}

	/**
	 * 角色checkbox列表
	 **/
	public List<CheckBoxVo> getRoleCheckboxList() {
		return sysUserDao.getRoleCheckboxList();
	}

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<CheckBoxVo> getRoleCheckboxListByMap(Map map) {
		return sysUserDao.getRoleCheckboxListByMap(map);
	}
	
	

	/**
	 * 根据ID获取系统用户
	 */
	public SysUser getSysUserById(Integer userId) {
		return sysUserDao.getSysUserById(userId);
	}

	public List<CheckBoxStringVo> getIndustryCheckboxListByMap() {
		return sysUserDao.getIndustryCheckboxListByMap();
	}
	
	public List<String> getIndustryIdListByUserId(Map map) {
		return sysUserDao.getIndustryIdListByUserId(map);
	}
	/**
	 * 取用户的角色列表
	 * 
	 * @param userId
	 * @return
	 */
	public List<SysRole> getRoleListByUserId(Map map) {
		return sysUserDao.getRoleListByUserId(map);
	}

	/**
	 * 取用户的角色ID列表
	 * 
	 * @param userId
	 * @return
	 */
	public List<Integer> getRoleIdListByMap(Map map) {
		return sysUserDao.getRoleIdListByMap(map);
	}
	
	
	public List<Integer> getRoleIdListByUserId(Integer userId) {
		return sysUserDao.getRoleIdListByUserId(userId);
	}

	/**
	 * 有权限的ID
	 * 
	 * @param userId
	 * @return
	 */
	public List<String> getProjectIdList(Integer userId) {
		return sysUserDao.getProjectIdList(userId);
	}

	/**
	 * ID Map 系统用户
	 **/
	public Map<String, String> getIdMap() {
		Map<String, String> map = new HashMap();
		for (String id : sysUserDao.getIdList()) {
			map.put(id, id);
		}
		return map;
	}

	public SysUser getUserByName(String username) {
		return sysUserDao.getUserByName(username);
	}

}
