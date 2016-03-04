package com.sxit.mgt.system.dto;

import java.util.ArrayList;
import java.util.List;

import com.sxit.common.utils.tree.StringNode;
import com.sxit.model.system.SysAdOrg;

public class AdNode implements StringNode{

	private String id;
	private String name;
	private String orgId;
	private String parentId;
	private String orgGuid; 
	private List<AdNode> children;
	private Integer state;
	private Integer checkState;
	private Integer level=0;


	public AdNode() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public AdNode(SysAdOrg ad) {
		super();
		this.id = ad.getAdGuid();
		this.name = ad.getOrgName();
		this.parentId = ad.getParentGuid();
		this.state = ad .getState();
		this.checkState = ad.getCheckState();
		this.orgGuid = ad.getOrgGuid();
	}
	
	public AdNode(String id, String name, String parentId) {
		super();
		this.id = id;
		this.name = name;
		this.parentId = parentId;
	}

	public AdNode(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public AdNode(String id, String name, List<AdNode> children) {
		super();
		this.id = id;
		this.name = name;
		this.children = children;
	}

	public void addChild(AdNode child) {
		if (children == null) {
			children = new ArrayList<AdNode>();
		}
		children.add(child);
	}
	
	

	public static void main(String[] args) {

		List<AdNode> nodelist = new ArrayList<AdNode>();

		AdNode node1 = new AdNode();
		node1.setId("1");
		node1.setParentId("");

		AdNode node2 = new AdNode();
		node2.setId("2");
		node2.setParentId("");

		AdNode node3 = new AdNode();
		node3.setId("3");
		node3.setParentId("0");

		AdNode node201 = new AdNode();
		node201.setId("201");
		node201.setParentId("2");

		AdNode node20101 = new AdNode();
		node20101.setId("20101");
		node20101.setParentId("201");

		AdNode node202 = new AdNode();
		node202.setId("202");
		node202.setParentId("2");

		nodelist.add(node1);

		nodelist.add(node2);

		nodelist.add(node3);

		nodelist.add(node201);
		nodelist.add(node202);

		nodelist.add(node20101);

		List<AdNode> list = buildTreeList(nodelist);

		for (AdNode node : list) {
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
	public static List<AdNode> buildTreeList(List<AdNode> list) {
		List<AdNode> nodelist = new ArrayList<AdNode>();
		for (AdNode node : list) {
			if (node.getParentId() == null || "".equals(node.getParentId())) {
				List<AdNode> templist = node.getChildren(list, 1);
				node.setLevel(1);
				nodelist.add(node);
				nodelist.addAll(templist);
			}
		}
		return nodelist;
	}

	public List<AdNode> getChildren(List<AdNode> list, int level) {
		List<AdNode> nodelist = new ArrayList<AdNode>();
		for (AdNode node : list) {
			if (this.id.equals(node.getParentId())) {
				node.setLevel(level + 1);
				nodelist.add(node);
				List<AdNode> templist = node.getChildren(list, level + 1);
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
	public static List<AdNode> buildTree(List<AdNode> list) {
		List<AdNode> nodelist = new ArrayList<AdNode>();
		for (AdNode node : list) {
			if (node.getParentId() == null || "".equals(node.getParentId())) {
				
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
	public void buildNode(List<AdNode> list) {
		List<AdNode> nodelist = new ArrayList<AdNode>();
		for (AdNode node : list) {
			if (this.id.equals(node.getParentId())) {
				node.buildNode(list);
				nodelist.add(node);
			}
		}
		children = nodelist;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getText() {
		return name;
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

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	

	

	public String getOrgGuid() {
		return orgGuid;
	}


	public void setOrgGuid(String orgGuid) {
		this.orgGuid = orgGuid;
	}


	public String getOrgId() {
		return orgId;
	}


	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}


	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getCheckState() {
		return checkState;
	}


	public void setCheckState(Integer checkState) {
		this.checkState = checkState;
	}



	public void setLevel(Integer level) {
		this.level = level;
	}

	public List<AdNode> getChildren() {
		return children;
	}

	public void setChildren(List<AdNode> children) {
		this.children = children;
	}
	
	@Override
	public void addChild(StringNode node) {
		if (children == null) {
			children = new ArrayList<AdNode>();
		}
		children.add((AdNode)node);
	}

	@Override
	public void addLevel(int plevel) {
		// TODO Auto-generated method stub
		level = plevel+1;
	}

	@Override
	public Integer getLevel() {
		// TODO Auto-generated method stub
		return level;
	}
}
