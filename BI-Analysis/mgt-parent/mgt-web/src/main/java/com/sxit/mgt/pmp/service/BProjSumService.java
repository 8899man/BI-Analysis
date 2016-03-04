package com.sxit.mgt.pmp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.pmp.dao.BProjSumDao;
import com.sxit.model.pmp.BProjSum;
import com.sxit.model.system.BaseUser;
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
	public Page<BProjSum> getBProjSumList(PageVo page, Map map,String city_code) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		Map maps = new HashMap();
		maps.put("map", map);
		maps.put("city_code", city_code);
		return bProjSumDao.getBProjSumList(maps);
	}
	
	/**
	 * 分页列表 在售项目汇总信息
	 **/
	public Page<BProjSum> getBProjSumOnList(PageVo page, Map map,String city_code) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		Map maps = new HashMap();
		maps.put("map", map);
		maps.put("city_code", city_code);
		return bProjSumDao.getBProjSumOnList(maps);
	}
	
	
	/**
	 * 分页列表 已售项目汇总信息
	 **/
	public Page<BProjSum> getBProjSumEndList(PageVo page, Map map,String city_code) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		Map maps = new HashMap();
		maps.put("map", map);
		maps.put("city_code", city_code);
		return bProjSumDao.getBProjSumEndList(maps);
	}
	
	/**
	 * 根据区域ID，城市ID获取项目列表信息
	 */
	public List<BProjSum> getBProjSumById(String big_name,String city_name) {
		Map map = new HashMap();
		map.put("big_name", big_name);
		map.put("city_name", city_name);
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
	
	public List<BProjSum> queryByTop(){
		return bProjSumDao.queryByTop();
	}
	
	//区域成交金额汇总
    public List<BProjSum> queryByAreaSum(String city_code){
    	return bProjSumDao.queryByAreaSum(city_code);
    } 
    //城市公司成交金额汇总
	public List<BProjSum> queryBycityCodeSum(String area_id){
		return bProjSumDao.queryBycityCodeSum(area_id);
	}
	//项目成交金额汇总
	public List<BProjSum> queryByProjSum(String cityCode){
		return bProjSumDao.queryByProjSum(cityCode);
	}
	//根据区域id查询城市编号和名称
	public List<BProjSum> getCompanyList(String big_code){
		return bProjSumDao.getCompanyList(big_code);
	}
	
	public List<BProjSum> queryBySeqTop(String big_code,String city_code){
		Map map = new HashMap();
		map.put("big_code", big_code);
		map.put("city_code", city_code);
		return bProjSumDao.queryBySeqTop(map);
	}

	public Map retCode(HttpSession session){
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		Map result = new HashMap();
		if(user.getUserId().equals(1)){
			result = null;
		}else{
		   BProjSum b_org = bProjSumDao.querycommB_Org(user.getUserId());
		   result.put("city_code", b_org.getCity_Code());
		   result.put("big_code", b_org.getBig_code());
		}
	    return result;
	}
}
