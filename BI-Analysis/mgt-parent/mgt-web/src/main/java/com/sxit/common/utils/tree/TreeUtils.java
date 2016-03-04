package com.sxit.common.utils.tree;

import java.util.List;

public class TreeUtils {
	
	/**
	 * 构建树
	 * @param nodelist
	 * @return
	 */
	public static List<StringNode> getStringTree(List<StringNode> nodelist){
		StringTree tree = new StringTree();
		return tree.getTree(nodelist);
	}
	
	/**
	 * 构建树的列表
	 * @param nodelist
	 * @return
	 */
	public static List<StringNode> getStringTreeList(List<StringNode> nodelist){
		StringTree tree = new StringTree();
		return tree.getTreeList(nodelist);
	}

	/**
	 * 构建树
	 * @param nodelist
	 * @return
	 */
	public static List<IntegerNode> getIntegerTree(List<IntegerNode> nodelist){
		IntegerTree tree = new IntegerTree();
		return tree.getTree(nodelist);
	}
	
	/**
	 * 构建树的列表
	 * @param nodelist
	 * @return
	 */
	public static List<IntegerNode> getIntegerTreeList(List<IntegerNode> nodelist){
		IntegerTree tree = new IntegerTree();
		return tree.getTreeList(nodelist);
	}
	
}
