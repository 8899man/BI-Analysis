package com.sxit.mgt.pmp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.pmp.dao.BProjSumDao;
import com.sxit.model.pmp.BProjSum;
/**
 * 
 * <br>
 * <b>功能：</b>BProjSumService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> 23 9, 2015 <br>
 * <b>版权所有： 2015，WWW.SXIT.COM.CN<br>
 */
@Service("bProjSumService")
@Transactional(readOnly = true)
public class BProjSumService{
	private final static Logger log= Logger.getLogger(BProjSumService.class);
	
	@Autowired
	private BProjSumDao bProjSumDao;

	/**
	 * 新增项目汇总信息
	 **/
	@Transactional
	public void insert(BProjSum bprojsum) {
		bProjSumDao.insert(bprojsum);
	}
	
	/**
	 * 分页列表 项目汇总信息
	 **/
	public Page<BProjSum> getBProjSumList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return bProjSumDao.getBProjSumList(map);
	}
	
	/**
	 * 分页列表 在售项目汇总信息
	 **/
	public Page<BProjSum> getBProjSumOnList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return bProjSumDao.getBProjSumOnList(map);
	}
	
	
	/**
	 * 分页列表 已售项目汇总信息
	 **/
	public Page<BProjSum> getBProjSumEndList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return bProjSumDao.getBProjSumEndList(map);
	}
	
	/**
	 * 根据区域ID，城市ID获取项目列表信息
	 */
	public List<BProjSum> getBProjSumById(String area_id,String cityCode) {
		Map map = new HashMap();
		map.put("area_id", area_id);
		map.put("cityCode", cityCode);
		return bProjSumDao.getBProjSumByIds(map);
	}
	
	/**
	 * 根据项目ID 查询项目信息
	 */
	public BProjSum getBProjSumById(String proj_guid) {
		return bProjSumDao.getBProjSumById(proj_guid);
	}
	
	public int queryByCount(){
		return bProjSumDao.queryByCount();
	}
	
    public List<BProjSum> getAreas(){
    	return bProjSumDao.getAreas();
    }
	
	public List<BProjSum> getcityCodes(){
		return bProjSumDao.getcityCodes();
	}
}
