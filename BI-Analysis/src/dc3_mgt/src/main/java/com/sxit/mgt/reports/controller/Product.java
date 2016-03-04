package com.sxit.mgt.reports.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxit.common.dto.ResultMessage;
import com.sxit.common.utils.DateHelper;
import com.sxit.mgt.reports.dto.BAreaCompany;
import com.sxit.mgt.reports.dto.LastDataDto;
import com.sxit.mgt.reports.dto.Map2Data;
import com.sxit.mgt.reports.dto.ProductProjectData;
import com.sxit.mgt.reports.dto.SplineSeriesDto;
import com.sxit.mgt.reports.dto.YeTaiDataDto;
import com.sxit.mgt.reports.dto.YeTaiMap1;
import com.sxit.mgt.reports.dto.YeTaiMap2;
import com.sxit.mgt.reports.dto.YeTaiZhuanShuDataDto;
import com.sxit.mgt.reports.service.BAreaCompanyService;

@Controller
@RequestMapping("/report")
public class Product {
	
	@Autowired
	private BAreaCompanyService bAreaCompanyService;

//	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/product/turnoverProduct")
	public @ResponseBody
	ResultMessage init() {
		List<BAreaCompany> arealist = new ArrayList<BAreaCompany>();
		List<BAreaCompany> list = bAreaCompanyService.getAreaList();
		BAreaCompany bac1 = new BAreaCompany();
		bac1.setAreaName("集团");
		bac1.setAreaCode("0");
		arealist.add(bac1);
		arealist.addAll(list);
		return ResultMessage.successMsg("获取成功", arealist);
	}
	
//	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/product/getCompany")
	public @ResponseBody
	ResultMessage getCompany(@RequestParam String areaCode) {
		if(areaCode == null){
			return ResultMessage.errorMsg("获取数据失败");
		}
		List<BAreaCompany> arealist = new ArrayList<BAreaCompany>();
		if(!"0".equals(areaCode)){
			List<BAreaCompany> list = bAreaCompanyService.getCompanyList(areaCode);
			BAreaCompany bac1 = new BAreaCompany();
			bac1.setCompanyName("不限");
			bac1.setCompanyCode("0");
			arealist.add(bac1);
			arealist.addAll(list);
		}
		
		return ResultMessage.successMsg("获取成功", arealist);
	}
	
//	@AuthPassport(rightCode = "Reports.Reports")
	@RequestMapping(value = "/product/getProductProjectData")
	public @ResponseBody
	ResultMessage getProductProjectData(@RequestParam String areaCode, String companyCode, String startDate, String endDate) {
		try{
			if(areaCode == null || "".equals(areaCode)){
				return ResultMessage.errorMsg("获取数据失败");
			}
			if(companyCode == null || "".equals(companyCode)){
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
			
			List<ProductProjectData> dataList = bAreaCompanyService.getProductProjectData(areaCode, companyCode, startDate, endDate);
			ProductProjectData ppd = new ProductProjectData();
			int tweentyLess=0, twToThirth=0, thiToForth=0, fouToFifty=0, fifToSixty=0, sixtyMore=0, notKnow=0, total=0;
			List<SplineSeriesDto> ssDtoList = new ArrayList<SplineSeriesDto>();
			SplineSeriesDto ssDto1 = null;
			List<Object> data1List = null;
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
	ResultMessage getYeTaiZhuanShuData(@RequestParam String startDate, String endDate) {
		try{
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			String startTime = "";
//			String endTime = "";
//			if(dateStr == null || "".equals(dateStr)){
//				return ResultMessage.errorMsg("获取数据失败");
//			}else{
//				if("7天".equals(dateStr)){
//					startTime = DateHelper.getAfterDay(-7) + " 00:00:00";
//					endTime = DateHelper.getAfterDay(-1) + " 59:59:59";
//				}else if("30天".equals(dateStr)){
//					startTime = DateHelper.getAfterDay(-30) + " 00:00:00";
//					endTime = DateHelper.getAfterDay(-1) + " 59:59:59";
//				}else{
//					dateStr = dateStr.substring(0, 4) + "-" + dateStr.substring(5, dateStr.length() - 1) + "-01";
//					Date date = sdf.parse(dateStr);
//					startTime = DateHelper.getFirstDay(date) + " 00:00:00";
//					endTime = DateHelper.getLastDay(date) + " 59:59:59";
//				}
//			}
			startDate = startDate + " 00:00:00";
			endDate = endDate + " 59:59:59";
			List<YeTaiZhuanShuDataDto> yeTaiTabData= bAreaCompanyService.getYeTaiZhuanShuData(startDate, endDate);
			
			YeTaiMap1 yeTaiMap1 = new YeTaiMap1();
			YeTaiMap2 yeTaiMap2 = new YeTaiMap2();
			List<Map2Data> map2DataList1 = new ArrayList<Map2Data>();
			List<Map2Data> map2DataList2 = new ArrayList<Map2Data>();
			Map2Data map2Data1 = new Map2Data();
			Map2Data map2Data2 = new Map2Data();
			
			List<String> mapList = new ArrayList<String>();
			List<Integer> map1List = new ArrayList<Integer>();
			List<Integer> map2List1 = new ArrayList<Integer>();
			List<Integer> map2List2 = new ArrayList<Integer>();
			
			for (int i = 0; i < yeTaiTabData.size(); i++) {
				mapList.add(yeTaiTabData.get(i).getCityName());
				map1List.add(yeTaiTabData.get(i).getCompPromNum());
				
				map2List1.add(yeTaiTabData.get(i).getTimeoFinishedNum());
				map2List2.add(yeTaiTabData.get(i).getWaitDealPromble());
			}
			
			yeTaiMap1.setCityName(mapList);
			yeTaiMap1.setCompPromNum(map1List);
			
			map2Data1.setName("超时完成任务数");
			map2Data1.setData(map2List1);
			map2Data2.setName("待处理数");
			map2Data2.setData(map2List2);
			map2DataList1.add(map2Data1);
			map2DataList2.add(map2Data2);
			
			yeTaiMap2.setCategories(mapList);
			yeTaiMap2.setSplineSeries(map2DataList1);
			yeTaiMap2.setColumnSeries(map2DataList2);
			
			YeTaiDataDto yeTaiData = new YeTaiDataDto();
			yeTaiData.setYeTaiTabData(yeTaiTabData);
			yeTaiData.setYeTaiMap1Data(yeTaiMap1);
			yeTaiData.setYeTaiMap2Data(yeTaiMap2);
			
			return ResultMessage.successMsg("获取成功", yeTaiData);
		}catch(Exception e){
			e.printStackTrace();
			return ResultMessage.errorMsg("日期转换错误");
		}
	}
	
	public static void main(String[] args) {
		String dateStr = "2015-11-01";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		try {
			date = sdf.parse(dateStr);
			String startDate = DateHelper.getFirstDay(date);
			String endDate = DateHelper.getLastDay(date);
			System.out.println(startDate);
			System.out.println(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}
	
}
