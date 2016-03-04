package com.sxit.mgt.system.dto;

import java.util.ArrayList;
import java.util.List;

import com.sxit.model.system.SysFunction;

public class FunctionNode {

	private Integer id;
	private String name;
	private Integer parentId;
	private List<FunctionNode> children;
	private String functionCode;
	private Integer sort;
	private Integer type;
	private Integer state;
	private Integer level=0;

	public FunctionNode() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public FunctionNode(SysFunction function) {
		super();
		this.id = function.getFunctionId();
		this.name = function.getFunctionName();
		this.parentId = function.getParentId();
		this.sort = function.getSort();
		this.state = function .getState();
		this.functionCode = function.getFunctionCode();
	}
	
	public FunctionNode(Integer id, String name, Integer parentId) {
		super();
		this.id = id;
		this.name = name;
		this.parentId = parentId;
	}

	public FunctionNode(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public FunctionNode(Integer id, String name, List<FunctionNode> children) {
		super();
		this.id = id;
		this.name = name;
		this.children = children;
	}

	public void addChild(FunctionNode child) {
		if (children == null) {
			children = new ArrayList<FunctionNode>();
		}
		children.add(child);
	}

	public static void main(String[] args) {

		List<FunctionNode> nodelist = new ArrayList<FunctionNode>();

		FunctionNode node1 = new FunctionNode();
		node1.setId(1);
		node1.setParentId(0);

		FunctionNode node2 = new FunctionNode();
		node2.setId(2);
		node2.setParentId(0);

		FunctionNode node3 = new FunctionNode();
		node3.setId(3);
		node3.setParentId(0);

		FunctionNode node201 = new FunctionNode();
		node201.setId(201);
		node201.setParentId(2);

		FunctionNode node20101 = new FunctionNode();
		node20101.setId(20101);
		node20101.setParentId(201);

		FunctionNode node202 = new FunctionNode();
		node202.setId(202);
		node202.setParentId(2);

		nodelist.add(node1);

		nodelist.add(node2);

		nodelist.add(node3);

		nodelist.add(node201);
		nodelist.add(node202);

		nodelist.add(node20101);

		List<FunctionNode> list = buildTreeList(nodelist);

		for (FunctionNode node : list) {
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
	public static List<FunctionNode> buildTreeList(List<FunctionNode> list) {
		List<FunctionNode> nodelist = new ArrayList<FunctionNode>();
		for (FunctionNode node : list) {
			if (node.getParentId() == null || 0 == node.getParentId()) {
				List<FunctionNode> templist = node.getChildren(list, 1);
				node.setLevel(1);
				nodelist.add(node);
				nodelist.addAll(templist);
			}
		}
		return nodelist;
	}

	public List<FunctionNode> getChildren(List<FunctionNode> list, int level) {
		List<FunctionNode> nodelist = new ArrayList<FunctionNode>();
		for (FunctionNode node : list) {
			if (node.getParentId()!=null && this.id.intValue() == node.getParentId()) {
				node.setLevel(level + 1);
				nodelist.add(node);
				List<FunctionNode> templist = node.getChildren(list, level + 1);
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
	public static List<FunctionNode> buildTree(List<FunctionNode> list) {
		List<FunctionNode> nodelist = new ArrayList<FunctionNode>();
		for (FunctionNode node : list) {
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
	public void buildNode(List<FunctionNode> list) {
		List<FunctionNode> nodelist = new ArrayList<FunctionNode>();
		for (FunctionNode node : list) {
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

	public String getFunctionCode() {
		return functionCode;
	}

	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
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

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public List<FunctionNode> getChildren() {
		return children;
	}

	public void setChildren(List<FunctionNode> children) {
		this.children = children;
	}
}
