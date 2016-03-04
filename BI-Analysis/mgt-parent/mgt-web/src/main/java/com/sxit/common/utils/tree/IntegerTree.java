package com.sxit.common.utils.tree;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.sxit.mgt.system.dto.MenuNode;

/**
 * 使用深度优先算法构建树
 * @author agu
 *
 */
public class IntegerTree {

	private List<IntegerNode> nodeList;

	private List<IntegerNode> tree;
	
	private List<IntegerNode> treeList;
	
	public IntegerTree() {
		super();
		// TODO Auto-generated constructor stub
	}


	public List<IntegerNode> getTree(List<IntegerNode> nodeList) {
		this.nodeList = new ArrayList();
		
		this.nodeList.addAll(nodeList);
		buildTree();
		return tree;
	}
	
	public List<IntegerNode> getTreeList(List<IntegerNode> nodeList) {
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

		tree = new ArrayList<IntegerNode>();

		Set<Integer> setids = new HashSet<Integer>();
		Set<Integer> setpids = new HashSet<Integer>();

		for (IntegerNode node : nodeList) {
			setids.add(node.getId());
			if (node.getParentId() != null
					&& !setpids.contains(node.getParentId())) {
				setpids.add(node.getParentId());
			}
		}

		setpids.removeAll(setids);

		for (IntegerNode node : nodeList) {
			if (node.getParentId() == null
					|| setpids.contains(node.getParentId())) {
				tree.add(node);
			}
		}

		nodeList.removeAll(tree);

		for (IntegerNode node : tree) {
			node.addLevel(0);
			buildChild(node);
		}
	}
	
	/**
	 * 构建子
	 * @param node
	 */
	private void buildChild(IntegerNode node) {
		List<IntegerNode> tempList = new ArrayList(nodeList);
		Iterator<IntegerNode> iterator = tempList.iterator();
		while (iterator.hasNext()) {
			IntegerNode inode = iterator.next();
			System.out.println("id:" + inode.getId());
			if (node.getId().equals(inode.getParentId())) {
				nodeList.remove(inode);
				inode.addLevel(node.getLevel());
				node.addChild(inode);
				System.out.println("=======id:" + inode.getId());
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

		tree = new ArrayList<IntegerNode>();
		
		treeList = new ArrayList<IntegerNode>();

		Set<Integer> setids = new HashSet<Integer>();
		Set<Integer> setpids = new HashSet<Integer>();

		for (IntegerNode node : nodeList) {
			setids.add(node.getId());
			if (node.getParentId() != null
					&& !setpids.contains(node.getParentId())) {
				setpids.add(node.getParentId());
			}
		}

		setpids.removeAll(setids);

		for (IntegerNode node : nodeList) {
			if (node.getParentId() == null
					|| setpids.contains(node.getParentId())) {
				tree.add(node);
			}
		}

		nodeList.removeAll(tree);

		for (IntegerNode node : tree) {
			node.addLevel(0);
			treeList.add(node);
			addToTree(node);
		}
	}
	
	private void addToTree(IntegerNode node) {
		//treeList.add(node);
		List<IntegerNode> tempList = new ArrayList(nodeList);
		Iterator<IntegerNode> iterator = tempList.iterator();
		while (iterator.hasNext()) {
			IntegerNode inode = iterator.next();
			System.out.println("id:" + inode.getId());
			if (node.getId().equals(inode.getParentId())) {
				nodeList.remove(inode);
				inode.addLevel(node.getLevel());
				System.out.println("=======id:" + inode.getId());
				treeList.add(inode);
				addToTree(inode);
			}
		}
	}
	
	
	public static void main(String[] args) {


		Integer n[] = { 1, 2, 3, 4, 5, 6, 7 };
		List<IntegerNode> list = new ArrayList<IntegerNode>();
		
		MenuNode mn1 = new MenuNode(1,"菜单1",0);
		MenuNode mn2 = new MenuNode(2,"菜单2",0);
		MenuNode mn3 = new MenuNode(3,"菜单3",0);
		MenuNode mn4 = new MenuNode(4,"菜单4",0);
		MenuNode mn5 = new MenuNode(5,"菜单5",0);
		
		MenuNode mn11 = new MenuNode(11,"菜单11",1);
		MenuNode mn12 = new MenuNode(12,"菜单12",1);
		MenuNode mn13 = new MenuNode(13,"菜单13",1);
		
		MenuNode mn21 = new MenuNode(21,"菜单21",2);
		MenuNode mn22 = new MenuNode(22,"菜单22",2);
		MenuNode mn23 = new MenuNode(23,"菜单23",2);
		
		MenuNode mn41 = new MenuNode(41,"菜单41",4);
		MenuNode mn411 = new MenuNode(411,"菜单411",41);
		MenuNode mn412 = new MenuNode(412,"菜单412",41);
		
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
		
		IntegerTree tree = new IntegerTree();
		
		List<IntegerNode> t = tree.getTreeList(list);
		
		
		System.out.println("size:"+t.size());
		
		System.out.println("=====================");
		for(IntegerNode node : t)
		{
			MenuNode temp = (MenuNode) node;
			
			System.out.println(temp.getPreName());
			
		}
		
		

	}

}
