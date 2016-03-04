package com.sxit.tree;

import java.util.ArrayList;
import java.util.List;

/**
 * 树状节点，数据结构
 * 
 * @author kenny
 *
 */
public class PNode  {
	
	private String id;
	
	private String name;
	
	/**
	 * 可用于显示
	 */
	private String text;
	
	private String pid;
	
	private int level = 0;
	
	private boolean isLeaf = true;
	
	private boolean isRoot;
	
	
	/**
	 * 当前元素的值
	 */
	private Object value;
	
	private List<PNode> children = new ArrayList<PNode>();
	
	private PNode parent;
	
	
	//-----------------------------------------------------------------------------------------
	public PNode() {}
	
	public PNode(String id, String name, String pid, boolean isRoot) {
		this.id = id;
		this.name = name;
		this.pid = pid;
		this.isRoot = isRoot;
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


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public int getLevel() {
		return level;
	}


	public void setLevel(int level) {
		this.level = level;
	}


	public boolean isLeaf() {
		return isLeaf;
	}


	public void setIsLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}
	
	
	public boolean getIsLeaf() {
		return this.isLeaf;
	}


	public boolean isRoot() {
		return isRoot;
	}


	public void setIsRoot(boolean isRoot) {
		this.isRoot = isRoot;
	}
	
	public boolean getIsRoot() {
		return this.isRoot;
	}


	public Object getValue() {
		return value;
	}


	public void setValue(Object value) {
		this.value = value;
	}


	public List<PNode> getChildren() {
		return children;
	}


	public void setChildren(List<PNode> children) {
		this.children = children;
	}


	public PNode getParent() {
		return parent;
	}


	public void setParent(PNode parent) {
		this.parent = parent;
		
		if (parent == null) {
			setLevel(0);
		} else {
			setLevel(parent.getLevel() + 1);
		}
	}
	
	public void addChild(PNode child) {
		this.children.add(child);
		setIsLeaf(false);
	}
	
	public void addChildren(List<PNode> children) {
		this.children.addAll(children);
		setIsLeaf(false);
	}
	
	public void removeChild(int i) {
		this.children.remove(i);
		
		if (this.children.size() < 1) {
			setIsLeaf(true);
		}
	}
	
	public void removeChild(PNode child) {
		this.children.remove(child);
		
		if (this.children.size() < 1) {
			setIsLeaf(true);
		}
	}
	
	public void remodeAllChild(List<PNode> children) {
		this.children.removeAll(children);
		
		if (this.children.size() < 1) {
			setIsLeaf(true);
		}
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
