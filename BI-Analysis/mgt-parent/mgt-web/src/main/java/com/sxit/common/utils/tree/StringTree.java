package com.sxit.common.utils.tree;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.sxit.mgt.system.dto.OrgNode;

/**
 * 使用深度优先算法构建树
 * @author agu
 *
 */
public class StringTree {

	private List<StringNode> nodeList;

	private List<StringNode> tree;
	
	private List<StringNode> treeList;
	
	public StringTree() {
		super();
		// TODO Auto-generated constructor stub
	}


	public List<StringNode> getTree(List<StringNode> nodeList) {
		this.nodeList = new ArrayList();
		
		this.nodeList.addAll(nodeList);
	
		buildTree();
		return tree;
	}
	
	public List<StringNode> getTreeList(List<StringNode> nodeList) {
		this.nodeList = new ArrayList();
		this.nodeList.addAll(nodeList);
		buildTreeList();
		return treeList;
	}
	
	/**
	 * 构建树 层次
	 */
	private void buildTree() {
		if (nodeList != null) {
		}

		tree = new ArrayList<StringNode>();

		Set<String> setids = new HashSet<String>();
		Set<String> setpids = new HashSet<String>();

		for (StringNode node : nodeList) {
			setids.add(node.getId());
			if (node.getParentId() != null
					&& !setpids.contains(node.getParentId())) {
				setpids.add(node.getParentId());
			}
		}

		setpids.removeAll(setids);

		for (StringNode node : nodeList) {
			if (node.getParentId() == null
					|| setpids.contains(node.getParentId())) {
				tree.add(node);
			}
		}

		nodeList.removeAll(tree);

		for (StringNode node : tree) {
			node.addLevel(0);
			buildChild(node);
		}
	}
	
	/**
	 * 构建子
	 * @param node
	 */
	private void buildChild(StringNode node) {
		List<StringNode> tempList = new ArrayList(nodeList);
		Iterator<StringNode> iterator = tempList.iterator();
		while (iterator.hasNext()) {
			StringNode inode = iterator.next();
			//System.out.println("id:" + inode.getId());
			if (node.getId().equals(inode.getParentId())) {
				nodeList.remove(inode);
				inode.addLevel(node.getLevel());
				node.addChild(inode);
				//System.out.println("=======id:" + inode.getId());
				buildChild(inode);
			}
		}
	}

	/**
	 * 构建树状列表 非层次
	 */
	private void buildTreeList() {
		if (nodeList != null) {
		}

		tree = new ArrayList<StringNode>();
		
		treeList = new ArrayList<StringNode>();

		Set<String> setids = new HashSet<String>();
		Set<String> setpids = new HashSet<String>();

		for (StringNode node : nodeList) {
			setids.add(node.getId());
			if (node.getParentId() != null
					&& !setpids.contains(node.getParentId())) {
				setpids.add(node.getParentId());
			}
		}

		setpids.removeAll(setids);

		for (StringNode node : nodeList) {
			if (node.getParentId() == null
					|| setpids.contains(node.getParentId())) {
				tree.add(node);
			}
		}

		nodeList.removeAll(tree);

		for (StringNode node : tree) {
			node.addLevel(0);
			treeList.add(node);
			addToTree(node);
		}
	}
	
	private void addToTree(StringNode node) {
		//treeList.add(node);
		List<StringNode> tempList = new ArrayList(nodeList);
		Iterator<StringNode> iterator = tempList.iterator();
		while (iterator.hasNext()) {
			StringNode inode = iterator.next();
			//System.out.println("id:" + inode.getId());
			if (node.getId().equals(inode.getParentId())) {
				nodeList.remove(inode);
				inode.addLevel(node.getLevel());
				//System.out.println("=======id:" + inode.getId());
				treeList.add(inode);
				addToTree(inode);
			}
		}
	}
	
	
	public static void main(String[] args) {


		Integer n[] = { 1, 2, 3, 4, 5, 6, 7 };
		List<StringNode> list = new ArrayList<StringNode>();
		
		OrgNode mn1 = new OrgNode(1+"","菜单1",0+"");
		OrgNode mn2 = new OrgNode(2+"","菜单2",0+"");
		OrgNode mn3 = new OrgNode(3+"","菜单3",0+"");
		OrgNode mn4 = new OrgNode(4+"","菜单4",0+"");
		OrgNode mn5 = new OrgNode(5+"","菜单5",0+"");
		
		OrgNode mn11 = new OrgNode(11+"","菜单11",1+"");
		OrgNode mn12 = new OrgNode(12+"","菜单12",1+"");
		OrgNode mn13 = new OrgNode(13+"","菜单13",1+"");
		
		OrgNode mn21 = new OrgNode(21+"","菜单21",2+"");
		OrgNode mn22 = new OrgNode(22+"","菜单22",2+"");
		OrgNode mn23 = new OrgNode(23+"","菜单23",2+"");
		
		OrgNode mn41 = new OrgNode(41+"","菜单41",4+"");
		OrgNode mn411 = new OrgNode(411+"","菜单411",41+"");
		OrgNode mn412 = new OrgNode(412+"","菜单412",41+"");
		
		list.add(mn1);
		list.add(mn2);
		list.add(mn3);
		list.add(mn4);
		list.add(mn5);
		
		list.add(mn11);
		list.add(mn12);
		list.add(mn13);
		
		list.add(mn21);
		list.add(mn22);
		list.add(mn23);
		
		list.add(mn41);
		list.add(mn411);
		list.add(mn412);
		
		StringTree tree = new StringTree();
		
		List<StringNode> t = tree.getTreeList(list);
		
		
		System.out.println("size:"+t.size());
		
		System.out.println("=====================");
		for(StringNode node : t)
		{
			OrgNode temp = (OrgNode) node;
			
			System.out.println(temp.getPreName());
			
		}
		
		

	}

}
