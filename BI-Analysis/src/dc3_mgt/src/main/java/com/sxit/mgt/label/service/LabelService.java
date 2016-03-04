package com.sxit.mgt.label.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import com.sxit.mgt.label.dao.LabelDao;
import com.sxit.model.label.LableStorage;
import com.sxit.tree.PNode;
import com.sxit.tree.config.TreeConfig;
import com.sxit.tree.config.TreeStartFormNodeConfig;
import com.sxit.tree.praser.CommonTreePaser;
import com.sxit.util.SysUUID;

/**
 * @公司:深讯信科
 * @功能:标签 Service
 * @作者:dengbiao    
 * @日期:2015-10-25 22:10:23  
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = false)
public class LabelService {

	@Autowired
	private LabelDao labelDao;

	public JSONObject queryTemplate(Map parmas) {
		List<Map> templateList = labelDao.queryTemplate(parmas);
		PNode units_tree = null;
		JSONObject json = null;
		try {
			int isRoot = 1;
			JSONArray arr = (JSONArray) JSON.toJSON(templateList);
			
			TreeConfig startConfig = new TreeStartFormNodeConfig("isroot", isRoot+""); //开始条件
			CommonTreePaser treePraser = new CommonTreePaser("rootid", "pguid", "roottitle", "suptitle", arr, startConfig );
			
			units_tree = treePraser.parse();
		
			SimplePropertyPreFilter filter1 = new SimplePropertyPreFilter(PNode.class, new String[]{"id", "pid","name","text","level","isRoot","isLeaf", "value", "children"});
			json = JSONObject.parseObject(JSONObject.toJSONString(units_tree, filter1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	public void saveLabel(Map params) {
		String labelAttr = (String)params.get("labelAttr");
		String info = (String)params.get("info");
		int lableKey = (int)params.get("lableKey");
		int sys_user_id = 0;
		if (params.get("sys_user_id") != null) {
			sys_user_id = (int)params.get("sys_user_id");
		}
		
		String id = SysUUID.getUUID();
		
		List conditionSelected = (List)params.get("conditionSelected");
		for (int i=0; i<conditionSelected.size(); i++) {
			Map data = (Map)conditionSelected.get(i);
			
			String b = data.get("showSupTitle")+"";
			
			if (data.get("showSupTitle") != null && b.equals("true")) {
				String supTitle = (String)data.get("supTitle");
				String title = (String)data.get("title");
				data.put("sortTitle", supTitle + " | " + title);
				data.put("optionName", data.get("subTitle"));
			} else {
				String title = (String)data.get("title");
				data.put("sortTitle", title);
				//data.put("optionName", data.get("subTitle"));
			}
			
			data.put("labelType", "时效");
			data.put("labelAttr", labelAttr);
			data.put("info", info);
			data.put("lableKey", lableKey);
			data.put("id", id);
			data.put("createTime", new Date());
			
			labelDao.insertLabelStronge(data);
		}
	}
	
	//标签列表
		public List<LableStorage> getLableList(int lableKey){
			return labelDao.getLableList(lableKey);
		}
		
		//标签详情
		public List<LableStorage> getLable(String id, int lableKey){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("lableKey", lableKey);
			return labelDao.getLable(map);
		}
		
		//删除
		public int deleteLable(List<String> ids, int lableKey){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ids", ids);
			map.put("lableKey", lableKey);
			return labelDao.deleteLable(map);
		}
		
		//删除全部
		public int deleteLableAll(int lableKey, String userId){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("lableKey", lableKey);
			map.put("userId", userId);
			return labelDao.deleteLableAll(map);
		}
}


