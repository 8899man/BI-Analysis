package com.sxit.mgt.reports.dao;

import java.util.List;
import java.util.Map;
import com.sxit.common.pagehelper.Page;
import com.sxit.model.reports.ReportCstDealMidOwn;

/**
 * @公司:深讯信科
 * @功能:标签 Dao
 * @作者:dengbiao    
 * @日期:2015-11-02 18:07:18  
 * @版本:1.0
 * @修改:
 */
 
public interface ReportsDao {

        /**
	 *  新增标签
	 **/
	public int insert(ReportCstDealMidOwn reports);
        /**
	 *  修改标签
	 **/
	public int update(ReportCstDealMidOwn reports);
	/**
	 *  批量新增标签
	 **/
	public void insertList(List<ReportCstDealMidOwn> list);
	/**
	 *  批量更新标签
	 **/
	public void updateList(List<ReportCstDealMidOwn> list);
	/**
	 *  是否存在标签
	 **/
	public int isHave(Long id);

	/**
	 *  删除标签
	 **/
	public int delete(Long id);

	/**
	 * 标识删除
	 */
	public int updateToDelete(Long id);

	/**
	 *  已经存在标签列表
	 **/
	public List<ReportCstDealMidOwn> getHaveReportsList(List<ReportCstDealMidOwn> list);
	/**
	 *  分页列表标签列表
	 **/
	public Page<ReportCstDealMidOwn> getReportsList(Map map);

	/**
	 * 根据ID获取标签
	 */
	public ReportCstDealMidOwn getReportsById(Long id);

	/**
	 *  标签ID列表
	 **/
	public List<String> getIdList();
	
	/**
	 * 获取城市码表
	 * @param _params
	 * @return
	 */
	public List<Map> coverage();
	
	public List<Map> ownerTypeData(Map params);
	
	public List<Map> getCompanyListByAreaCode(Map params);
	
	public List<Map> turnoverCustomerData(Map params);
	
	public List<Map> getPorjects(String citycode);
	
	public List<Map> getBuyTimesData(Map params);
	
	public List<Map> getRepeatBuyTiems(Map params);
	
	public List<Map> getWorkareaListByAreaCode(Map params);
}


