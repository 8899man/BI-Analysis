package com.sxit.mgt.label.dao;

import java.util.List;
import java.util.Map;

import com.sxit.model.label.CstLabel;
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

	
	public void insertLabelStronge(Map data);
	
	//标签列表
	public List<LableStorage> getLableList(int lableKey);
	
	//标签详情
	public List<LableStorage> getLable(Map<String, Object> map);
	
	
	public List<LableStorage> queryLabelDetail(Map<String, Object> map);
	
	//删除
	public int deleteLable(Map<String, Object> map);
	
	//删除全部标签
	public int deleteLableAll(Map<String, Object> map);

	public List<LableStorage> queryLabelList(Map<String, Object> param);
	
	
	//==============
	public List<Map> queryTemplate(Map params);
	
	public void saveLabel(Map<String, Object> param);

	public void insertFeature(Map<String, Object> data);
	
	public int deleteFeatures(Map<String, Object> map);

	public int deleteAllFeatures(Map<String, Object> map);

	public int deleteLables(Map<String, Object> labelMap);

	public int deleteAllFeaturesByUser(Map<String, Object> featureMap);
	
	public void test1();
	
	public void updateLabelQuerysql(Map param);

	public  List<CstLabel> getCustomerByLabel(Map map);
}


