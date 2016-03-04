package com.sxit.mgt.auth.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.sxit.model.system.SysMenu;

/**
 * 企业菜单
 * 
 * @author agu
 * 
 */
public class EMenu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 菜单ID.
	 */
	private Integer menuId;
	/**
	 * 菜单名称.
	 */
	private String menuName;
	/**
	 * 菜单css.
	 */
	private String className;
	/**
	 * 
	 */
	private String navigation;
	/**
	 * 执行路径.
	 */
	private String href;
	
	private String path;

	/**
	 * 是否推荐
	 */
	private boolean recommend = true;

	/**
	 * 父ID
	 */
	private Integer parentId;
	/**
	 * 目标区域.
	 */
	private Integer target;
	/**
	 * 
	 */
	private String openTarget;

	private List<EMenu> subMenus = new ArrayList(0);

	public EMenu() {
		super();
		// Auto-generated constructor stub
	}

	public EMenu(SysMenu menu) {
		super();
		// Auto-generated constructor stub
		this.menuId = menu.getMenuId();
		this.menuName = menu.getMenuName();
		this.className = menu.getMenuClass();
		this.href = menu.getAction();
		this.navigation = menu.getNavigation();
		this.parentId = menu.getParentId();
		this.target = menu.getTarget();
	}

	public EMenu(Integer menuId, String menuName, String className,
			String navigation, String href, Integer parentId,
			String openTarget, List<EMenu> menuItems) {
		super();
		this.menuId = menuId;
		this.menuName = menuName;
		this.className = className;
		this.navigation = navigation;
		this.href = href;
		this.parentId = parentId;
		this.openTarget = openTarget;
		this.subMenus = menuItems;
	}

	public EMenu(Integer menuId, String menuName, String href, String openTarget) {
		super();
		this.menuId = menuId;
		this.menuName = menuName;
		this.href = href;
		this.openTarget = openTarget;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public void addChildMenus(EMenu menu) {
		this.subMenus.add(menu);
	}

	public boolean isRecommend() {
		return recommend;
	}

	public void setRecommend(boolean recommend) {
		this.recommend = recommend;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getNavigation() {
		return navigation;
	}

	public void setNavigation(String navigation) {
		this.navigation = navigation;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public List<EMenu> getSubMenus() {
		return subMenus;
	}

	public void setSubMenus(List<EMenu> subMenus) {
		this.subMenus = subMenus;
	}

	public Integer getTarget() {
		return target;
	}

	public void setTarget(Integer target) {
		this.target = target;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * 构建树
	 * 
	 * @param list
	 * @return
	 */
	public static List<EMenu> buildTree(List<EMenu> list) {
		List<EMenu> nodeList = new ArrayList<EMenu>();
		for (EMenu node1 : list) {
			boolean mark = false;
			for (EMenu node2 : list) {
				if (node1.getParentId() != null
						&& node1.getParentId().equals(node2.getMenuId())) {
					mark = true;
					if (node2.getSubMenus() == null)
						node2.setSubMenus(new ArrayList<EMenu>());
					
					node1.setPath(node2.getPath()+node1.getMenuId()+".");
					node2.getSubMenus().add(node1);
					break;
				}
			}
			if (!mark) {
				node1.setPath(node1.getMenuId()+".");
				nodeList.add(node1);
			}
		}
		return nodeList;
	}

	public void addChild(EMenu child) {
		if (subMenus == null) {
			subMenus = new ArrayList<EMenu>();
		}
		subMenus.add(child);
	}

}
