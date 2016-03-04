package com.sxit.common.utils.tree;

import java.util.List;

public interface IntegerNode {

	public void addChild(IntegerNode node);

	public Integer getId();
	
	public void addLevel(int plevel);
	
	public Integer getLevel();
	
	public Integer getParentId();

}
