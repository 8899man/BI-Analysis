package com.sxit.mgt.system.dao;

import java.util.List;
import java.util.Map;
import com.sxit.common.pagehelper.Page;
import com.sxit.model.system.BIndustry;

/**
 * @公司:深讯信科
 * @功能:业态 Dao
 * @作者:张如兵    
 * @日期:2015-12-16 16:44:46  
 * @版本:1.0
 * @修改:
 */
 
public interface IndustryDao {

        /**
	 *  新增业态
	 **/
	public int insert(BIndustry industry);
        /**
	 *  修改业态
	 **/
	public int update(BIndustry industry);
	/**
	 *  批量新增业态
	 **/
	public void insertList(List<BIndustry> list);
	/**
	 *  批量更新业态
	 **/
	public void updateList(List<BIndustry> list);
	/**
	 *  是否存在业态
	 **/
	public int isHave(String industryid);

	/**
	 *  删除业态
	 **/
	public int delete(String industryid);

	/**
	 * 标识删除
	 */
	public int updateToDelete(String industryid);

	/**
	 *  已经存在业态列表
	 **/
	public List<BIndustry> getHaveIndustryList(List<BIndustry> list);
	/**
	 *  分页列表业态列表
	 **/
	public Page<BIndustry> getIndustryList(Map map);

	/**
	 * 根据ID获取业态
	 */
	public BIndustry getIndustryById(String industryid);

	/**
	 *  业态ID列表
	 **/
	public List<String> getIdList();
	
	/**
	 * 取业态组织的	ID
	 * @param industryid
	 * @return
	 */
	public List<String> getOrgIdList(String industryid);
	
	/**
	 * 添加业态组织
	 * @param map
	 * @return
	 */
	public int addIndustryOrg(Map map);
	
	/**
	 * 删除业态组织
	 * @param map
	 * @return
	 */
	public int deleteIndustryOrg(Map map);
	

}


