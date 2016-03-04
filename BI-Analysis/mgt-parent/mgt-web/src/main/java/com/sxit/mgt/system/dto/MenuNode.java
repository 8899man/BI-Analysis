package com.sxit.mgt.system.dto;

import java.util.ArrayList;
import java.util.List;

import com.sxit.common.utils.tree.IntegerNode;
import com.sxit.model.system.SysMenu;


public class MenuNode implements IntegerNode {

	private Integer id;
	private String name;
	private Integer parentId;
	private List<MenuNode> children;
	private String action;
	private Integer sort;
	private Integer type;
	private Integer level=0;
	private Integer functionId;
	private Integer target=1;

	public MenuNode() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public MenuNode(SysMenu menu) {
		super();
		this.id = menu.getMenuId();
		this.name = menu.getMenuName();
		this.parentId = menu.getParentId();
		this.sort = menu.getSort();
		this.action = menu.getAction();
		this.functionId = menu.getFunctionId();
		this.target = menu.getTarget();
	}
	
	public MenuNode(Integer id, String name, Integer parentId) {
		super();
		this.id = id;
		this.name = name;
		this.parentId = parentId;
	}

	public MenuNode(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public MenuNode(Integer id, String name, List<MenuNode> children) {
		super();
		this.id = id;
		this.name = name;
		this.children = children;
	}

	public static void main(String[] args) {

		List<MenuNode> nodelist = new ArrayList<MenuNode>();

		MenuNode node1 = new MenuNode();
		node1.setId(1);
		node1.setParentId(0);

		MenuNode node2 = new MenuNode();
		node2.setId(2);
		node2.setParentId(0);

		MenuNode node3 = new MenuNode();
		node3.setId(3);
		node3.setParentId(0);

		MenuNode node201 = new MenuNode();
		node201.setId(201);
		node201.setParentId(2);

		MenuNode node20101 = new MenuNode();
		node20101.setId(20101);
		node20101.setParentId(201);

		MenuNode node202 = new MenuNode();
		node202.setId(202);
		node202.setParentId(2);

		nodelist.add(node1);

		nodelist.add(node2);

		nodelist.add(node3);

		nodelist.add(node201);
		nodelist.add(node202);

		nodelist.add(node20101);

		List<MenuNode> list = buildTreeList(nodelist);

		for (MenuNode node : list) {
			System.out.print(node.getId());

			System.out.println("  " + node.getLevel());
		}

	}

	/**
	 * 按tree排序
	 * 
	 * @param list
	 * @return
	 */
	public static List<MenuNode> buildTreeList(List<MenuNode> list) {
		List<MenuNode> nodelist = new ArrayList<MenuNode>();
		for (MenuNode node : list) {
			if (node.getParentId() == null || 0 == node.getParentId()) {
				List<MenuNode> templist = node.getChildren(list, 1);
				node.setLevel(1);
				nodelist.add(node);
				nodelist.addAll(templist);
			}
		}
		return nodelist;
	}

	public List<MenuNode> getChildren(List<MenuNode> list, int level) {
		List<MenuNode> nodelist = new ArrayList<MenuNode>();
		for (MenuNode node : list) {
			if (node.getParentId()!=null && this.id.intValue() == node.getParentId()) {
				node.setLevel(level + 1);
				nodelist.add(node);
				List<MenuNode> templist = node.getChildren(list, level + 1);
				nodelist.addAll(templist);
			}
		}
		return nodelist;
	}

	/**
	 * 构建树
	 * 
	 * @param list
	 * @return
	 */
	public static List<MenuNode> buildTree(List<MenuNode> list) {
		List<MenuNode> nodelist = new ArrayList<MenuNode>();
		for (MenuNode node : list) {
			if (node.getParentId() == null || 0 == node.getParentId()) {
				node.buildNode(list);
				nodelist.add(node);
			}
		}
		return nodelist;
	}

	/**
	 * 构建一个节点
	 * 
	 * @param list
	 */
	public void buildNode(List<MenuNode> list) {
		List<MenuNode> nodelist = new ArrayList<MenuNode>();
		for (MenuNode node : list) {
			if (this.id == node.getParentId()) {
				node.buildNode(list);
				nodelist.add(node);
			}
		}
		children = nodelist;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPreName() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < level; i++) {
			sb.append("　");
		}
		sb.append("┣ ");
		sb.append(name);
		return sb.toString();
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getAction() {
		return action;
	}


	public void setAction(String action) {
		this.action = action;
	}


	public String getMenuCode() {
		return action;
	}

	public void setMenuCode(String menuCode) {
		this.action = menuCode;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getFunctionId() {
		return functionId;
	}


	public void setFunctionId(Integer functionId) {
		this.functionId = functionId;
	}


	public List<MenuNode> getChildren() {
		return children;
	}

	public void setChildren(List<MenuNode> children) {
		this.children = children;
	}


	@Override
	public void addChild(IntegerNode node) {
		if (children == null) {
			children = new ArrayList<MenuNode>();
		}
		children.add((MenuNode)node);
	}


	@Override
	public void addLevel(int plevel) {
		// TODO Auto-generated method stub
		level = plevel +1;
	}
	
	@Override
	public Integer getLevel() {
		// TODO Auto-generated method stub
		return level;
	}


	public Integer getTarget() {
		return target;
	}


	public void setTarget(Integer target) {
		this.target = target;
	}
}
