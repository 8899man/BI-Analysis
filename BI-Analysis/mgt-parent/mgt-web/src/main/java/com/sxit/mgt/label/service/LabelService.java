package com.sxit.mgt.label.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import com.sxit.common.mybatis.MyBatisSqlHelper;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.label.dao.LabelDao;
import com.sxit.model.label.CstLabel;
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
//			System.out.println(arr);
			TreeConfig startConfig = new TreeStartFormNodeConfig("isroot",
					isRoot + ""); // 开始条件
			CommonTreePaser treePraser = new CommonTreePaser("feaTemplateGuid", "parentguid",
					"title", "suptitle", arr, startConfig);

			units_tree = treePraser.parse();

			SimplePropertyPreFilter filter1 = new SimplePropertyPreFilter(
					PNode.class, new String[] { "id", "pid", "name", "text",
							"level", "isRoot", "isLeaf", "value", "children" });
			json = JSONObject.parseObject(JSONObject.toJSONString(units_tree,
					filter1));
			System.out.println(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	
	@Transactional
	public void saveLabel(Map params) throws Exception {
		String label_name = (String) params.get("label_name");
		String label_info = (String) params.get("label_info");
		int isNet = (int) params.get("isNet");
//		int sys_user_id = 0;
//		if ( != null) {
//			sys_user_id = (int) params.get("creatorguid");
//		}
		
		Map<String, Object> label = new HashMap<String, Object>();
		String id = SysUUID.getUUID();
		label.put("label_guid", id);
		label.put("createTime", new Date());
		label.put("label_name", label_name);
		label.put("label_info", label_info);
		label.put("isNet", isNet);
		label.put("label_type", "0");
		label.put("creatorguid", params.get("creatorguid"));
		
		labelDao.saveLabel(label); //保存标签

		List conditionSelected = (List) params.get("conditionSelected");
		List conditionSelectedForQureysql = new ArrayList();
		for (int i = 0; i < conditionSelected.size(); i++) {
			Map data = (Map) conditionSelected.get(i);

			String b = data.get("showSupTitle") + "";

			if (data.get("showSupTitle") != null && b.equals("true")) {
				String supTitle = (String) data.get("supTitle");
				String title = (String) data.get("title");
				data.put("featureTitle", supTitle + " | " + title);
				data.put("optionName", data.get("subTitle"));
			} else {
				String title = (String) data.get("title");
				data.put("featureTitle", title);
				// data.put("optionName", data.get("subTitle"));
			}

			data.put("featureType", "时效");
			data.put("labelname", label_name);
			data.put("labelinfo", label_info);
			data.put("isNet", isNet);
			data.put("labelguid", id);
			data.put("createTime", new Date());
			data.put("templateguid", "");
			
			conditionSelectedForQureysql.add(data);
			labelDao.insertFeature(data);
		}
		
		Map querySqlParam = dealConditions(conditionSelectedForQureysql);
		querySqlParam.put("label_guid", id);
		querySqlParam.put("label_name", label_name);
		
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory)wac.getBean("sqlSessionFactory");
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String sql =  MyBatisSqlHelper.getNamespaceSql(  
                sqlSession,
                "com.sxit.mgt.label.dao.LabelDao.labeQuerySql", querySqlParam);
		
		Map param = new HashMap();
		param.put("querySql", sql);
		param.put("label_guid", id);
		param.put("label_name", label_name);
		labelDao.updateLabelQuerysql(param);
	}

	
	
	private Map dealConditions(List conditionSelectedForQureysql) {
		Map params = new HashMap();
		List<Map> tables = new ArrayList<Map>();
		for (int i=0; i<conditionSelectedForQureysql.size(); i++) {
			Map<String, Object> data = (Map<String, Object>)conditionSelectedForQureysql.get(i);
 			String tableName = (String)data.get("tableName");
			
			int _tableIndex = indexOfMapFea(tables, "tableName", tableName);
			if (_tableIndex < 0) {
				Map table = new HashMap();
				table.put("tableName", tableName);
				List<Map> conditions = new ArrayList<Map>();
				conditions.add(data);
				table.put("conditions", conditions);
				tables.add(table);
			} else {
				Map table = tables.get(_tableIndex);
				((List<Map>)table.get("conditions")).add(data);
			}
		}
		params.put("tables", tables);
		params.put("tablesLength", tables.size());
		return params;
	}
	
	private int indexOfMapFea(List<Map> list, String key, String value) {
		int retValue = -1;
		for (int i=0; i<list.size(); i++) {
			Map map = list.get(i);
			String _value = (String)map.get(key);
			
			if (!map.containsKey(key) || _value == null) {
				
			} else if (_value.equals(value)) {
				retValue = i;
				break;
			}
		}
		
		return retValue;
	}

	
	// 标签列表
	public List<LableStorage> getLableList(int lableKey) {
		return labelDao.getLableList(lableKey);
	}
	
	// 标签列表
	public List<LableStorage> getLableList(String isNet, String creatorguid) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("isNet", isNet);
		param.put("creatorguid", creatorguid);
		return labelDao.queryLabelList(param);
	}

	// 标签详情
	public List<LableStorage> getLable(String id, int lableKey) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("lableKey", lableKey);
		return labelDao.getLable(map);
	}
	
	// 标签详情
	public List<LableStorage> getLableDetail(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("labelguid", id);
		return labelDao.queryLabelDetail(map);
	}

//	// 删除
//	public int deleteLable(List<String> ids, int lableKey) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("ids", ids);
//		map.put("lableKey", lableKey);
//		return labelDao.deleteLable(map);
//	}
	
	@Transactional
	public int deleteLabels(List<String> ids, String isNet) {
		Map<String, Object> labelMap = new HashMap<String, Object>();
		labelMap.put("ids", ids);
		labelMap.put("isNet", isNet);
		labelMap.put("creatorguid", "1"); //后面要传进来
		
		int num = -1;
		if (labelDao.deleteLables(labelMap) > 0) {
			
			Map<String, Object> featureMap = new HashMap<String, Object>();
			featureMap.put("ids", ids);
			num = labelDao.deleteFeatures(featureMap);
		}
		return num;
	}
	
	/**
	 * 
	 * @param ids
	 * @param isNet
	 * @return
	 */
	@Transactional
	public int deleteFeatures(List<String> ids, String isNet) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ids", ids);
		map.put("isNet", isNet);
		return labelDao.deleteFeatures(map);
	}

//	// 删除全部
//	public int deleteLableAll(int lableKey, String userId) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("lableKey", lableKey);
//		map.put("userId", userId);
//		return labelDao.deleteLableAll(map);
//	}
	
	@Transactional
	public int deleteAllFeatures(String isNet, String userguid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isNet", isNet);
		map.put("userguid", userguid);
		return labelDao.deleteAllFeatures(map);
	}

	@Transactional
	public int deleteAllLabels(String isNet, Object object) {
		Map<String, Object> labelMap = new HashMap<String, Object>();
		labelMap.put("isNet", isNet);
		labelMap.put("creatorguid", "1"); //后面要传进来
		
		Map<String, Object> featureMap = new HashMap<String, Object>();
		featureMap.put("isNet", isNet);
		labelMap.put("creatorguid", "1"); //后面要传进来
		
		int num = -1;
		if (labelDao.deleteAllFeaturesByUser(featureMap) > 0) {
			num = labelDao.deleteLables(labelMap);
		}
		return num;
	}


	public List<CstLabel> getCustomerByLabel(PageVo page, Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return labelDao.getCustomerByLabel(map);
	}
}
