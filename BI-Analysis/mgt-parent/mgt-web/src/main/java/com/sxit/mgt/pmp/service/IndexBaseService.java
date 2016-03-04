package com.sxit.mgt.pmp.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.pmp.dao.IndexBaseDao;
import com.sxit.mgt.pmp.dao.FormatConvertDao;
import com.sxit.mgt.pmp.dao.IndexFlowDao;
import com.sxit.model.pmp.BProjSum;
import com.sxit.model.pmp.IndexBase;

/**
 * 
 * <br>
 * <b>功能：</b>IndexBaseService<br>
 * <b>作者：</b>Edson.di<br>
 * <b>日期：</b> 23 9, 2015 <br>
 * <b>版权所有： 2015，WWW.SXIT.COM.CN<br>
 */
@Service("indexBaseService")
public class IndexBaseService{
	private final static Logger log= Logger.getLogger(IndexBaseService.class);
	
	@Autowired
	private IndexBaseDao indexBaseDao;
	
	/**
	 * 新增项目汇总信息
	 **/
	@Transactional
	public void insert(IndexBase indexbase) {
		indexBaseDao.insert(indexbase);
	}
	
	/**
	 * 分页列表 项目汇总信息
	 **/
	public Page<IndexBase> getIndexBaseList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return indexBaseDao.getIndexBaseList(map);
	}
	
	/**
	 * 根据项目ID获取指标值
	 */
	public IndexBase getIndexBaseById(String pguid){
		return indexBaseDao.getIndexBaseById(pguid);
	}
	
	public IndexBase getIndexBaseCountById(String pguid){
		return indexBaseDao.getIndexBaseCountById(pguid);
	}
	
	public IndexBase getIndexWeekBaseById(String pguid){
		return indexBaseDao.getIndexWeekBaseById(pguid);
	}
	
	public IndexBase getIndexMonthBaseById(String pguid){
		return indexBaseDao.getIndexMonthBaseById(pguid);
	}
	
    public IndexBase getIndexWeekCountById(String pguid){
    	return indexBaseDao.getIndexWeekCountById(pguid);
    }
	
	public IndexBase getIndexMonthCountById(String pguid){
		return indexBaseDao.getIndexMonthCountById(pguid);
	}
	
}
