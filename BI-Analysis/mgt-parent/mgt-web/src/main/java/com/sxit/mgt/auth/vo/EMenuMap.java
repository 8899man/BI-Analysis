package com.sxit.mgt.auth.vo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

/**
 * 
 * @author agu
 *
 */
public class EMenuMap implements Serializable {
	
	private List<EMenu> menuItems;
	
	public EMenuMap() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<EMenu> getMenuItems() {
		return menuItems;
	}

	public void setMenuItems(List<EMenu> menuItems) {
		this.menuItems = menuItems;
	}

}
