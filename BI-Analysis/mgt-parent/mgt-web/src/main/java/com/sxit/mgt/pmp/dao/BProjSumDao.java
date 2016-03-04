package com.sxit.mgt.pmp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sxit.common.pagehelper.Page;
import com.sxit.model.pmp.BProjSum;
import com.sxit.model.pmp.RptProjComplete;
import com.sxit.model.system.BaseUser;

/**
 * @公司:深讯信科
 * @功能:BProjSum Dao
 * @作者:Edson.di   
 * @日期:2015-09-23 09:43:07  
 * @版本:1.0
 * @修改:
 */
public interface BProjSumDao{
	/**
	 *  分页统计全部项目汇总列表
	 **/
	public Page<BProjSum> getBProjSumList(Map map);
	
	/**
	 *  分页统计在售项目汇总列表
	 **/
	public Page<BProjSum> getBProjSumOnList(Map map);
	
	/**
	 *  分页统计已售项目汇总列表
	 **/
	public Page<BProjSum> getBProjSumEndList(Map map);
	
	/**
	 * 根据区域ID，城市ID获取项目列表信息
	 */
	public List<BProjSum> getBProjSumByIds(Map map);
	
	/**
	 * 根据区域ID，城市ID获取项目列表信息
	 */
	public BProjSum getBProjSumById(String proj_guid);
	
    /**
	 *  新增项目汇总
	 **/
	public int insert(BProjSum bprojsum);
	
	/**
	 *  总项目数
	 **/
	public int queryByCount();
	
	
	public List<BProjSum> getAreas();
	
	public List<BProjSum> getcityCodes();
	
	public List<BProjSum> queryByTop();
	
	public List<BProjSum> queryBySeqTop(Map map);
	
	public List<BProjSum> queryByAreaSum(String city_code); //区域成交金额汇总
	
	public List<BProjSum> queryBycityCodeSum(String area_id); //城市公司成交金额汇总
	
	public List<BProjSum> queryByProjSum(String cityCode); //项目成交金额汇总
	
	public List<BProjSum> getCompanyList(String big_code); //根据区域id查询城市编号和名称
	
	public BProjSum querycommB_Org(Integer user_id); //获取组织city_code
}
