package com.sxit.tree.praser;

import com.alibaba.fastjson.JSONObject;
import com.sxit.tree.PNode;
import com.sxit.tree.config.TreeConfig;
import com.sxit.tree.extend.TreeExtend;

public abstract class TreePraser {
	
	protected JSONObject tree;
	
	protected PNode pnode;
	
	protected String idField;
	
	protected String pidField;
	
	protected String nameField;
	
	protected String textField;
	
	protected TreeConfig startConfig;
	
	protected TreeExtend treeExtend;
	
	public abstract PNode parse() throws Exception ;
	
}
