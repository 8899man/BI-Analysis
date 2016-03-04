package com.sxit.mgt.system.service;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;






import com.sxit.mgt.system.dao.FunctionDao;
import com.sxit.model.common.CheckBoxVo;
import com.sxit.model.system.SysFunction;
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.common.pagehelper.PageHelper;

/**
 * @公司:深讯信科
 * @功能:系统功能 Service
 * @作者:张如兵    
 * @日期:2015-06-17 16:45:33  
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
public class FunctionService {

	@Autowired
	private FunctionDao functionDao;

	/**
	 * 新增 系统功能
	 **/
	@Transactional
	public int insert(SysFunction function) {
		return functionDao.insert(function);
	}

	/**
	 * 批量新增 系统功能
	 **/
	@Transactional
	public void insertList(List<SysFunction> list) {
		if(list.size()>0)
		{
			functionDao.insertList(list);
		}
		 
	}

	/**
	 * 批量修改 系统功能
	 **/
	@Transactional
	public void updateList(List<SysFunction> list) {
		if(list.size()>0)
		{
		 functionDao.updateList(list);
		}
	}

	/**
	 * 修改 系统功能
	 **/
	@Transactional
	public int update(SysFunction function) {
		return functionDao.update(function);
	}
	
	/**
	 * 修改 系统功能
	 **/
	@Transactional
	public void updateFunctionAndRole(SysFunction function,String orgId) {
		functionDao.update(function);
		
		Map map1 = new HashMap();

		map1.put("orgId", orgId);
		
		map1.put("functionId", function.getFunctionId());
				
		List<Integer> oldList = functionDao.getRoleIdListByFunction(map1);

		List<Integer> addList = CheckBoxVo.getAddList(oldList,
				function.getRoleList());

		List<Integer> delList = CheckBoxVo.getDeleteList(oldList,
				function.getRoleList());
		

		if (addList.size() > 0) {
			Map map = new HashMap();
			map.put("functionId", function.getFunctionId());
			map.put("list", addList);
			functionDao.addFunctionRole(map);
		}

		if (delList.size() > 0) {
			Map map = new HashMap();
			map.put("functionId", function.getFunctionId());
			map.put("list", delList);
			functionDao.deleteFunctionRole(map);
		}
		//return functionDao.update(function);
	}
	
	

	/**
	 * 是否存在 系统功能
	 **/
	public int isHave(Integer functionId) {
		return functionDao.isHave(functionId);
	}

	/**
	 *  删除系统功能
	 **/
	@Transactional
	public int delete(Integer functionId){
	       return functionDao.delete(functionId);
	}


	/**
	 *  标识删除系统功能
	 **/
	@Transactional
	public int updateToDelete(Integer functionId){
	       return functionDao.updateToDelete(functionId);
	}

	/**
	 * 分页列表 系统功能
	 **/
	public Page<SysFunction> getFunctionList(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return functionDao.getFunctionList(map);
	}

	/**
	 * 已经存在的列表 系统功能
	 **/
	public List<SysFunction> getAllFunctionList() {
		return functionDao.getAllFunctionList();
	}
	
	public List<SysFunction> getFunctionListByUser(Integer userId) {
		return functionDao.getFunctionListByUser(userId);
	}
	
	
	public List<CheckBoxVo> getRoleCheckboxListByMap(Map map) {
		return functionDao.getRoleCheckboxListByMap(map);
	}
	
	public List<Integer> getRoleIdListByFunction(Map map) {
		return functionDao.getRoleIdListByFunction(map);
	}

	/**
	 * 根据ID获取系统功能
	 */
	public SysFunction getFunctionById(Integer functionId){
	       return functionDao.getFunctionById(functionId);
	}

	/**
	 * ID Map 系统功能
	 **/
	public Map<String,String> getIdMap(){
		Map<String,String> map = new HashMap();
		for(String id:functionDao.getIdList())
		{
			map.put(id, id);
		}
		return map;
	}

}


