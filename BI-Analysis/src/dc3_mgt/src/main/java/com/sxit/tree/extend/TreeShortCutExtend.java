package com.sxit.tree.extend;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sxit.tree.PNode;
import com.sxit.tree.config.TreeStartConfig;

public class TreeShortCutExtend implements TreeExtend {
	
	private JSONArray array;
	
	private TreeStartConfig startConfig;
	
	public TreeShortCutExtend(TreeStartConfig startConfig) {
		this.array = new JSONArray();
		this.startConfig = startConfig;
	}

	public void invoke(PNode pnode) throws Exception {
		
		if (!pnode.isRoot()) {
			JSONObject node = (JSONObject)pnode.getValue();
			String pidField = startConfig.getPidField();
			String pid = node.getString(pidField);
			if (pid == null) {
				throw new Exception("The pidField is not exsit in the rowdata !");
			}
			
			int mod_leaf = node.getIntValue("mod_leaf");
			if (startConfig.config(node)) { //说明是第一个层级，则开始往下遍历
				String mod_text = node.getString("mod_text");
				node.put("launcher_path", "/"+mod_text);
			} else { 
				if (mod_leaf == 0) {
					JSONObject parent = (JSONObject)pnode.getParent().getValue();
					String  mod_text = parent.getString("mod_text");
					String parent_mod_text = parent.getString("mod_text");
					node.put("launcher_path", parent_mod_text + "/" + mod_text);
				} else if (mod_leaf == 1) {
					JSONObject parent = (JSONObject)pnode.getParent().getValue();
					String parent_mod_text = parent.getString("mod_text");
					node.put("launcher_path", parent_mod_text);
				}
			}
			array.add(node);
		}
	}

	public JSONArray getArray() {
		return array;
	}

	public TreeStartConfig getStartConfig() {
		return startConfig;
	}
	
}
