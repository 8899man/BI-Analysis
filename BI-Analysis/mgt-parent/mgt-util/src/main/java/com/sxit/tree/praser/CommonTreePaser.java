package com.sxit.tree.praser;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sxit.tree.PNode;
import com.sxit.tree.config.TreeConfig;
import com.sxit.tree.extend.TreeExtend;

/**
 * 将数据列表，根据父子关系，转换为PNode 结构
 * @author kenny
 *
 */
public class CommonTreePaser extends TreePraser {

	private JSONArray nodeArray;
	
	public CommonTreePaser(String idField, String pidField, String nameField, String textField, JSONArray nodeArray, TreeConfig startConfig) {
		this.idField = idField;
		this.pidField = pidField;
		this.nameField = nameField;
		this.textField = textField;
		this.nodeArray = nodeArray;
		this.startConfig = startConfig;
		
		this.tree = new JSONObject();
		this.pnode = new PNode("root", "root", null, true);
		pnode.setParent(null); //初始化，将首节点parent只是为null，表示当前节点是根节点
	}
	
	public PNode parse() throws Exception {
		
		if (treeExtend != null) {
			treeExtend.invoke(this.pnode);
		}
		
		JSONArray tmp = new JSONArray();
		for (int i=0; i<nodeArray.size(); i++) {
			JSONObject node = nodeArray.getJSONObject(i);
			
			if (!node.containsKey(idField) || !node.containsKey(pidField)) {
				throw new Exception("idField or pidField is not contain in the nodeArray !");
			}
			
			
			//根据其实配置，判断第一轮
			if (startConfig.config(node)) {
				PNode child = praseToPNode(node);
				child.setParent(pnode);
				pnode.addChild(child);
				tmp.add(node);
			}
			
		}
		
		
		nodeArray.removeAll(tmp);
		
		for (int c=0; c<pnode.getChildren().size(); c++) {
			PNode child = pnode.getChildren().get(c);
			goPraser(child);
		}
		
		return pnode;
	}
	
	
	private PNode praseToPNode(JSONObject node) {
		PNode pnode = new PNode();
		pnode.setId( node.getString(idField) );
		pnode.setPid( node.getString(pidField) );
		pnode.setName( node.getString(nameField) );
		pnode.setText( node.getString(textField) );
		pnode.setValue(node);
		return pnode;
	}
	
	
	private void goPraser(PNode child) throws Exception {
		if (treeExtend != null) {
			treeExtend.invoke(child);
		}
		
		JSONObject child_json = (JSONObject)child.getValue();
		String child_json_id = child_json.getString(idField);
		
		JSONArray tmp = new JSONArray();
		for (int i=0; i<nodeArray.size(); i++) {
			JSONObject node = nodeArray.getJSONObject(i);
			
			String pid = node.getString(pidField);
			
			if (pid != null && child_json_id.equals(pid)) {
				PNode __child = praseToPNode(node);
				__child.setParent(child);
				child.addChild(__child);
				tmp.add(node);
			}
			
			
		}
		nodeArray.removeAll(tmp);
		for (int c=0; c<child.getChildren().size(); c++) {
			PNode __child = child.getChildren().get(c);
			goPraser(__child);
		}
	}
	
	
	public void setTreeExtend(TreeExtend treeExtend) {
		this.treeExtend = treeExtend;
	}
	
	public TreeExtend getTreeExtend() {
		return treeExtend;
	}
}
