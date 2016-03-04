package com.sxit.tree.extend;

import java.util.ArrayList;
import java.util.List;

import com.sxit.tree.PNode;

public class TreeIdStrExtend implements TreeExtend {
	
	private List<String> idStr;
	
	private boolean exceptRoot;
	
	public TreeIdStrExtend() {
		idStr = new ArrayList<String>();
	}
	
	public TreeIdStrExtend(boolean exceptRoot) {
		idStr = new ArrayList<String>();
		this.exceptRoot = exceptRoot;
	}
	
	
	public void invoke(PNode pnode) throws Exception {
		if (exceptRoot) {
			if (!pnode.isLeaf()) {
				StringBuffer sb = new StringBuffer();
				sb.append("'");
				sb.append(pnode.getId());
				sb.append("'");
				
				idStr.add(sb.toString());
			}
		}
	}
	
	
	public String getIdStringForSql() {
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<idStr.size(); i++) {
			sb.append(i == idStr.size()-1 ? idStr.get(i) : idStr.get(i) + ",");
		}
		return sb.toString();
	}
}
