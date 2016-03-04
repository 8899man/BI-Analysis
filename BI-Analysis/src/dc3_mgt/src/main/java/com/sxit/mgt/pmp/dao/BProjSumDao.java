package com.sxit.mgt.pmp.dao;

import java.util.List;
import java.util.Map;

import com.sxit.common.pagehelper.Page;
import com.sxit.model.pmp.BProjSum;

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

	
}
