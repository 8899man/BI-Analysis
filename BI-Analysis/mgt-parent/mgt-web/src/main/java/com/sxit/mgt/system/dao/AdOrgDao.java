package com.sxit.mgt.system.dao;

import java.util.List;
import java.util.Map;
import com.sxit.common.pagehelper.Page;
import com.sxit.model.system.SysAdOrg;

/**
 * @公司:深讯信科
 * @功能:ad组织 Dao
 * @作者:张如兵    
 * @日期:2015-12-11 14:43:07  
 * @版本:1.0
 * @修改:
 */
 
public interface AdOrgDao {

        /**
	 *  新增ad组织
	 **/
	public int insert(SysAdOrg adOrg);
        /**
	 *  修改ad组织
	 **/
	public int update(SysAdOrg adOrg);
	
	public void updateUser(Map map);
	
	/**
	 *  批量新增ad组织
	 **/
	public void insertList(List<SysAdOrg> list);
	/**
	 *  批量更新ad组织
	 **/
	public void updateList(List<SysAdOrg> list);
	/**
	 *  是否存在ad组织
	 **/
	public int isHave(String adGuid);

	/**
	 *  删除ad组织
	 **/
	public int delete(String adGuid);

	/**
	 * 标识删除
	 */
	public int updateToDelete(String adGuid);

	/**
	 *  已经存在ad组织列表
	 **/
	public List<SysAdOrg> getHaveAdOrgList(List<SysAdOrg> list);
	/**
	 *  分页列表ad组织列表
	 **/
	public Page<SysAdOrg> getAdOrgList(Map map);

	/**
	 * 根据ID获取ad组织
	 */
	public SysAdOrg getAdOrgById(String adGuid);

	/**
	 *  ad组织ID列表
	 **/
	public List<String> getIdList();

}


