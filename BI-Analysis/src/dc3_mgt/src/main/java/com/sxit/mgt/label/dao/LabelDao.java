package com.sxit.mgt.label.dao;

import java.util.List;
import java.util.Map;

import com.sxit.common.pagehelper.Page;
import com.sxit.model.label.LabellocalDetails;
import com.sxit.model.label.LableStorage;

/**
 * @公司:深讯信科
 * @功能:标签 Dao
 * @作者:dengbiao    
 * @日期:2015-10-25 22:10:23  
 * @版本:1.0
 * @修改:
 */
 
public interface LabelDao {

	public List<Map> queryTemplate(Map params);
	
	public void insertLabelStronge(Map data);
	
	//标签列表
	public List<LableStorage> getLableList(int lableKey);
	
	//标签详情
	public List<LableStorage> getLable(Map<String, Object> map);
	
	//删除
	public int deleteLable(Map<String, Object> map);
	
	//删除全部标签
	public int deleteLableAll(Map<String, Object> map);
}


