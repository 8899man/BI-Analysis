package com.sxit.mgt.system.dto;

import java.util.ArrayList;
import java.util.List;

import com.sxit.common.utils.tree.StringNode;

public class OrgNode implements StringNode{

	private String id;
	private String text;
	private String parentId;
	private Integer level=0;
	private List<OrgNode> children;
	private String type;  //类别 用于控制树的图标   组织  项目
	private Integer subType; // 类别 1 集团 2 区域 3 公司
	private Integer orgType;
	



	public OrgNode() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrgNode(String id, String text, String parentId) {
		super();
		this.id = id;
		this.text = text;
		this.parentId = parentId;
	}



	public OrgNode(String id, String text, String parentId,Integer orgType, Integer subType) {
		super();
		this.id = id;
		this.text = text;
		this.parentId = parentId;
		this.subType = subType;
		this.orgType = orgType;
		children = new ArrayList();
	}

	public OrgNode(String id, String text) {
		super();
		this.id = id;
		this.text = text;
	}

	public OrgNode(String id, String text, List<OrgNode> children) {
		super();
		this.id = id;
		this.text = text;
		this.children = children;
	}

	public void addChild(OrgNode child) {
		if (children == null) {
			children = new ArrayList<OrgNode>();
		}
		children.add(child);
	}

	/**
	 * 构建树
	 * 
	 * @param list
	 * @return
	 */
	public static List<OrgNode> buildTree(List<OrgNode> list) {
		List<OrgNode> nodelist = new ArrayList<OrgNode>();
		for (OrgNode node : list) {
			if (node.getParentId() == null || "0".equals(node.getParentId()) || "".equals(node.getParentId())) {
				
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
	public void buildNode(List<OrgNode> list) {
		List<OrgNode> nodelist = new ArrayList<OrgNode>();

		for (OrgNode node : list) {
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getSubType() {
		return subType;
	}

	public void setSubType(Integer subType) {
		this.subType = subType;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public List<OrgNode> getChildren() {
		return children;
	}

	public void setChildren(List<OrgNode> children) {
		this.children = children;
	}
	
	public Integer getOrgType() {
		return orgType;
	}

	public void setOrgType(Integer orgType) {
		this.orgType = orgType;
	}

	public String getPreName() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < level; i++) {
			sb.append("　");
		}
		sb.append("┣ ");
		sb.append(text);
		return sb.toString();
	}
	
	@Override
	public void addChild(StringNode node) {
		if (children == null) {
			children = new ArrayList<OrgNode>();
		}
		children.add((OrgNode)node);
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
