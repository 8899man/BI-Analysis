package com.sxit.mgt.reports.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sxit.common.pagehelper.Page;
import com.sxit.common.pagehelper.PageHelper;
import com.sxit.common.pagehelper.PageVo;
import com.sxit.mgt.constant.BusiConfig;
import com.sxit.mgt.reports.dao.BAreaCompanyDao;
import com.sxit.mgt.reports.dao.ReportsDao;
import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.model.reports.ReportCstDealMidOwn;

/**
 * @公司:深讯信科
 * @功能:标签 Service
 * @作者:dengbiao    
 * @日期:2015-11-02 18:07:18  
 * @版本:1.0
 * @修改:
 */

@Service
@Transactional(readOnly = true)
@SuppressWarnings({ "rawtypes", "unchecked" })
public class ReportsService {

	@Autowired
	private ReportsDao reportsDao;
	
	@Autowired
	private BAreaCompanyDao bAreaCompanyDao;

	/**
	 * 新增 标签
	 **/
	@Transactional
	public int insert(ReportCstDealMidOwn reports) {
		return reportsDao.insert(reports);
	}

	/**
	 * 批量新增 标签
	 **/
	@Transactional
	public void insertList(List<ReportCstDealMidOwn> list) {
		if(list.size()>0)
		{
			reportsDao.insertList(list);
		}
		 
	}

	/**
	 * 批量修改 标签
	 **/
	@Transactional
	public void updateList(List<ReportCstDealMidOwn> list) {
		if(list.size()>0)
		{
		 reportsDao.updateList(list);
		}
	}

	/**
	 * 修改 标签
	 **/
	@Transactional
	public int update(ReportCstDealMidOwn reports) {
		return reportsDao.update(reports);
	}

	/**
	 * 是否存在 标签
	 **/
	public int isHave(Long id) {
		return reportsDao.isHave(id);
	}

	/**
	 *  删除标签
	 **/
	@Transactional
	public int delete(Long id){
	       return reportsDao.delete(id);
	}


	/**
	 *  标识删除标签
	 **/
	@Transactional
	public int updateToDelete(Long id){
	       return reportsDao.updateToDelete(id);
	}

	/**
	 * 分页列表 标签
	 **/
	public Page<ReportCstDealMidOwn> getReportsList(PageVo page,  Map map) {
		PageHelper.startPage(page.getPage(), page.getPageSize());
		return reportsDao.getReportsList(map);
	}

	/**
	 * 已经存在的列表 标签
	 **/
	public List<ReportCstDealMidOwn> getHaveReportsList(List<ReportCstDealMidOwn> list) {
		return reportsDao.getHaveReportsList(list);
	}

	/**
	 * 根据ID获取标签
	 */
	public ReportCstDealMidOwn getReportsById(Long id){
	       return reportsDao.getReportsById(id);
	}

	/**
	 * ID Map 标签
	 **/
	public Map<String,String> getIdMap(){
		Map<String,String> map = new HashMap();
		for(String id:reportsDao.getIdList())
		{
			map.put(id, id);
		}
		return map;
	}
	
	
	/**
	 * 业主类型分析
	 * @param params
	 * @return
	 */
	public Map<String,Map> ownerTypeData(Map params) {
		Map retValue = new HashMap();
		List<Map> cityList = getCityList( reportsDao.getCompanyListByAreaCode(params) );
		params.put("cityList", cityList);
		
		List<Map> ageList = getAgeList(BusiConfig.getAgeList()); //年龄
		params.put("ageList", ageList);
		
		List<Map> sexList = getSexList(BusiConfig.getSexs());
		params.put("sexList", sexList);
		
		List<Map> list = reportsDao.ownerTypeData(params);
		
		retValue.put("OwnerType", list);
		retValue.put("liveArea", cityList);
		retValue.put("ages", ageList);
		retValue.put("sexs", sexList);
		
		System.out.println(retValue);
		return retValue;
	}
		
	private  List<Map> getCityList(List cityList) {
		List<Map> retValue = new ArrayList<Map>();
		for(int i=0; i<cityList.size(); i++) {
			Map live_area = (Map)cityList.get(i);
			Map tmp = new HashMap();
			tmp.put("name", (String)live_area.get("live_area"));
			if ("未知".equals(live_area)) {
				tmp.put("alisName", "城市未知");
			} else {
				tmp.put("alisName", (String)live_area.get("live_area"));
			}
			retValue.add(tmp);
		}
		return retValue ;
	}
	
	private  List<Map> getSexList(List sexList) {
		List<Map> retValue = new ArrayList<Map>();
		for(int i=0; i<sexList.size(); i++) {
			String sex = (String)sexList.get(i);
			Map tmp = new HashMap();
			tmp.put("name", sex);
			if ("未知".equals(sex)) {
				tmp.put("alisName", "性别未知");
			} else {
				tmp.put("alisName", sex);
			}
			retValue.add(tmp);
		}
		return retValue ;
	}
	
	private  List<Map> getAgeList(List ageList) {
		List<Map> retValue = new ArrayList<Map>();
		for(int i=0; i<ageList.size(); i++) {
			String age = (String)ageList.get(i);
			Map tmp = new HashMap();
			tmp.put("name", age);
			if ("未知".equals(age)) {
				tmp.put("alisName", "年龄未知");
			} else {
				tmp.put("alisName", age);
			}
			retValue.add(tmp);
		}
		return retValue ;
	}

	
	/**
	 * 客户数量分析
	 * @param params
	 * @return
	 */
	public Map turnoverCustomerData(Map params) {
		Map retValue = new HashMap();
		
		List<Map> groupItems = getGroupItems(params);
		params.put("groupItems", groupItems);
		
		List<Map> ageList = getAgeList(BusiConfig.getAgeList()); //年龄
		params.put("ageList", ageList);
		
		List<Map> huxingList = getHuxingList(BusiConfig.getHuxings()); //户型
		params.put("huxingList", huxingList);
		
		List<Map> mianjiList = getMianjiList(BusiConfig.getMianjis()); //面积
		params.put("mianjiList", mianjiList);
		
		List<Map> sexList = getSexList(BusiConfig.getSexs());//男女
		params.put("sexList", sexList);
		
		System.out.println(params);
		List<Map> list = reportsDao.turnoverCustomerData(params);
		
		retValue.put("turnoverCustomerData", list);
		retValue.put("groupItems", groupItems);
		retValue.put("huxingList", huxingList);
		retValue.put("mianjiList", mianjiList);
		retValue.put("ageList", ageList);
		retValue.put("sexList", sexList);
		retValue.put("fromId", params.get("unitId"));
		
		return retValue;
	}

	
	/**
	 * 获取行分组类别，有可能是区域，公司，项目
	 * @param params
	 * @return
	 */
	private List<Map> getGroupItems(Map params) {
		List<Map> retValue = new ArrayList<Map>(); 
		String unitType = (String)params.get("unitType");
		if ("group".equals(unitType)) {
			params.put("fieldName", "area_id");
			params.put("unitType", "area");
			List<BAreaCompany> areas = bAreaCompanyDao.getAreaList();
			for (int i=0; i<areas.size(); i++) {
				BAreaCompany area = areas.get(i);
				Map tmp = new HashMap();
				tmp.put("name", area.getAreaName());
				tmp.put("alisName", area.getAreaName());
				tmp.put("code", area.getAreaCode());
				retValue.add(tmp);
			}
		} else if ("area".equals(unitType)) {
			params.put("fieldName", "citycode");
			params.put("unitType", "city");
			
			List<BAreaCompany> companies = bAreaCompanyDao.getCompanyList((String)params.get("countCode"));
			for (int i=0; i<companies.size(); i++) {
				BAreaCompany company = companies.get(i);
				Map tmp = new HashMap();
				tmp.put("name", company.getCompanyName());
				tmp.put("alisName", company.getCompanyName());
				tmp.put("code", company.getCompanyCode());
				retValue.add(tmp);
			}
		} else if ("city".equals(unitType)) {
			params.put("fieldName", "projGUID");
			params.put("unitType", "project");
			
//			prject_name, projGUID
			List<Map> projects = reportsDao.getPorjects((String)params.get("countCode"));
			for (int i=0; i<projects.size(); i++) {
				Map row = (Map)projects.get(i);
				Map tmp = new HashMap();
				tmp.put("name", row.get("prject_name"));
				tmp.put("alisName", row.get("prject_name"));
				tmp.put("code", row.get("projGUID"));
				retValue.add(tmp);
			}
		}
		return retValue;
	}

	private List<Map> getMianjiList(List<String> mianjis) {
		List<Map> retValue = new ArrayList<Map>();
		for(int i=0; i<mianjis.size(); i++) {
			String mainji = (String)mianjis.get(i);
			Map tmp = new HashMap();
			tmp.put("name", mainji);
			if ("未知".equals(mainji)) {
				tmp.put("alisName", "面积未知");
			} else {
				tmp.put("alisName", mainji);
			}
			retValue.add(tmp);
		}
		return retValue;
	}

	
	private List<Map> getHuxingList(List<String> huxings) {
		List<Map> retValue = new ArrayList<Map>();
		for(int i=0; i<huxings.size(); i++) {
			String huxing = (String)huxings.get(i);
			Map tmp = new HashMap();
			tmp.put("name", huxing);
			if ("未知".equals(huxing)) {
				tmp.put("alisName", "户型未知");
			} else {
				tmp.put("alisName", huxing);
			}
			retValue.add(tmp);
		}
		return retValue;
	}

	public Map getBuyTimesData(Map params) {
		Map retValue = new HashMap();
		List<Map> yezhuList = getYezhuList(BusiConfig.getYuzhuIist());
		params.put("yezhuList", yezhuList);
		
		List<Map> buycountList = getBuycountList(BusiConfig.getBuycountList());
		params.put("buycountList", buycountList);
		
		List<Map> data = reportsDao.getBuyTimesData(params);
		retValue.put("buyTimesData", data);
		retValue.put("buycountList", buycountList);
		retValue.put("yezhuList", yezhuList);
		return retValue;
	}
	
	private List<Map> getBuycountList(List<String> buycountList) {
		List<Map> retValue = new ArrayList<Map>();
		for(int i=0; i<buycountList.size(); i++) {
			String buycount = (String)buycountList.get(i);
			Map tmp = new HashMap();
			tmp.put("name", buycount);
			if ("未知".equals(buycount)) {
				tmp.put("alisName", "购买次数未知");
			} else {
				tmp.put("alisName", buycount);
			}
			retValue.add(tmp);
		}
		return retValue;
	}

	private List<Map> getYezhuList(List<String> yezhuList) {
		List<Map> retValue = new ArrayList<Map>();
		for(int i=0; i<yezhuList.size(); i++) {
			String yezhu = (String)yezhuList.get(i);
			Map tmp = new HashMap();
			tmp.put("name", yezhu);
			if ("未知".equals(yezhu)) {
				tmp.put("alisName", "未知");
			} else {
				tmp.put("alisName", yezhu);
			}
			retValue.add(tmp);
		}
		return retValue;
	}
}


