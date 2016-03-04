package com.sxit.mgt.marketing.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxit.common.action.BaseAction;
import com.sxit.common.dto.ResultMessage;
import com.sxit.mgt.marketing.service.MarketingService;
import com.sxit.mgt.marketing.vo.CustomerModelData;
import com.sxit.mgt.marketing.vo.CustomerNumDetail;
import com.sxit.mgt.marketing.vo.ExtractLog;
import com.sxit.mgt.marketing.vo.Subs;
import com.sxit.model.system.BaseUser;

@Controller
@RequestMapping("/marketing")
public class MarketingAction extends BaseAction {
	
	@Autowired
	private MarketingService marketingService;
	
	@RequestMapping(value = "/customerClassify/areaCoverage")
	public @ResponseBody ResultMessage getAreaCoverage(HttpSession session){
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		List<Subs> areas = null;
		if(userId != 1){
			areas = marketingService.getAreaByUserId(userId);
		}else{
			areas = marketingService.getAreaCityProj(2, null);
		}
		if(areas != null){
			Subs area = null;
			Subs company = null;
			Subs project = null;
			int area_size = areas.size();
			int company_size = 0;
			int project_size = 0;
			for (int i = 0; i < area_size; i++) {
				area = areas.get(i);
				if(area != null){
					String areaId = area.getValue();
					if((areaId == null || "".equals(areaId)) || (area.getTitle() == null || "".equals(area.getTitle()))){
						areas.remove(i);
						i -= 1;
						area_size -= 1;
					}else{
						List<Subs> companys = null;
						if(userId != 1){
							companys = marketingService.getCompanyByUserId(userId, areaId);
						}else{
							companys = marketingService.getAreaCityProj(3, areaId);
						}
						if(companys == null){
							companys = new ArrayList<Subs>();
						}
						Subs companyOne = new Subs();
						companyOne.setValue("-1");
						companyOne.setTitle("不限");
						companys.add(0, companyOne);
						company_size = companys.size();
						for (int j = 0; j < company_size; j++) {
							company = companys.get(j);
							if(company != null){
								String citycode = company.getValue();
								if((citycode == null || "".equals(citycode)) || (company.getTitle() == null || "".equals(company.getTitle()))){
									companys.remove(company);
									j -=1;
									company_size -= 1;
								}else{
									List<Subs> projects = null;
									if(userId != 1){
										projects = marketingService.getProjectsByUserId(citycode, userId);
									}else{
										projects = marketingService.getProjects(citycode);
									}
									if(projects == null){
										projects = new ArrayList<Subs>();
									}
									Subs projectOne = new Subs();
									projectOne.setValue("-1");
									projectOne.setTitle("不限");
									projects.add(0, projectOne);
									project_size = projects.size();
									for (int k = 0; k < project_size; k++) {
										project = projects.get(k);
										if(project != null){
											String projId = project.getValue();
											if((projId == null || "".equals(projId)) || (project.getTitle() == null || "".equals(project.getTitle()))){
												projects.remove(project);
												k -=1;
												project_size -= 1;
											}
										}else{
											projects.remove(project);
											k -=1;
											project_size -= 1;
										}
									}
									companys.get(j).setSubs(projects);
								}
								areas.get(i).setSubs(companys);
							}else{
								companys.remove(company);
								j -=1;
								company_size -= 1;
							}
						}
					}
				}
				else{
					areas.remove(i);
					i -= 1;
					area_size -= 1;
				}
				
			}
		}else{
			areas = new ArrayList<Subs>();
		}
		return ResultMessage.successMsg("获取成功", areas);
	}
	
	@RequestMapping(value = "/customerClassify/subTypeData")
	public @ResponseBody ResultMessage getSubTypeData(HttpSession session, @RequestParam String bigCode, String cityCode, String projGUID){
		
		if(bigCode == null || "".equals(bigCode)){
			return ResultMessage.errorMsg("参数请求错误");
		}
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		if("-1".equals(cityCode)){
			cityCode = null;
		}
		if("-1".equals(projGUID)){
			projGUID = null;
		}
		int totalCount = 0;
		if(userId != 1){
			String paramStr = "";
			if(cityCode == null){
				paramStr = " and a.big_code = '" + bigCode + "' ";
			}else{
				if(projGUID == null){
					paramStr = " and a.city_code = '" + cityCode + "' ";
				}else{
					paramStr = " and a.proj_guid = '" + projGUID + "' ";
				}
			}
			totalCount = marketingService.getRptYxCstModelByUserId(userId, paramStr, " a.cst_type in (12, 13, 14, 11, 21, 22, 23, 31, 32)");
			
			//已购客户
			CustomerNumDetail s1 = marketingService.getCMNumBYUserId("-1", "已购客户", " a.cst_type in (11, 12, 13, 14) ", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s1_1 = marketingService.getCMNumBYUserId("13", "投资客户", " a.cst_type = 13 ", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s1_2 = marketingService.getCMNumBYUserId("12", "自住客户", " a.cst_type = 12 ", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s1_3 = marketingService.getCMNumBYUserId("11", "期房客户", " a.cst_type = 11 ", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s1_4 = marketingService.getCMNumBYUserId("14", "流失业主", " a.cst_type = 14 ", bigCode, cityCode, projGUID, userId);
			List<CustomerNumDetail> list1 = new ArrayList<CustomerNumDetail>();
			list1.add(s1_1);
			list1.add(s1_2);
			list1.add(s1_3);
			list1.add(s1_4);
			s1.setList(list1);
			
			//意向客户
			CustomerNumDetail s2 = marketingService.getCMNumBYUserId("-2", "意向客户", " a.cst_type in (21, 22, 23 )", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s2_1 = marketingService.getCMNumBYUserId("21", "跟进中意向客户", " a.cst_type = 21 ", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s2_2 = marketingService.getCMNumBYUserId("22", "已逾期意向客户", " a.cst_type = 22 ", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s2_3 = marketingService.getCMNumBYUserId("23", "已流失意向客户", " a.cst_type = 23 ", bigCode, cityCode, projGUID, userId);
			List<CustomerNumDetail> list2 = new ArrayList<CustomerNumDetail>();
			list2.add(s2_1);
			list2.add(s2_2);
			list2.add(s2_3);
			s2.setList(list2);
			
			//租赁客户
			CustomerNumDetail s3 = marketingService.getCMNumBYUserId("-3", "租赁客户", " a.cst_type in (31, 32) ", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s3_1 = marketingService.getCMNumBYUserId("31", "有效租赁客户", " a.cst_type = 31 ", bigCode, cityCode, projGUID, userId);
			CustomerNumDetail s3_2 = marketingService.getCMNumBYUserId("32", "历史租赁客户", " a.cst_type = 32 ", bigCode, cityCode, projGUID, userId);
			List<CustomerNumDetail> list3 = new ArrayList<CustomerNumDetail>();
			list3.add(s3_1);
			list3.add(s3_2);
			s3.setList(list3);
			
			Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("total", totalCount);
	    	map.put("purchasedCustomer", s1);
	    	map.put("intentCustomer", s2);
	    	map.put("rentalCustomer", s3);
	    	
			return ResultMessage.successMsg("获取成功", map);
		}else{
			totalCount = marketingService.getAllRptYxCstModel(bigCode, cityCode, projGUID, " a.cst_type in (11, 12, 13, 14, 21, 22, 23, 31, 32)");
			
			//已购客户
			CustomerNumDetail s1 = marketingService.getCustomerModelNum("-1", "已购客户", " cst_type in (11, 12, 13, 14) ", bigCode, cityCode, projGUID);
			CustomerNumDetail s1_1 = marketingService.getCustomerModelNum("13", "投资客户", " cst_type = 13 ", bigCode, cityCode, projGUID);
			CustomerNumDetail s1_2 = marketingService.getCustomerModelNum("12", "自住客户", " cst_type = 12 ", bigCode, cityCode, projGUID);
			CustomerNumDetail s1_3 = marketingService.getCustomerModelNum("11", "期房客户", " cst_type = 11 ", bigCode, cityCode, projGUID);
			CustomerNumDetail s1_4 = marketingService.getCustomerModelNum("14", "流失业主", " cst_type = 14 ", bigCode, cityCode, projGUID);
			List<CustomerNumDetail> list1 = new ArrayList<CustomerNumDetail>();
			list1.add(s1_1);
			list1.add(s1_2);
			list1.add(s1_3);
			list1.add(s1_4);
			s1.setList(list1);
			
			//意向客户
			CustomerNumDetail s2 = marketingService.getCustomerModelNum("-2", "意向客户", " cst_type in (21, 22, 23 )", bigCode, cityCode, projGUID);
			CustomerNumDetail s2_1 = marketingService.getCustomerModelNum("21", "跟进中意向客户", " cst_type = 21 ", bigCode, cityCode, projGUID);
			CustomerNumDetail s2_2 = marketingService.getCustomerModelNum("22", "已逾期意向客户", " cst_type = 22 ", bigCode, cityCode, projGUID);
			CustomerNumDetail s2_3 = marketingService.getCustomerModelNum("23", "已流失意向客户", " cst_type = 23 ", bigCode, cityCode, projGUID);
			List<CustomerNumDetail> list2 = new ArrayList<CustomerNumDetail>();
			list2.add(s2_1);
			list2.add(s2_2);
			list2.add(s2_3);
			s2.setList(list2);
			
			//租赁客户
			CustomerNumDetail s3 = marketingService.getCustomerModelNum("-3", "租赁客户", " cst_type in (31, 32) ", bigCode, cityCode, projGUID);
			CustomerNumDetail s3_1 = marketingService.getCustomerModelNum("31", "有效租赁客户", " cst_type = 31 ", bigCode, cityCode, projGUID);
			CustomerNumDetail s3_2 = marketingService.getCustomerModelNum("32", "历史租赁客户", " cst_type = 32 ", bigCode, cityCode, projGUID);
			List<CustomerNumDetail> list3 = new ArrayList<CustomerNumDetail>();
			list3.add(s3_1);
			list3.add(s3_2);
			s3.setList(list3);
			
			Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("total", totalCount);
	    	map.put("purchasedCustomer", s1);
	    	map.put("intentCustomer", s2);
	    	map.put("rentalCustomer", s3);
	    	
			return ResultMessage.successMsg("获取成功", map);
		}
		
	}
	
	@RequestMapping(value = "/customerClassify/fetchData")
	public @ResponseBody ResultMessage getFetchData(HttpSession session, @RequestParam String bigCode, String cityCode, String projGUID, String cstType){
		if(bigCode == null || "".equals(bigCode)){
			return ResultMessage.errorMsg("参数请求错误");
		}
		if(cstType == null || "".equals(cstType)){
			return ResultMessage.errorMsg("参数请求错误");
		}
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		String paramStr = "";
		if("-1".equals(cstType)){
			paramStr = " a.cst_type in (11, 12, 13, 14) ";
		}else if("-2".equals(cstType)){
			paramStr = " a.cst_type in (21, 22, 23 )";
		}else if("-3".equals(cstType)){
			paramStr = " a.cst_type in (31, 32) ";
		}else{
			paramStr = " a.cst_type = " + cstType;
		}
		
		if("-1".equals(cityCode)){
			cityCode = null;
		}
		if("-1".equals(projGUID)){
			projGUID = null;
		}
		
		int total = 0;
		String paramStr1 = "";
		if(userId != 1){
			if(cityCode == null){
				paramStr1 = " and a.big_code = '" + bigCode + "' ";
			}else{
				if(projGUID == null){
					paramStr1 = " and a.city_code = '" + cityCode + "' ";
				}else{
					paramStr1 = " and a.proj_guid = '" + projGUID + "' ";
				}
			}
			total = marketingService.getRptYxCstModelByUserId(userId, paramStr1, paramStr);
		}else{
			total = marketingService.getAllRptYxCstModel(bigCode, cityCode, projGUID, paramStr);
		}
		List<CustomerModelData> list = null;
		if(userId != 1){
			list = marketingService.getCMDataByUserId(paramStr, bigCode, cityCode, projGUID, "select", userId);
		}else{
			list = marketingService.getCustomerModelData(paramStr, bigCode, cityCode, projGUID, "select");
		}
		if(list == null){
			list = new ArrayList<CustomerModelData>();
		}
		Map<String, Object> map = new HashMap<String, Object>();
    	map.put("total", total);
    	map.put("list", list);
		return ResultMessage.successMsg("获取成功", map);
	}
	
	@RequestMapping(value = "/customerClassify/exportData")
	public void exportClassifyData(HttpSession session, @RequestParam String bigCode, String bigName, String cityCode, String cityName, String projGuid, String projName, String cstType, String titleTop){
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user != null){
			int userId = user.getUserId();
			
			if(titleTop != null && !"".equals(titleTop)){
				String[] tops = titleTop.split(",");
				
				List<String> topList = new ArrayList<String>();
				for (String ss : tops) {
					topList.add(ss);
				}
				
				List<String> titleList = new ArrayList<String>();
				if(topList.contains("1")){
					titleList.add("姓名");
				}
				if(topList.contains("2")){
					titleList.add("手机号");
				}
				if(topList.contains("3")){
					titleList.add("邮箱");
				}
				if(topList.contains("4")){
					titleList.add("住址");
				}
				
				String paramStr = "";
				if("-1".equals(cstType)){
					paramStr = " a.cst_type in (11, 12, 13, 14) ";
				}else if("-2".equals(cstType)){
					paramStr = " a.cst_type in (21, 22, 23 )";
				}else if("-3".equals(cstType)){
					paramStr = " a.cst_type in (31, 32) ";
				}else{
					paramStr = " a.cst_type = " + cstType;
				}
				
				if("-1".equals(cityCode)){
					cityCode = null;
				}
				if("-1".equals(projGuid)){
					projGuid = null;
				}
				
				List<CustomerModelData> dataList = null;
				if(userId != 1){
					dataList = marketingService.getCMDataByUserId(paramStr, bigCode, cityCode, projGuid, "export", userId);
				}else{
					dataList = marketingService.getCustomerModelData(paramStr, bigCode, cityCode, projGuid, "export");
				}
				if(titleList != null && titleList.size() > 0 && dataList != null && dataList.size() > 0 && topList != null && topList.size() > 0){
					exportDataBasic(super.getResponse(), "客户分类模型数据", titleList, dataList, topList);
					
					//插日志
					ExtractLog extractLog = new ExtractLog();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String createTime = sdf.format(new Date());
					
					StringBuffer remark = new StringBuffer();
					remark.append(user.getUserName());
					remark.append("~" + bigCode + ":" + bigName);
					remark.append("~" + cityCode + ":" + cityName);
					remark.append("~" + projName);
					remark.append("~" + getCstTypeName(cstType));
					
					extractLog.setUserId(String.valueOf(userId));
					extractLog.setCreateTime(createTime);
					extractLog.setNum(dataList.size());
					extractLog.setType("1");	//客户分类模型
					extractLog.setRemark(remark.toString());
					if(projGuid == null){
						extractLog.setProjGUID("-1（选择了不限）");
					}else{
						extractLog.setProjGUID(projGuid);
					}
					marketingService.saveExportLog(extractLog);
				}
				
			}
		}else{
			log.error("未登录");
		}
		
	}
	
	public String getCstTypeName(String cstType){
		switch(cstType){
			case "-1":
				return "已购客户";
			case "-2":
				return "意向客户";
			case "-3":
				return "租赁客户";
			case "11":
				return "期房客户";
			case "12":
				return "自住客户";
			case "13":
				return "投资客户";
			case "14":
				return "流失业主";
			case "21":
				return "跟进中意向客户";
			case "22":
				return "已逾期意向客户";
			case "23":
				return "已流失意向客户";
			case "31":
				return "有效租赁客户";
			case "32":
				return "历史租赁客户";
			default:
				return String.valueOf(cstType);	
		}
	}
	
	/**
	 * 定向营销
	 */
	@RequestMapping(value = "/directed/getCoverage")
	public @ResponseBody ResultMessage getCoverage(HttpSession session){
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		
		List<Subs> areas = marketingService.getRptBProjSumArea();
		Subs area = null;
		Subs company = null;
		Subs project = null;
		int area_size = areas.size();
		int company_size = 0;
		int project_size = 0;
		for (int i = 0; i < area_size; i++) {
			area = areas.get(i);
			if(area != null){
				String areaId = area.getValue();
				if((areaId == null || "".equals(areaId)) || (area.getTitle() == null || "".equals(area.getTitle()))){
					areas.remove(i);
					i -= 1;
					area_size -= 1;
				}else{
					List<Subs> companys = marketingService.getRptBProjCity(areaId);
					company_size = companys.size();
					for (int j = 0; j < company_size; j++) {
						company = companys.get(j);
						if(company != null){
							String citycode = company.getValue();
							if((citycode == null || "".equals(citycode)) || (company.getTitle() == null || "".equals(company.getTitle()))){
								companys.remove(company);
								j -=1;
								company_size -= 1;
							}else{
								List<Subs> projects = marketingService.getRptBProjProject(citycode);
								project_size = projects.size();
								for (int k = 0; k < project_size; k++) {
									project = projects.get(k);
									if(project != null){
										String projId = project.getValue();
										if((projId == null || "".equals(projId)) || (project.getTitle() == null || "".equals(project.getTitle()))){
											projects.remove(project);
											k -=1;
											project_size -= 1;
										}
									}else{
										projects.remove(project);
										k -=1;
										project_size -= 1;
									}
								}
								companys.get(j).setSubs(projects);
							}
							areas.get(i).setSubs(companys);
						}else{
							companys.remove(company);
							j -=1;
							company_size -= 1;
						}
					}
				}
			}
			else{
				areas.remove(i);
				i -= 1;
				area_size -= 1;
			}
		}
		if(userId == 1){
			List<Subs> provinces = marketingService.getRptYxCstModelProvince();
			if(provinces != null && provinces.size() > 0){
				Subs province = provinces.get(0);
				if(province != null){
					String provinceId = province.getValue();
					List<Subs> citys = marketingService.getRptYxCstModelCity(provinceId);
					provinces.get(0).setSubs(citys);
				}
				
//				for (int i = 0; i < provinces.size(); i++) {
//					province = provinces.get(i);
//					if(province != null){
//						String provinceId = province.getValue();
//						List<Subs> citys = marketingService.getRptYxCstModelCity(provinceId);
//						provinces.get(i).setSubs(citys);
//					}
//				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("areas", areas);
	    	map.put("provinces", provinces);
			
			return ResultMessage.successMsg("获取成功", map);
		}else{
			List<Subs> provinces = marketingService.getRptYCMPByUserId(userId);
			if(provinces != null && provinces.size() > 0){
				Subs province = provinces.get(0);
				if(province != null){
					String provinceId = province.getValue();
					List<Subs> citys = marketingService.getRYCMCByUserId(provinceId, userId);
					provinces.get(0).setSubs(citys);
				}
				
//				for (int i = 0; i < provinces.size(); i++) {
//					province = provinces.get(i);
//					if(province != null){
//						String provinceId = province.getValue();
//						List<Subs> citys = marketingService.getRYCMCByUserId(provinceId, userId);
//						provinces.get(i).setSubs(citys);
//					}
//				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("areas", areas);
	    	map.put("provinces", provinces);
			
			return ResultMessage.successMsg("获取成功", map);
		}
		
	}
	
	@RequestMapping(value = "/directed/getProCitys")
	public @ResponseBody ResultMessage getProCitys(HttpSession session, @RequestParam String provinceId){
		
		if(provinceId == null || "".equals(provinceId)){
			return ResultMessage.errorMsg("参数错误");
		}
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		if(userId == 1){
			List<Subs> citys = marketingService.getRptYxCstModelCity(provinceId);
			
			Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("proCitys", citys);
			
			return ResultMessage.successMsg("获取成功", map);
		}else{
			List<Subs> citys = marketingService.getRYCMCByUserId(provinceId, userId);
			
			Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("proCitys", citys);
			
			return ResultMessage.successMsg("获取成功", map);
		}
	}
	
	@RequestMapping(value = "/directed/getFetchData")
	public @ResponseBody ResultMessage getDirectFetchData(HttpSession session, @RequestParam String analysisType, String cityName, String houseCityCode){
		if(analysisType == null || "".equals(analysisType) || (!"1".equals(analysisType) && !"2".equals(analysisType))){
			return ResultMessage.errorMsg("分析类型错误");
		}
		if(cityName == null || "".equals(cityName)){
			return ResultMessage.errorMsg("所在地参数错误");
		}
		if(houseCityCode == null || "".equals(houseCityCode)){
			return ResultMessage.errorMsg("已购房产所在地错误");
		}
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		cityName = marketingService.getCityNameByCityName(cityName) + "市";
		
		String sqlStr = "";
		if("1".equals(analysisType)){
			sqlStr = " and a.household_city_name = '" + cityName + "'";
		}else{
			sqlStr = " and a.work_city_name = '" + cityName + "'";
		}
		
		if(userId == 1){
			int total = marketingService.getFetchDataNum(houseCityCode, sqlStr);
			List<CustomerModelData> list = marketingService.getFetchData(houseCityCode, sqlStr, null);
			
			Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("list", list);
	    	map.put("total", total);
	    	
			return ResultMessage.successMsg("获取成功", map);
		}else{
			int total = marketingService.getFDNumByUserId(houseCityCode, sqlStr, userId);
			List<CustomerModelData> list = marketingService.getFDByUserId(houseCityCode, sqlStr, null, userId);
			
			Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("list", list);
	    	map.put("total", total);
	    	
			return ResultMessage.successMsg("获取成功", map);
		}
		
	}
	
	@RequestMapping(value = "/directed/exportData")
	public void exportData(HttpSession session, @RequestParam String analysisType, String cityCode, String cityName, String projGuid, String projName, String houseCityCode, String houseCityName, String titleTop){
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user != null){
			int userId = user.getUserId();
			
			if(titleTop != null && !"".equals(titleTop)){
				String[] tops = titleTop.split(",");
				
				List<String> topList = new ArrayList<String>();
				for (String ss : tops) {
					topList.add(ss);
				}
				
				cityName = marketingService.getCityNameByCityName(cityName) + "市";
				
				String sqlStr = "";
				if("1".equals(analysisType)){
					sqlStr = " and a.household_city_name = '" + cityName + "'";
				}else{
					sqlStr = " and a.work_city_name = '" + cityName + "'";
				}
				List<String> titleList = new ArrayList<String>();
				
				if(topList.contains("1")){
					titleList.add("姓名");
				}
				if(topList.contains("2")){
					titleList.add("手机号");
				}
				if(topList.contains("3")){
					titleList.add("邮箱");
				}
				if(topList.contains("4")){
					titleList.add("住址");
				}
				
				List<CustomerModelData> dataList = null;
				if(userId == 1){
					dataList = marketingService.getFetchData(houseCityCode, sqlStr, "notLimit");
				}else{
					dataList = marketingService.getFDByUserId(houseCityCode, sqlStr, "notLimit", userId);
				}
				
				if(titleList != null && titleList.size() > 0 && dataList != null && dataList.size() > 0 && topList != null && topList.size() > 0){
					exportDataBasic(super.getResponse(), "定向营销数据", titleList, dataList, topList);
					
					//插日志
					ExtractLog extractLog = new ExtractLog();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String createTime = sdf.format(new Date());
					
					StringBuffer remark = new StringBuffer();
					remark.append(user.getUserName());
					remark.append("~已购房产所在地:" + houseCityCode + ":" + houseCityName);
					remark.append("~" + projName);
					if("1".equals(analysisType)){
						remark.append("~户籍异地购房");
						remark.append("~户籍所在地:" + cityCode + ":" + cityName);
					}else{
						remark.append("~工作异地购房");
						remark.append("~工作所在地:" + cityCode + ":" + cityName);
					}
					
					extractLog.setUserId(String.valueOf(userId));
					extractLog.setCreateTime(createTime);
					extractLog.setNum(dataList.size());
					extractLog.setType("1");	//客户分类模型
					extractLog.setRemark(remark.toString());
					extractLog.setProjGUID(projGuid);
					
					marketingService.saveExportLog(extractLog);
				}
				
			}
		}else{
			log.error("未登录");
		}
			
	}
	
	
	public void exportDataBasic(HttpServletResponse response, String title, List<String> titleList, List<CustomerModelData> dataList, List<String> topList){
		
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 生成一个表格
		HSSFSheet sheet = workbook.createSheet(title);
		
		//居中样式
		HSSFCellStyle titlestyle = (HSSFCellStyle) workbook.createCellStyle();
		titlestyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);    //设置垂直居中  
		titlestyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);   //设置水平居中 
		
		HSSFCellStyle titlestyle2 = (HSSFCellStyle) workbook.createCellStyle();
		titlestyle2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);    //设置垂直居中  
		titlestyle2.setAlignment(HSSFCellStyle.ALIGN_CENTER);   //设置水平居中 
		
		HSSFFont font = workbook.createFont();
		font.setFontName("黑体");
		font.setFontHeightInPoints((short) 16);//设置字体大小
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//粗体显示
		// 把字体应用到当前的样式
		titlestyle.setFont(font);
		
		//产生表格标题行
		HSSFRow row = null;
		HSSFCell nCell = null;
		HSSFRichTextString text = null;
		
		/**
		 * 第一行(标题)
		 */
		row = sheet.createRow(0);
		row.setHeightInPoints(30);
		String obj = null;
		for (int i = 0; i < titleList.size(); i++) {
			obj = titleList.get(i);
			nCell = row.createCell(i);
			nCell.setCellStyle(titlestyle);
			text = new HSSFRichTextString(obj);
			nCell.setCellValue(text);
		}
		
		CustomerModelData cmd = null;
		for (int i = 0; i < dataList.size(); i++) {
			int tt = 1;
			cmd = dataList.get(i);
			row = sheet.createRow( 1 + i);
			row.setHeightInPoints(30);
			
			if(topList.contains("1")){
				sheet.setColumnWidth(1 - tt, 20*256);
				nCell = row.createCell(1 - tt);
				nCell.setCellStyle(titlestyle2);
				text = new HSSFRichTextString(cmd.getName());
				nCell.setCellValue(text);
			}else{
				tt += 1;
			}
			
			if(topList.contains("2")){
				sheet.setColumnWidth(2 - tt, 30*256);
				nCell = row.createCell(2 - tt);
				nCell.setCellStyle(titlestyle2);
				text = new HSSFRichTextString(cmd.getTel());
				nCell.setCellValue(text);
			}else{
				tt += 1;
			}

			if(topList.contains("3")){
				sheet.setColumnWidth(3 - tt, 30*256);
				nCell = row.createCell(3 - tt);
				nCell.setCellStyle(titlestyle2);
				text = new HSSFRichTextString(cmd.getEmail());
				nCell.setCellValue(text);
			}else{
				tt += 1;
			}
			
			if(topList.contains("4")){
				sheet.setColumnWidth(4 - tt, 80*256);
				nCell = row.createCell(4 - tt);
				nCell.setCellStyle(titlestyle2);
				text = new HSSFRichTextString(cmd.getAddress());
				nCell.setCellValue(text);
			}
			
		}
		
		try {
			String fileName = title + ".xls";
			// 设置导出文件的头信息
			response.setContentType("application/x-download");
			response.setHeader("Content-disposition", "attachment; filename="+ new String(fileName.getBytes("GB2312"),"ISO8859-1")); 
			OutputStream out = response.getOutputStream();
			workbook.write(out);
			out.close();
		} catch (IOException e) {
			log.error("提取失败", e);
		}
	}
	
}
