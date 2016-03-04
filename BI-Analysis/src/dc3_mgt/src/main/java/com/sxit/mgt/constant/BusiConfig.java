package com.sxit.mgt.constant;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

public class BusiConfig {
	
	private static List<String> ageList;
	
	private static List<String> sexs;
	
	private static List<String> huxingList;
	
	private static List<String> mianjiList;
	
	private static JSONObject areaCofnig;
	
	private static List<String> yezhuList;
	
	private static List<String> buycountList;
	
	static {
		if (ageList == null) {
			ageList = new ArrayList<String>();
			ageList.add("20岁以下");
			ageList.add("21-34岁");
			ageList.add("35-44岁");
			ageList.add("45-54岁");
			ageList.add("55-64岁");
			ageList.add("64岁以上");
			ageList.add("未知");
		}
		
		if (sexs == null) {
			sexs = new ArrayList<String>();
			sexs.add("男");
			sexs.add("女");
			sexs.add("未知");
		}
		
		if (huxingList == null) {
			huxingList = new ArrayList<String>();
			huxingList.add("1室");
			huxingList.add("2室");
			huxingList.add("3室");
			huxingList.add("4室");
			huxingList.add("5室以上");
			huxingList.add("未知");
		}
		
		if (mianjiList == null) {
			mianjiList = new ArrayList<String>();
			mianjiList.add("90㎡以下");
			mianjiList.add("91-120㎡");
			mianjiList.add("121-145㎡");
			mianjiList.add("146-200㎡");
			mianjiList.add("200㎡以上");
			mianjiList.add("未知");
		}
		
		if (areaCofnig == null) {
			areaCofnig = new JSONObject();
		}
		
		if (yezhuList == null) {
			yezhuList = new ArrayList<String>();
			yezhuList.add("准业主");
			yezhuList.add("磨合期业主");
			yezhuList.add("稳定期业主");
			yezhuList.add("老业主");
			yezhuList.add("未知");
		}
		
		if (buycountList == null) {
			buycountList = new ArrayList<String>();
			buycountList.add("1次");
			buycountList.add("2次");
			buycountList.add("2次以上");
		}
	}
	
	public static List<String> getAgeList() {
		return ageList;
	}
	
	
	public static List<String> getSexs() {
		return sexs;
	}
	
	public static List<String> getHuxings() {
		return huxingList;
	}
	
	public static List<String> getMianjis() {
		return mianjiList;
	}
	
	public static List<String> getYuzhuIist() {
		return yezhuList;
	}
	
	public static List<String> getBuycountList() {
		return buycountList;
	}
}
