package com.sxit.mgt.system.dao;

import java.util.List;
import java.util.Map;

import com.sxit.common.pagehelper.Page;
import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.model.system.BOrg;
import com.sxit.model.system.SysProj;

/**
 * @公司:深讯信科
 * @功能:组织 Dao
 * @作者:张如兵
 * @日期:2015-11-27 16:57:02
 * @版本:1.0
 * @修改:
 */

public interface BOrgDao {

	/**
	 * 新增组织
	 **/
	public int insert(BOrg bOrg);

	/**
	 * 修改组织
	 **/
	public int update(BOrg bOrg);

	/**
	 * 批量新增组织
	 **/
	public void insertList(List<BOrg> list);

	/**
	 * 批量更新组织
	 **/
	public void updateList(List<BOrg> list);

	/**
	 * 是否存在组织
	 **/
	public int isHave(String orgguid);

	/**
	 * 删除组织
	 **/
	public int delete(String orgguid);

	/**
	 * 标识删除
	 */
	public int updateToDelete(String orgguid);

	/**
	 * 已经存在组织列表
	 **/
	public List<BOrg> getHaveBOrgList(List<BOrg> list);

	/**
	 * 
	 * @return
	 */
	public List<BOrg> getAllBOrgList(Map map);
	
	public List<BOrg> getAllBOrgListByIndustry();
	
	public List<BOrg> getAllBOrgListByPower();

	/**
	 * 
	 * @return
	 */
	public List<SysProj> getAllProjList();

	/**
	 * 分页列表组织列表
	 **/
	public Page<BOrg> getBOrgList(Map map);

	/**
	 * 根据ID获取组织
	 */
	public BOrg getBOrgById(String orgguid);

	/**
	 * 组织ID列表
	 **/
	public List<String> getIdList();
	
	public List<BAreaCompany> getAreaOrCompany(Map<String, Object> map);
	
	public List<BAreaCompany> getAreaByUserId(int userId);
	public List<BAreaCompany> getCompanyByUserId(Map<String, Object> map);

}
