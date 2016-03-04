package com.sxit.mgt.pmp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.utils.JsonUtils;
import com.sxit.config.SysConfig;
import com.sxit.mgt.pmp.dao.RptProjCompleteDao;
import com.sxit.mgt.pmp.dto.Data;
import com.sxit.mgt.pmp.dto.Deal;
import com.sxit.mgt.pmp.dto.DealCity;
import com.sxit.mgt.pmp.dto.DealProject;
import com.sxit.mgt.pmp.dto.CustomerFeature;
import com.sxit.mgt.pmp.dto.Arr;
import com.sxit.model.pmp.RptProjComplete;
import com.sxit.model.pmp.RptProjCstArea;
import com.sxit.model.pmp.RptProjHouse;
import com.sxit.model.pmp.RptProjBusiness;
import com.sxit.model.pmp.RptProjProperties;
import com.sxit.model.pmp.RptResidentialSale;
import com.sxit.model.pmp.BProjSum;
import com.sxit.model.pmp.RptContract;
import com.sxit.model.pmp.RptZyProjRentSale;
import com.sxit.model.pmp.RptZyStoreRank;
import com.sxit.model.system.BaseUser;
import com.sxit.mgt.pmp.service.RptProjCompleteService;
import com.sxit.mgt.pmp.service.RptProjHouseService;
import com.sxit.mgt.pmp.service.RptProjBusinessService;
import com.sxit.mgt.pmp.service.RptProjPropertiesService;
import com.sxit.mgt.pmp.service.RptResidentialSaleService;
import com.sxit.mgt.pmp.service.BProjSumService;
import com.sxit.mgt.pmp.service.RptContractService;
import com.sxit.mgt.pmp.service.RptZyProjRentSaleService;
import com.sxit.mgt.pmp.service.RptZyStoreRankService;
import com.sxit.mgt.reports.dto.ProductProjectData;
import com.sxit.mgt.reports.dto.SplineSeriesDto;


@Controller 
@RequestMapping("/rptProjComplete")
public class RptProjCompleteAction{
	
	private final static Logger log= Logger.getLogger(RptProjCompleteAction.class);
	
	@Autowired
	private RptProjCompleteService rptProjCompleteService;
	
	@Autowired
	private RptProjHouseService rptProjHouseService;
	
	@Autowired
	private RptProjBusinessService rptProjBusinessService;
	
	@Autowired
	private RptProjPropertiesService rptProjPropertiesService;
	
	@Autowired
	private RptResidentialSaleService rptResidentialSaleService;
	
	@Autowired
	private BProjSumService bProjSumService;
	
	@Autowired
	private RptContractService rptContractService;
	
	@Autowired
	private RptZyProjRentSaleService rptZyProjRentSaleService;
	
	@Autowired
	private RptZyStoreRankService  rptZyStoreRankService;
	
	@RequestMapping(value = "/projComplete")
	public @ResponseBody
	ResultMessage queryByAll(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {
		BaseUser user = null;
		Map map = null;

		
		if (session == null || session.getAttribute("baseUser") == null) {
			returnJsonMsg(ResultMessage.errorMsg("登录过期", 3), response);
			try {
				response.sendRedirect(SysConfig.webUrl + "/auth/login");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
				user = (BaseUser)session.getAttribute("baseUser");
				
				/*
				 * 1 为集团管理员
				 */
				if(user.getUserId().equals(1)){
					RptProjComplete rptProjComplete = rptProjCompleteService.queryByAll(); //全部项目
					if(rptProjComplete != null){
						rptProjComplete.setYesterday_deal((double) Math.round(rptProjComplete.getYesterday_deal() / 10000));
						rptProjComplete.setMonth_deal((double) Math.round(rptProjComplete.getMonth_deal() / 100000000));
						rptProjComplete.setQuarter_deal((double) Math.round(rptProjComplete.getQuarter_deal() / 100000000));
						rptProjComplete.setYear_deal((double) Math.round(rptProjComplete.getYear_deal() / 100000000));
					}
	
					RptProjHouse rptProjHouse = rptProjHouseService.queryByAll(); //住宅项目
					if(rptProjHouse != null){
						rptProjHouse.setProj_deal01((double) Math.round(rptProjHouse.getProj_deal01()/10000));
						rptProjHouse.setProj_deal02((double) Math.round(rptProjHouse.getProj_deal02()/100000000));
						rptProjHouse.setProj_deal03((double) Math.round(rptProjHouse.getProj_deal03()/100000000));
						rptProjHouse.setProj_deal04((double) Math.round(rptProjHouse.getProj_deal04()/100000000));
					}
					
					RptProjBusiness rptProjBusiness = rptProjBusinessService.queryByAll(); //商业项目
					if(rptProjBusiness != null){
						rptProjBusiness.setProj_deal01((Integer) Math.round(rptProjBusiness.getProj_deal01()/10000));
						rptProjBusiness.setProj_deal02((Integer) Math.round(rptProjBusiness.getProj_deal02()/100000000));
						rptProjBusiness.setProj_deal03((Integer) Math.round(rptProjBusiness.getProj_deal03()/100000000));
						rptProjBusiness.setProj_deal04((Integer) Math.round(rptProjBusiness.getProj_deal04()/100000000));
					}
					
					RptProjProperties rptProjProperties = rptProjPropertiesService.queryByAll(); //置业项目
					if(rptProjProperties != null){
						rptProjProperties.setProj_deal01((double) Math.round(rptProjProperties.getProj_deal01()/10000));
						rptProjProperties.setProj_deal02((double) Math.round(rptProjProperties.getProj_deal02()/100000000));
						rptProjProperties.setProj_deal03((double) Math.round(rptProjProperties.getProj_deal03()/100000000));
						rptProjProperties.setProj_deal04((double) Math.round(rptProjProperties.getProj_deal04()/100000000));
						rptProjProperties.setProj_deal05((double) Math.round(rptProjProperties.getProj_deal05()/10000));
						rptProjProperties.setProj_deal06((double) Math.round(rptProjProperties.getProj_deal06()/100000000));
						rptProjProperties.setProj_deal07((double) Math.round(rptProjProperties.getProj_deal07()/100000000));
						rptProjProperties.setProj_deal08((double) Math.round(rptProjProperties.getProj_deal08()/100000000));
					}
					
					RptZyProjRentSale rptZyProjRentSale = rptZyProjRentSaleService.queryByAll(); //置业项目
					if(rptZyProjRentSale != null){
					   rptZyProjRentSale.setSale_yest_deal((double) Math.round(rptZyProjRentSale.getSale_yest_deal()/10000));
					   rptZyProjRentSale.setSale_month_deal((double) Math.round(rptZyProjRentSale.getSale_month_deal()/10000));
					   rptZyProjRentSale.setSale_season_deal((double) Math.round(rptZyProjRentSale.getSale_season_deal()/10000));
					   rptZyProjRentSale.setSale_year_deal((double) Math.round(rptZyProjRentSale.getSale_year_deal()/10000));
					   rptZyProjRentSale.setRent_yest_deal((double) Math.round(rptZyProjRentSale.getRent_yest_deal()/10000));
					   rptZyProjRentSale.setRent_month_deal((double) Math.round(rptZyProjRentSale.getRent_month_deal()/10000));
					   rptZyProjRentSale.setRent_season_deal((double) Math.round(rptZyProjRentSale.getRent_season_deal()/10000));
					   rptZyProjRentSale.setRent_year_deal((double) Math.round(rptZyProjRentSale.getRent_year_deal()/10000));
					}
					
					List<RptZyStoreRank> rptZyStoreRank = rptZyStoreRankService.queryByTop();
					for (RptZyStoreRank bproj : rptZyStoreRank) {
						bproj.setStore_deal_amount((double) Math.round(bproj.getStore_deal_amount() / 10000));
					}
					
					
					RptResidentialSale rptResidentialSale = rptResidentialSaleService.queryByAll(); //住宅销售分析
					
					List<BProjSum> bProjSum  =  bProjSumService.queryByTop();
					for (BProjSum bproj : bProjSum) {
						bproj.setSaleamountsum((double) Math.round(bproj.getSaleamountsum() / 10000));
					}
					
					
			        List<BProjSum> bprojarea = bProjSumService.queryByAreaSum(null);
					
					Deal deal = new Deal(); //VO类
					List<Object> data1List = new ArrayList<Object>(); //存放区域名称
					List<Data> data2List = new ArrayList<Data>();     //存放区域汇总数据
					List<Object> areaList = new ArrayList<Object>(); //存放区域code的数组
					Data data  = null;
					String uuid =null;
					
					for (int i = 0; i < bprojarea.size(); i++) {
						uuid = UUID.randomUUID().toString();
						BProjSum bproj = bprojarea.get(i);
						data1List.add(bproj.getBig_name());
						data = new Data();
						data.setId(bproj.getBig_code()); //填充区域code
						data.setType("area");
						data.setY((double) Math.round(bproj.getSaleamountsum() / 10000));
						areaList.add(data.getId());
						data2List.add(data);
					}
					//区域汇总数据
					deal.setCategories(data1List);
					deal.setData(data2List);
					
					
					RptProjComplete b_org = (RptProjComplete) rptProjCompleteService.queryByB_OrgAdmin();	
					List<RptContract> rptContractTitle = rptContractService.queryByDistinct();
					List<CustomerFeature> customerFeature = new ArrayList<CustomerFeature>();
					List<RptContract> rpttitle = rptContractService.queryByDistinct();
					
					for(int i=0;i<rpttitle.size();i++){
						List<RptContract> rptContract = rptContractService.queryByList(rpttitle.get(i).getType_id(),b_org.getCity_code());
						CustomerFeature c = new CustomerFeature();
						List<Arr> arrList = new ArrayList<Arr>();
						for (int j = 0; j < rptContract.size(); j++) {
							RptContract rpc = rptContract.get(j);
							if(j==1){
								c.setTitle(rpttitle.get(i).getIndex_name());
							}
							Arr arr = new Arr();
							arr.setName(rpc.getIndex_name());
							arr.setPercent(Double.parseDouble(rpc.getDime_value()));
							arrList.add(arr);
				        }
						c.setArr(arrList);
						customerFeature.add(c);
					}
					try {
						String strarea = gnerateJsonFromObject(deal);
						String jsonstr = gnerateJsonFromObject(customerFeature);
						System.out.println("deal:"+strarea);
						System.out.println("customerFeature:"+jsonstr);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					map = new HashMap();
					map.put("rptProjComplete", rptProjComplete);
					map.put("rptProjHouse", rptProjHouse);
					map.put("rptProjBusiness", rptProjBusiness);
					map.put("rptProjProperties",rptProjProperties);
					map.put("rptZyProjRentSale", rptZyProjRentSale);
					map.put("rptResidentialSale", rptResidentialSale);
					map.put("rptZyStoreRank", rptZyStoreRank);
					map.put("bProjSum", bProjSum);
					map.put("deal", deal);
					map.put("customerFeature", customerFeature);
				}else{
					
					//1.获取组织架构
					RptProjComplete b_org = (RptProjComplete) rptProjCompleteService.queryByB_Org(user.getUserId());
					//2.按组织架构的big_code,city_code获取数据
					RptProjComplete rptProjComplete = rptProjCompleteService.querySeq(b_org.getBig_code(),b_org.getCity_code()); //全部项目
					
					if(rptProjComplete != null){
						rptProjComplete.setYesterday_deal((double) Math.round(rptProjComplete.getYesterday_deal() / 10000));
						rptProjComplete.setMonth_deal((double) Math.round(rptProjComplete.getMonth_deal() / 100000000));
						rptProjComplete.setQuarter_deal((double) Math.round(rptProjComplete.getQuarter_deal() / 100000000));
						rptProjComplete.setYear_deal((double) Math.round(rptProjComplete.getYear_deal() / 100000000));
					}
					
					RptProjHouse rptProjHouse = rptProjHouseService.querySeq(b_org.getBig_code(),b_org.getCity_code()); //住宅项目
					if(rptProjHouse != null){
						rptProjHouse.setProj_deal01((double) Math.round(rptProjHouse.getProj_deal01()/10000));
						rptProjHouse.setProj_deal02((double) Math.round(rptProjHouse.getProj_deal02()/100000000));
						rptProjHouse.setProj_deal03((double) Math.round(rptProjHouse.getProj_deal03()/100000000));
						rptProjHouse.setProj_deal04((double) Math.round(rptProjHouse.getProj_deal04()/100000000));
					}
					
					RptProjBusiness rptProjBusiness = rptProjBusinessService.querySeq(b_org.getBig_code(),b_org.getCity_code()); //商业项目
					if(rptProjBusiness != null){
						rptProjBusiness.setProj_deal01((Integer) Math.round(rptProjBusiness.getProj_deal01()/10000));
						rptProjBusiness.setProj_deal02((Integer) Math.round(rptProjBusiness.getProj_deal02()/100000000));
						rptProjBusiness.setProj_deal03((Integer) Math.round(rptProjBusiness.getProj_deal03()/100000000));
						rptProjBusiness.setProj_deal04((Integer) Math.round(rptProjBusiness.getProj_deal04()/100000000));
					}
					
					/*RptProjProperties rptProjProperties = rptProjPropertiesService.querySeq(b_org.getBig_code(),b_org.getCity_code()); //置业项目
					if(rptProjProperties != null){
						rptProjProperties.setProj_deal01((double) Math.round(rptProjProperties.getProj_deal01()/10000));
						rptProjProperties.setProj_deal02((double) Math.round(rptProjProperties.getProj_deal02()/100000000));
						rptProjProperties.setProj_deal03((double) Math.round(rptProjProperties.getProj_deal03()/100000000));
						rptProjProperties.setProj_deal04((double) Math.round(rptProjProperties.getProj_deal04()/100000000));
						rptProjProperties.setProj_deal05((double) Math.round(rptProjProperties.getProj_deal05()/10000));
						rptProjProperties.setProj_deal06((double) Math.round(rptProjProperties.getProj_deal06()/100000000));
						rptProjProperties.setProj_deal07((double) Math.round(rptProjProperties.getProj_deal07()/100000000));
						rptProjProperties.setProj_deal08((double) Math.round(rptProjProperties.getProj_deal08()/100000000));
					}*/
					
					RptZyProjRentSale rptZyProjRentSale = rptZyProjRentSaleService.queryByAll(); //置业项目
					if(rptZyProjRentSale != null){
					   rptZyProjRentSale.setSale_yest_deal((double) Math.round(rptZyProjRentSale.getSale_yest_deal()/10000));
					   rptZyProjRentSale.setSale_month_deal((double) Math.round(rptZyProjRentSale.getSale_month_deal()/10000));
					   rptZyProjRentSale.setSale_season_deal((double) Math.round(rptZyProjRentSale.getSale_season_deal()/10000));
					   rptZyProjRentSale.setSale_year_deal((double) Math.round(rptZyProjRentSale.getSale_year_deal()/10000));
					   rptZyProjRentSale.setRent_yest_deal((double) Math.round(rptZyProjRentSale.getRent_yest_deal()/10000));
					   rptZyProjRentSale.setRent_month_deal((double) Math.round(rptZyProjRentSale.getRent_month_deal()/10000));
					   rptZyProjRentSale.setRent_season_deal((double) Math.round(rptZyProjRentSale.getRent_season_deal()/10000));
					   rptZyProjRentSale.setRent_year_deal((double) Math.round(rptZyProjRentSale.getRent_year_deal()/10000));
					}
					
					List<RptZyStoreRank> rptZyStoreRank = rptZyStoreRankService.queryByTop();
					for (RptZyStoreRank bproj : rptZyStoreRank) {
						bproj.setStore_deal_amount((double) Math.round(bproj.getStore_deal_amount() / 10000));
					}
					
					
					RptResidentialSale rptResidentialSale = rptResidentialSaleService.querySeq(b_org.getBig_code(),b_org.getCity_code()); //住宅销售分析
					
					List<BProjSum> bProjSum  =  bProjSumService.queryBySeqTop(b_org.getBig_code(),b_org.getCity_code());
					for (BProjSum bproj : bProjSum) {
						bproj.setSaleamountsum((double) Math.round(bproj.getSaleamountsum() / 10000));
					}
					
					List<BProjSum> bprojarea = bProjSumService.queryByAreaSum(null);
					
					Deal deal = new Deal(); //VO类
					List<Object> data1List = new ArrayList<Object>(); //存放区域名称
					List<Data> data2List = new ArrayList<Data>();     //存放区域汇总数据
					List<Object> areaList = new ArrayList<Object>(); //存放区域code的数组
					Data data  = null;
					String uuid =null;
					
					for (int i = 0; i < bprojarea.size(); i++) {
						uuid = UUID.randomUUID().toString();
						BProjSum bproj = bprojarea.get(i);
						data1List.add(bproj.getBig_name());
						data = new Data();
						data.setId(bproj.getBig_code()); //填充区域code
						data.setType("area");
						data.setY((double) Math.round(bproj.getSaleamountsum() / 10000));
						areaList.add(data.getId());
						data2List.add(data);
					}
					//区域汇总数据
					deal.setCategories(data1List);
					deal.setData(data2List);
	
					List<RptContract> rptContractTitle = rptContractService.queryByDistinct();
					List<CustomerFeature> customerFeature = new ArrayList<CustomerFeature>();
					List<RptContract> rpttitle = rptContractService.queryByDistinct();
					
					for(int i=0;i<rpttitle.size();i++){
						List<RptContract> rptContract = rptContractService.queryByList(rpttitle.get(i).getType_id(),b_org.getCity_code());
						CustomerFeature c = new CustomerFeature();
						List<Arr> arrList = new ArrayList<Arr>();
						for (int j = 0; j < rptContract.size(); j++) {
							RptContract rpc = rptContract.get(j);
							if(j==1){
								c.setTitle(rpttitle.get(i).getIndex_name());
							}
							Arr arr = new Arr();
							arr.setName(rpc.getIndex_name());
							arr.setPercent(Double.parseDouble(rpc.getDime_value()));
							arrList.add(arr);
				        }
						c.setArr(arrList);
						customerFeature.add(c);
					}
					try {
						String strarea = gnerateJsonFromObject(deal);
						String jsonstr = gnerateJsonFromObject(customerFeature);
						System.out.println("deal:"+strarea);
						System.out.println("customerFeature:"+jsonstr);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					map = new HashMap();
					map.put("rptProjComplete", rptProjComplete);
					map.put("rptProjHouse", rptProjHouse);
					map.put("rptProjBusiness", rptProjBusiness);
					map.put("rptZyProjRentSale", rptZyProjRentSale);
					map.put("rptZyStoreRank",rptZyStoreRank);
					map.put("rptResidentialSale", rptResidentialSale);
					map.put("bProjSum", bProjSum);
					map.put("deal", deal);
					map.put("customerFeature", customerFeature);
			}
		}

		
		
		
		
		/* 
		 * 按组织架构获得区域，城市，项目的汇总json
		 */
		/*List<BProjSum> bprojarea = bProjSumService.queryByAreaSum();
		
		Deal deal = new Deal(); //VO类
		List<Object> data1List = new ArrayList<Object>(); //存放区域名称
		List<Data> data2List = new ArrayList<Data>();     //存放区域汇总数据
		List<Object> areaList = new ArrayList<Object>(); //存放区域code的数组
		Data data  = null;
		String uuid =null;
		
		for (int i = 0; i < bprojarea.size(); i++) {
			uuid = UUID.randomUUID().toString();
			BProjSum bproj = bprojarea.get(i);
			data1List.add(bproj.getArea_id());
			data = new Data();
			data.setId(bproj.getArea_code()); //填充区域code
			data.setType("area");
			data.setY((double) Math.round(bproj.getSaleamountsum() / 10000));
			areaList.add(data.getId());
			data2List.add(data);
		}
		//区域汇总数据
		deal.setCategories(data1List);
		deal.setData(data2List);
		
		DealCity dealCity = new DealCity(); //VO类
		List<Object> city1List = new ArrayList<Object>();  //存放城市名称
		List<Data> city2List = new ArrayList<Data>();      //存放城市汇总数据
		List<Object> cityList = new ArrayList<Object>(); //存放城市code的数组
		List<BProjSum> bprojcityCode = null;
		Data dataCity  = null;
		BProjSum bproj = null;

		for(int j=0;j<data1List.size();j++){ 
			bprojcityCode = bProjSumService.queryBycityCodeSum((String) areaList.get(j));  //根据区域查询城市列表汇总数据
			for(int k=0;k<bprojcityCode.size();k++){
				bproj = bprojcityCode.get(k);
				city1List.add(bproj.getCityCode());
				data = new Data();
				data.setId(bproj.getCity_code()); //填充城市code
				data.setType("city");
				data.setY((double) Math.round(bproj.getSaleamountsum() / 10000));
				cityList.add(data.getId());
				city2List.add(data);
			}
		}
		//城市汇总数据
		dealCity.setCategories(city1List);
		dealCity.setData(city2List);
		
		DealProject dealProject = new DealProject();
		List<Object> project1List = new ArrayList<Object>(); //存放项目名称
		List<Data> project2List = new ArrayList<Data>();     //存放项目汇总数据
		List<BProjSum> bprojproject = null;
		List<Object> uuid2List = new ArrayList<Object>(); //存放UUID的数组
		Data dataProject  = null;
		
		
		for(int j=0;j<city1List.size();j++){
			bprojproject = bProjSumService.queryByProjSum((String) cityList.get(j)); //根据城市查询项目列表汇总数据
			for(int k=0;k<bprojproject.size();k++){
				bproj = bprojproject.get(k);
				project1List.add(bproj.getProj_name());
				data = new Data();
				data.setId(bproj.getProj_guid()); //填充proj_guid
				data.setType("project");
				data.setY((double) Math.round(bproj.getSaleamountsum() / 10000));
				project2List.add(data);
			}
		}

		//项目汇总数据
		dealProject.setCategories(project1List);
		dealProject.setData(project2List);*/
		
		
		
		/*map.put("dealCity", dealCity);
		map.put("dealProject", dealProject);*/
		
		return ResultMessage.successMsg("获取成功", map);
	}
	
	
	@RequestMapping(value = "/cityData")
	public @ResponseBody
	ResultMessage queryCity(@RequestParam String id,String type) {
		
		List<BProjSum> bprojcityCode = bProjSumService.queryBycityCodeSum(id);
		
		DealCity dealCity = new DealCity();
		List<Object> city1List = new ArrayList<Object>();
		List<Data> city2List = new ArrayList<Data>();
		Data data  = null;
		
		for (int i = 0; i < bprojcityCode.size(); i++) {
			BProjSum bproj = bprojcityCode.get(i);
			city1List.add(bproj.getCity_name());
			data = new Data();
			data.setId(bproj.getCity_Code()); //填充城市code
			data.setType("city");
			data.setY((double) Math.round(bproj.getSaleamountsum() / 10000));
			city2List.add(data);
		}
		//城市汇总数据
		dealCity.setCategories(city1List);
		dealCity.setData(city2List);
		
		try {
			String strarea = gnerateJsonFromObject(dealCity);
			System.out.println("dealCity:"+strarea);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("dealCity", dealCity);
		return ResultMessage.successMsg("获取成功", map);
	}
	
	
	@RequestMapping(value = "/projectData")
	public @ResponseBody
	ResultMessage queryProject(@RequestParam String id,String type) {
		
		List<BProjSum> bprojprojCode = bProjSumService.queryByProjSum(id);
		
		DealCity dealProject = new DealCity();
		List<Object> proj1List = new ArrayList<Object>();
		List<Data> proj2List = new ArrayList<Data>();
		Data data  = null;
		
		for (int i = 0; i < bprojprojCode.size(); i++) {
			BProjSum bproj = bprojprojCode.get(i);
			proj1List.add(bproj.getProj_name());
			data = new Data();
			data.setId(bproj.getProj_guid()); //填充proj_guid
			data.setType("project");
			data.setY((double) Math.round(bproj.getSaleamountsum() / 10000));
			proj2List.add(data);
		}
		//项目汇总数据
		dealProject.setCategories(proj1List);
		dealProject.setData(proj2List);
		
		try {
			String strarea = gnerateJsonFromObject(dealProject);
			System.out.println("dealProject:"+strarea);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map map = new HashMap();
		map.put("dealProject", dealProject);
		return ResultMessage.successMsg("获取成功", map);
	}

	public static String gnerateJsonFromObject(Object object) throws Exception {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(object);
	}
	
	/**
	 * @Title: returnJsonMsg
	 * @Description: (返回Json消息)
	 * @param msg
	 * @param response
	 * @return void
	 * @throws
	 */
	public void returnJsonMsg(ResultMessage res, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			response.setContentType("text/json;charset=utf-8");
			response.setCharacterEncoding("utf-8");

			String msg = JsonUtils.toJson(res);
			out.print(msg);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

}
