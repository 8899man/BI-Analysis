package com.sxit.mgt.reports.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxit.common.dto.ResultMessage;
import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.mgt.reports.dto.LastDataDto;
import com.sxit.mgt.reports.dto.Map2Data;
import com.sxit.mgt.reports.dto.ProductProjectData;
import com.sxit.mgt.reports.dto.SplineSeriesDto;
import com.sxit.mgt.reports.dto.YeTaiDataDto;
import com.sxit.mgt.reports.dto.YeTaiMap2;
import com.sxit.mgt.reports.dto.YeTaiZhuanShuDataDto;
import com.sxit.mgt.reports.service.BAreaCompanyService;
import com.sxit.mgt.system.service.BOrgService;
import com.sxit.model.system.BaseUser;

@Controller
@RequestMapping("/report")
public class Product {
	
	@Autowired
	private BAreaCompanyService bAreaCompanyService;
	
	@Autowired
	private BOrgService bOrgService;

//	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/product/turnoverProduct")
	public @ResponseBody
	ResultMessage init(HttpSession session) {
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		List<BAreaCompany> arealist = new ArrayList<BAreaCompany>();
//------------------------------------------------------		List<BAreaCompany> list = bAreaCompanyService.getAreaList();
		List<BAreaCompany> list = null;
		if(userId == 1){
			list = bOrgService.getAreaOrCompany(2, null);
		}else{
			list = bOrgService.getAreaByUserId(userId);
		}
		if(userId == 1){
			BAreaCompany bac1 = new BAreaCompany();
			bac1.setName("总公司");
			bac1.setId("0");
			arealist.add(bac1);
		}
		arealist.addAll(list);
		return ResultMessage.successMsg("获取成功", arealist);
	}
	
//	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/product/getCompany")
	public @ResponseBody
	ResultMessage getCompany(HttpSession session, @RequestParam String areaCode) {
		if(areaCode == null){
			return ResultMessage.errorMsg("获取数据失败");
		}
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		List<BAreaCompany> arealist = new ArrayList<BAreaCompany>();
		if(!"0".equals(areaCode)){
//------------------------------------------------------			List<BAreaCompany> list = bAreaCompanyService.getCompanyList(areaCode);
//			List<BAreaCompany> list = bOrgService.getAreaOrCompany(3, areaCode);
			List<BAreaCompany> list = null;
			if(userId == 1){
				list = bOrgService.getAreaOrCompany(3, areaCode);
			}else{
				list = bOrgService.getCompanyByUserId(userId, areaCode);
			}
			BAreaCompany bac1 = new BAreaCompany();
			bac1.setName("不限");
			bac1.setId("0");
			arealist.add(bac1);
			arealist.addAll(list);
		}
		
		return ResultMessage.successMsg("获取成功", arealist);
	}
	
//	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/product/getProductProjectData")
	public @ResponseBody
	ResultMessage getProductProjectData(HttpSession session, @RequestParam String areaCode, String companyCode, String startDate, String endDate) {
		try{
			if(areaCode == null || "".equals(areaCode)){
				return ResultMessage.errorMsg("获取数据失败");
			}
			if(startDate == null || endDate == null){
				return ResultMessage.errorMsg("获取数据失败");
			}
			if("0".equals(areaCode)){
				areaCode = null;
			}
			if("0".equals(companyCode)){
				companyCode = null;
			}
			
			BaseUser user = (BaseUser)session.getAttribute("baseUser");
			if(user == null){
				return ResultMessage.errorMsg("用户未登录");
			}
			int userId = user.getUserId();
			
			List<ProductProjectData> dataList = null;
			if(userId == 1){
				dataList = bAreaCompanyService.getProductProjectData(areaCode, companyCode, startDate, endDate);
			}else{
				dataList = bAreaCompanyService.getPPDByUserId(areaCode, companyCode, startDate, endDate, userId);
			}
			
			ProductProjectData ppd = new ProductProjectData();
			int tweentyLess=0, twToThirth=0, thiToForth=0, fouToFifty=0, fifToSixty=0, sixtyMore=0, notKnow=0, total=0;
			List<SplineSeriesDto> ssDtoList = new ArrayList<SplineSeriesDto>();
			SplineSeriesDto ssDto1 = null;
			List<Object> data1List = null;
			if(dataList != null && dataList.size() > 0){
				for (int i = 0; i < dataList.size(); i++) {
					ssDto1 = new SplineSeriesDto();
					ProductProjectData data = dataList.get(i);
					
					ssDto1.setName(data.getRoomAcreSegment());
					data1List = new ArrayList<Object>();
					data1List.add(data.getTweentyLess());
					data1List.add(data.getTwToThirth());
					data1List.add(data.getThiToForth());
					data1List.add(data.getFouToFifty());
					data1List.add(data.getFifToSixty());
					data1List.add(data.getSixtyMore());
					data1List.add(data.getNotKnow());
					ssDto1.setData(data1List);
					ssDtoList.add(ssDto1);
					
					int totalNum = data.getTweentyLess() + data.getTwToThirth() + data.getThiToForth() + data.getFouToFifty() + data.getFifToSixty() + data.getSixtyMore() +data.getNotKnow();
					dataList.get(i).setTotal(totalNum);
					tweentyLess += data.getTweentyLess();
					twToThirth += data.getTwToThirth();
					thiToForth += data.getThiToForth();
					fouToFifty += data.getFouToFifty();
					fifToSixty += data.getFifToSixty();
					sixtyMore += data.getSixtyMore();
					notKnow += data.getNotKnow();
					total += totalNum;
				}
			}
			ppd.setRoomAcreSegment("总计");
			ppd.setTweentyLess(tweentyLess);
			ppd.setTwToThirth(twToThirth);
			ppd.setThiToForth(thiToForth);
			ppd.setFouToFifty(fouToFifty);
			ppd.setFifToSixty(fifToSixty);
			ppd.setSixtyMore(sixtyMore);
			ppd.setNotKnow(notKnow);
			ppd.setTotal(total);
			dataList.add(ppd);
			
			
			List<SplineSeriesDto> ssdto = new ArrayList<SplineSeriesDto>();
			SplineSeriesDto dto = new SplineSeriesDto();
			data1List = new ArrayList<Object>();
			data1List.add(tweentyLess);
			data1List.add(twToThirth);
			data1List.add(thiToForth);
			data1List.add(fouToFifty);
			data1List.add(fifToSixty);
			data1List.add(sixtyMore);
			data1List.add(notKnow);
			dto.setName("客户数量");
			dto.setData(data1List);
			ssdto.add(dto);
			
			LastDataDto dataDto = new LastDataDto();
			dataDto.setPpDataList(dataList);
			dataDto.setSsDto(ssdto);
			dataDto.setSsDtoList(ssDtoList);
			return ResultMessage.successMsg("获取成功", dataDto);
		}catch(Exception e){
			e.printStackTrace();
			return ResultMessage.errorMsg("日期转换错误");
		}
	}
	
	@RequestMapping(value = "/product/getYeTaiZhuanShuData")
	public @ResponseBody
	ResultMessage getYeTaiZhuanShuData(HttpSession session, @RequestParam String startDate, String endDate) {
		
		BaseUser user = (BaseUser)session.getAttribute("baseUser");
		if(user == null){
			return ResultMessage.errorMsg("用户未登录");
		}
		int userId = user.getUserId();
		
		try{
			startDate = startDate + " 00:00:00";
			endDate = endDate + " 59:59:59";
			
			List<YeTaiZhuanShuDataDto> yeTaiTabData = null;
			if(userId == 1){
				yeTaiTabData = bAreaCompanyService.getYeTaiZhuanShuData(startDate, endDate);
			}else{
				yeTaiTabData = bAreaCompanyService.getYTZSDByCompetence(startDate, endDate, userId);
			}
			
			YeTaiMap2 yeTaiMap = new YeTaiMap2();
			
			List<Map2Data> map2DataList = new ArrayList<Map2Data>();
			
			List<Integer> mapList1 = new ArrayList<Integer>();
			List<Integer> mapList2 = new ArrayList<Integer>();
			List<Integer> mapList3 = new ArrayList<Integer>();
			List<Integer> mapList4 = new ArrayList<Integer>();
			List<String> categoriesList = new ArrayList<String>();
			Map2Data map2Data1 = new Map2Data();
			Map2Data map2Data2 = new Map2Data();
			Map2Data map2Data3 = new Map2Data();
			Map2Data map2Data4 = new Map2Data();
			
			for (int i = 0; i < yeTaiTabData.size(); i++) {
				if(yeTaiTabData.get(i) != null){
					if(yeTaiTabData.get(i).getCityName() == null || "".equals(yeTaiTabData.get(i).getCityName())){
						categoriesList.add("未知");
						yeTaiTabData.get(i).setCityName("未知");
					}else{
						categoriesList.add(yeTaiTabData.get(i).getCityName());
					}
					mapList1.add(yeTaiTabData.get(i).getCompPromNum());
					mapList2.add(yeTaiTabData.get(i).getFinishedNum());
					mapList3.add(yeTaiTabData.get(i).getTimeoFinishedNum());
					mapList4.add(yeTaiTabData.get(i).getWaitDealPromble());
				}
				
			}
			map2Data1.setName("投诉问题数");
			map2Data1.setData(mapList1);
			map2Data2.setName("按时完成问题数");
			map2Data2.setData(mapList2);
			map2Data3.setName("超时完成问题数");
			map2Data3.setData(mapList3);
			map2Data4.setName("待处理问题数");
			map2Data4.setData(mapList4);
			
			map2DataList.add(map2Data1);
			map2DataList.add(map2Data2);
			map2DataList.add(map2Data3);
			map2DataList.add(map2Data4);
			
			yeTaiMap.setSplineSeries(map2DataList);
			yeTaiMap.setCategories(categoriesList);
			
			YeTaiDataDto yeTaiData = new YeTaiDataDto();
			yeTaiData.setYeTaiTabData(yeTaiTabData);
			yeTaiData.setYeTaiMap2Data(yeTaiMap);
			
			return ResultMessage.successMsg("获取成功", yeTaiData);
		}catch(Exception e){
			e.printStackTrace();
			return ResultMessage.errorMsg("日期转换错误");
		}
	}
	
	
}
