package com.sxit.common.utils.tree;

import java.util.List;

public interface StringNode {
	
	public void addChild(StringNode node);

	public String getId();
	
	public void addLevel(int plevel);
	
	public Integer getLevel();
	
	public String getParentId();

}
