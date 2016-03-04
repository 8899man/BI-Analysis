package com.sxit.mgt.pmp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sxit.mgt.pmp.dao.SaleQueryDao;

/**
 * @author dengbiao
 */
public class SaleQueryService {
	
	@Autowired
	private SaleQueryDao diskQueryDao;
	
	public List<Map> getHouses(String projGUID) {
		List<Map> list = diskQueryDao.getHouses(projGUID);
		
		List<Map> _list = new ArrayList<Map>();
		if (list != null && list.size() > 0) {
			for (Map _row : list) {
				String bldCode = (String)_row.get("bldCode");
				
				int idx = indexOf(_list, "bldCode", bldCode);
				if (idx == -1) {
					Map new_lh = new HashMap(); //楼号
					new_lh.put("bldCode", _row.get("bldCode")); //这个
					
					List<Map> units = new ArrayList<Map>(); //单元
					Map new_unit = new HashMap(); //创建一个新的单元
					new_unit.put("unit", _row.get("unit")); //放入单元号
					
					List<Map> houses = new ArrayList<Map>(); 
					houses.add(_row);
					
					units.add(new_unit);
					new_unit.put("houses", houses);
					new_lh.put("units", units);
					
					
					_list.add(new_lh);
				} else {
					Map crr_lh = _list.get(idx);// 获取当前楼号
					List<Map> units = (List<Map>)crr_lh.get("units"); //获取楼里面的单元集合
					
					for (int _u=0; _u<units.size(); _u++) { //查找匹配单元
						Map unit = units.get(_u);
						String unitValue = (String)_row.get("unit");
						int _idx_u = indexOf(units, "unit", unitValue);
						
						if (_idx_u == -1){ //如果没有匹配单元，说明是一个新的单元
							Map new_unit = new HashMap(); //创建一个新的单元
							new_unit.put("unit", _row.get("unit")); //放入单元号
							
							List<Map> houses = new ArrayList<Map>(); //创建一个房屋集合
							houses.add(_row);
							new_unit.put("houses", houses); //新单元中假如房屋集合
							units.add(new_unit); //单元集合中假如新单元数据
						} else { //如果是已有单元
							Map c_unit = units.get(_idx_u);
							
							/*
							List<Map> houses = (List<Map>)c_unit.get("houses");
							String 
							int idx_h = indexOf(houses, "", )
							*/
							
							((List)c_unit.get("houses")).add(_row);
						}
					}
					
					//units.add(_row);
				}
			}
		}
		
		return _list;
	}
	
	
	/**
	 * @param bldId
	 * @return
	 */
	public int indexOf(List<Map> _list, String key, String value) {
		int i = -1;
		if (_list.size() > 0) {
			for (int _i=0; _i<_list.size(); _i++) {
				Map _row = _list.get(_i);
				String _value = (String)_row.get(key);
				
				if (_value.equals(value)) {
					i = _i;
					break;
				}
			}
		}
		return i;
	}
}
