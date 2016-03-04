package com.sxit.model.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CheckBoxStringVo implements Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 3162842289137956753L;

	private String id;

	private String name;
	
	private boolean checked = false;
	
	private boolean disabled = false;

	public CheckBoxStringVo() {
		super();
		// Auto-generated constructor stub
	}

	public CheckBoxStringVo(String id, String name, boolean checked) {
		super();
		this.id = id;
		this.name = name;
		this.checked = checked;
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



	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * 应用已有的值
	 * 
	 * @param industList
	 * @param ilist
	 * @return
	 */
	public static List<CheckBoxStringVo> applyCheckboxList(List<CheckBoxStringVo> industList,
			List<String> ilist) {

		
		for (CheckBoxStringVo cb : industList) {
			if (ilist.contains(cb.getId())) {
				cb.setChecked(true);
			} else {
				cb.setChecked(false);
			}
		}
		return industList;
	}

	/**
	 * 获取添加的id
	 * 
	 * @param oldList
	 * @param newList
	 * @return
	 */
	public static List<String> getAddList(List<String> oldList,
			List<CheckBoxStringVo> newList) {
		List<String> tempList = getCheckedList(newList);

		tempList.removeAll(oldList);

		return tempList;
	}

	/**
	 * 获取删除id
	 * 
	 * @param oldList
	 * @param newList
	 * @return
	 */
	public static List<String> getDeleteList(List<String> oldList,
			List<CheckBoxStringVo> newList) {
		List<String> tempList = getCheckedList(newList);

		List<String> deleteList = new ArrayList(oldList);

		deleteList.removeAll(tempList);

		return deleteList;
	}

	public static List<String> getCheckedList(List<CheckBoxStringVo> newList) {
		List<String> tempList = new ArrayList();

		if(newList==null)
		{
			return tempList;
		}
		
		for (CheckBoxStringVo cb : newList) {
			if (cb.checked) {
				tempList.add(cb.getId());
			}

		}
		return tempList;
	}

	public boolean isDisabled() {
		return disabled;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

}
