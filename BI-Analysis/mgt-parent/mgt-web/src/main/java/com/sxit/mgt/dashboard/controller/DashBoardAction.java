package com.sxit.mgt.dashboard.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sxit.common.action.BaseAction;
import com.sxit.common.dto.ResultMessage;
import com.sxit.common.utils.DateHelper;
import com.sxit.mgt.dashboard.service.DashBoardService;
import com.sxit.mgt.dashboard.vo.CustomerOwnerAnalysModel;
import com.sxit.mgt.dashboard.vo.CustonerAnalysModel;
import com.sxit.mgt.dashboard.vo.MonthOpenedModel;
import com.sxit.mgt.dashboard.vo.MonthSalesModel;
import com.sxit.mgt.dashboard.vo.NameAndData;
import com.sxit.mgt.dashboard.vo.RYKMonthAnalyseModel;
import com.sxit.mgt.dashboard.vo.RYKMonthRuhuoModel;
import com.sxit.mgt.dashboard.vo.RYProjSalesInfoModel;
import com.sxit.mgt.dashboard.vo.RYTransAnalyseModel;
import com.sxit.mgt.dashboard.vo.RYZBuildInfoModel;
import com.sxit.mgt.dashboard.vo.RYZProjInfoModel;
import com.sxit.mgt.dashboard.vo.RZPRentSaleModel;
import com.sxit.mgt.dashboard.vo.SalesMoneyModel;
import com.sxit.mgt.dashboard.vo.TMonTopThreeModel;
import com.sxit.mgt.pmp.service.RptResidentialSaleService;
import com.sxit.model.pmp.RptResidentialSale;

@Controller
@RequestMapping("/dashboard")
public class DashBoardAction extends BaseAction {

	@Autowired
	private DashBoardService dashBoardService;
	
	@Autowired
	private RptResidentialSaleService rptResidentialSaleService;
	
	@RequestMapping(value = "/sales")
	public @ResponseBody ResultMessage salesShow() {
		
		String dateStr = dashBoardService.getMaxDate();
		
		if(dateStr == null){
        	return ResultMessage.errorMsg("数据库无数据");
        }
		
		SalesMoneyModel dealAmount = dashBoardService.getDealAmount(dateStr);
		if(dealAmount != null){
			String deal = dealAmount.getYesterdayDeal() == null?"0" : dealAmount.getYesterdayDeal();
			Double d_deal = Double.parseDouble(deal)/10000;
			dealAmount.setYesterdayDeal(String.valueOf(Math.round(d_deal)));
			
			deal = dealAmount.getThisMonthDeal() == null?"0" : dealAmount.getThisMonthDeal();
			d_deal = Double.parseDouble(deal)/100000000;
			dealAmount.setThisMonthDeal(String.valueOf(Math.round(d_deal)));
			
			deal = dealAmount.getThisSeasonDeal() == null?"0" : dealAmount.getThisSeasonDeal();
			d_deal = Double.parseDouble(deal)/100000000;
			dealAmount.setThisSeasonDeal(String.valueOf(Math.round(d_deal)));
			
			deal = dealAmount.getThisYearDeal() == null?"0" : dealAmount.getThisYearDeal();
			d_deal = Double.parseDouble(deal)/100000000;
			dealAmount.setThisYearDeal(String.valueOf(Math.round(d_deal)));
		}else{
			dealAmount = new SalesMoneyModel();
			dealAmount.setYesterdayDeal("0");
			dealAmount.setThisMonthDeal("0");
			dealAmount.setThisSeasonDeal("0");
			dealAmount.setThisYearDeal("0");
		}
        
		SalesMoneyModel dealNumber = dashBoardService.getDealNumber(dateStr);
    	if(dealNumber != null){
    		String numberStr = dealNumber.getThisMonthDeal() == null?"0" : dealNumber.getThisMonthDeal();
    		dealNumber.setThisMonthDeal(numberStr);
    		
    		numberStr = dealNumber.getThisYearDeal() == null?"0" : dealNumber.getThisYearDeal();
    		dealNumber.setThisYearDeal(numberStr);
    		
    		numberStr = dealNumber.getStock() == null?"0" : dealNumber.getStock();
    		dealNumber.setStock(numberStr);
    	}else{
    		dealNumber = new SalesMoneyModel();
    		dealNumber.setThisMonthDeal("0");
    		dealNumber.setThisYearDeal("0");
    		dealNumber.setStock("0");
    	}
    	
    	dateStr = dateStr.substring(0, 7);
    	
    	int count = dashBoardService.getProjCount(dateStr);
    	
    	List<TMonTopThreeModel> thisMonthVisitedTopThree = dashBoardService.getThisMonthVisitedTopThree(dateStr);
    	
    	List<TMonTopThreeModel> topThree = dashBoardService.getTopThree(dateStr);
    	
    	TMonTopThreeModel tMTopThreeModel = null;
    	for (int i = 0; i < topThree.size(); i++) {
    		tMTopThreeModel = topThree.get(i);
    		if(tMTopThreeModel != null){
    			topThree.get(i).setNumber(String.valueOf(i + 1));
    			String money = topThree.get(i).getMoney() == null? "0" : topThree.get(i).getMoney();
    			
    			topThree.get(i).setMoney(String.valueOf(Math.round(Double.parseDouble(money)/10000)));
    		}
		}
    	
    	List<TMonTopThreeModel> lastThree = dashBoardService.getLastThree(dateStr);
    	for (int i = 0; i < lastThree.size(); i++) {
    		tMTopThreeModel = lastThree.get(i);
    		if(tMTopThreeModel != null){
    			lastThree.get(i).setNumber(String.valueOf(count - 2 + i));
    			String money = lastThree.get(i).getMoney() == null? "0" : lastThree.get(i).getMoney();
    			
    			lastThree.get(i).setMoney(String.valueOf(Math.round(Double.parseDouble(money)/10000)));
    		}
		}
    	
    	RptResidentialSale rptResidentialSale = rptResidentialSaleService.queryByAll();
    	if(rptResidentialSale == null){
    		rptResidentialSale = new RptResidentialSale();
    		rptResidentialSale.setVisit_number(0);
    		rptResidentialSale.setRecognition_number(0);
    		rptResidentialSale.setRecognition_counts(0);
    		rptResidentialSale.setSubscribe_number(0);
    		rptResidentialSale.setSubscribe_counts(0);
    		rptResidentialSale.setContract_numner(0);
    		rptResidentialSale.setContract_counts(0);
    		rptResidentialSale.setVisit_cst_num(0);
    		rptResidentialSale.setConfess_cst_num(0);
    		rptResidentialSale.setSubscribe_cst_num(0);
    		rptResidentialSale.setContract_cst_num(0);
    		rptResidentialSale.setVisit_days(0);
    		rptResidentialSale.setRecognition_days(0);
    		rptResidentialSale.setSubscribe_days(0);
    		rptResidentialSale.setContract_days(0);
    		rptResidentialSale.setVisit_contract_days(0);
    		rptResidentialSale.setRecognition_subs_num(0);
    		rptResidentialSale.setVisit_subscribe_num(0);
    		rptResidentialSale.setSubs_contract_num(0);
    		rptResidentialSale.setVisit_contract_num(0);
    		rptResidentialSale.setVisit_reco_num(0);
    	}
    	
    	
    	String startDate = DateHelper.getFirstDay(new Date());
    	String endDate = DateHelper.getLastDay(new Date());
//    	startDate = "2015-10-01";
//    	endDate = "2015-10-31";
    	List<MonthOpenedModel> thisMonthOpened = dashBoardService.getThisMonthOpened(startDate, endDate);
    	
//    	startDate = "2015-08-01";
//    	endDate = "2015-08-31";
    	List<MonthSalesModel> thisMonthSales = dashBoardService.getThisMonthSales(startDate, endDate);
    	List<NameAndData> columnSeries = new ArrayList<NameAndData>();
    	List<NameAndData> splineSeries = new ArrayList<NameAndData>();
    	
    	NameAndData nameAndData1 = new NameAndData();
    	NameAndData nameAndData2 = new NameAndData();
    	NameAndData nameAndData3 = new NameAndData();
    	
    	List<String> datadateList = new ArrayList<String>();
    	List<Integer> dealSetList = new ArrayList<Integer>();
    	List<Integer> orderSetList = new ArrayList<Integer>();
    	List<Integer> newNumList = new ArrayList<Integer>();
    	
    	nameAndData1.setName("签约套数");
    	nameAndData2.setName("认购套数");
    	nameAndData3.setName("新增到访");
    	
    	for (MonthSalesModel monthSalesModel : thisMonthSales) {
			String dataDate = monthSalesModel.getDataDate() == null ? "" : monthSalesModel.getDataDate();
			datadateList.add(dataDate);
			int dealSet = monthSalesModel.getDealSet()==null?0:monthSalesModel.getDealSet();
			int orderSet = monthSalesModel.getOrderSet()==null?0:monthSalesModel.getOrderSet();
			int newNum = monthSalesModel.getNewNum()==null?0:monthSalesModel.getNewNum();
			dealSetList.add(dealSet);
			orderSetList.add(orderSet);
			newNumList.add(newNum);
		}
    	nameAndData1.setData(dealSetList);
    	nameAndData2.setData(orderSetList);
    	nameAndData3.setData(newNumList);
    	
    	columnSeries.add(nameAndData1);
    	columnSeries.add(nameAndData2);
    	
    	splineSeries.add(nameAndData3);
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("dealAmount", dealAmount);
    	map.put("dealNumber", dealNumber);
    	map.put("thisMonthVisitedTopThree", thisMonthVisitedTopThree);
    	map.put("topThree", topThree);
    	map.put("lastThree", lastThree);
    	map.put("rptResidentialSale", rptResidentialSale);
    	map.put("thisMonthOpened", thisMonthOpened);
    	map.put("categories", datadateList);
    	map.put("columnSeries", columnSeries);
    	map.put("splineSeries", splineSeries);
    	
		return ResultMessage.successMsg("获取成功", map);
	}
	
	@RequestMapping(value = "/customer")
	public @ResponseBody ResultMessage customerShow() {
		
		String dateStr = dashBoardService.getMaxDateFromRptYKWA();
		
		if(dateStr == null){
        	return ResultMessage.errorMsg("数据库无数据");
        }
		
		String endTime = dateStr.substring(0, 7) + "-01";
		
		String ownyestadd = dashBoardService.getCustomerYezhu1(dateStr);
		String ownmonthadd = dashBoardService.getCustomerYezhu2(dateStr, endTime);
		String owntotal = dashBoardService.getCustomerYezhu3();
		if(ownyestadd == null || "".equals(ownyestadd)){
			ownyestadd = "0";
		}
		if(ownmonthadd == null || "".equals(ownmonthadd)){
			ownmonthadd = "0";
		}
		if(owntotal == null || "".equals(owntotal)){
			owntotal = "0";
		}
		
		CustonerAnalysModel owner_complaint_repair = dashBoardService.getCustonerAnalyse(dateStr);
		if(owner_complaint_repair != null){
			owner_complaint_repair.setOwnyestadd(Long.parseLong(ownyestadd));
			owner_complaint_repair.setOwnmonthadd(Long.parseLong(ownmonthadd));
			owner_complaint_repair.setOwntotal(Long.parseLong(owntotal));
		}else{
			owner_complaint_repair = new CustonerAnalysModel();
			owner_complaint_repair.setOwnyestadd(0L);
			owner_complaint_repair.setOwnmonthadd(0L);
			owner_complaint_repair.setOwntotal(0L);
			owner_complaint_repair.setComplainyest(0L);
			owner_complaint_repair.setComplainno(0L);
			owner_complaint_repair.setComplaincomp(0L);
			owner_complaint_repair.setRepairyest(0L);
			owner_complaint_repair.setRepairno(0L);
			owner_complaint_repair.setRepaircomp(0L);
		}
		
		List<CustomerOwnerAnalysModel> ownersAllTypes = dashBoardService.getCustomerOwnerAnalys();
		
		CustomerOwnerAnalysModel analysModel = null;
		long total = 0L;
		for (int i = 0; i < ownersAllTypes.size(); i++) {
			analysModel = ownersAllTypes.get(i);
			if(analysModel != null){
				if(analysModel.getNumber() != null){
					total += analysModel.getNumber();
				}
			}
		}
		DecimalFormat df = new DecimalFormat("#.##");
		for (int i = 0; i < ownersAllTypes.size(); i++) {
			analysModel = ownersAllTypes.get(i);
			if(analysModel != null){
				if(analysModel.getNumber() != null){
					double percent = 0;
					percent = ((double)analysModel.getNumber()/total) * 100;
					ownersAllTypes.get(i).setPercent(df.format(percent));
				}
			}
		}
		
		String month = DateHelper.getFirstDay(new Date());
		
		month = month.substring(0, 7);
//		month = "2015-08";
		
		List<RYKMonthRuhuoModel> thisMonthBuildings = dashBoardService.getRYKMonthRuhuo(month);
		
//		month = "2015-01";
		List<RYKMonthAnalyseModel> rYKMonthAnalyseList = dashBoardService.getRYKMonthAnalyse(month);
		
		List<String> categories = new ArrayList<String>();
		List<NameAndData> columnSeries = new ArrayList<NameAndData>();
		List<NameAndData> splineSeries = new ArrayList<NameAndData>();
		RYKMonthAnalyseModel rykMonthAnalyseModel = null;
		NameAndData nameAndData1 = new NameAndData();
		NameAndData nameAndData2 = new NameAndData();
		List<Integer> repairNumList = new ArrayList<Integer>();
		List<Integer> complainNumList = new ArrayList<Integer>();
    	
    	nameAndData1.setName("保修次数");
    	nameAndData2.setName("投诉次数");
		for (int i = 0; i < rYKMonthAnalyseList.size(); i++) {
			rykMonthAnalyseModel = rYKMonthAnalyseList.get(i);
			if(rykMonthAnalyseModel != null){
				categories.add(rykMonthAnalyseModel.getDataDate());
				if(rykMonthAnalyseModel.getRepairNum() != null){
					repairNumList.add(rykMonthAnalyseModel.getRepairNum());
				}else{
					repairNumList.add(0);
				}
				if(rykMonthAnalyseModel.getComplainNum() != null){
					complainNumList.add(rykMonthAnalyseModel.getComplainNum());
				}else{
					complainNumList.add(0);
				}
			}
		}
		nameAndData1.setData(repairNumList);
    	nameAndData2.setData(complainNumList);
    	columnSeries.add(nameAndData1);
    	splineSeries.add(nameAndData2);
    	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("owner_complaint_repair", owner_complaint_repair);
		map.put("ownersAllTypes", ownersAllTypes);
		map.put("thisMonthBuildings", thisMonthBuildings);
		map.put("categories", categories);
		map.put("columnSeries", columnSeries);
		map.put("splineSeries", splineSeries);
		return ResultMessage.successMsg("获取成功", map);
	}
	
	@RequestMapping(value = "/purchas")
	public @ResponseBody ResultMessage purchasShow() {
		
		DecimalFormat df = new DecimalFormat("#.#");
		String month = DateHelper.getFirstDay(new Date());
		month = month.substring(0, 7);
		
		String amount = "0";
//		month = "2015-08";
		//成交金额
		RZPRentSaleModel dealAmount = dashBoardService.getRZPRentSale();
		if(dealAmount != null){
			if(dealAmount.getRentYestDeal() != null){
				amount = df.format(dealAmount.getRentYestDeal()/10000);
				dealAmount.setRentYestDeal(Double.valueOf(amount));
			}else{
				dealAmount.setRentYestDeal(0d);
			}
			if(dealAmount.getRentMonthDeal() != null){
				amount = df.format(dealAmount.getRentMonthDeal()/10000);
				dealAmount.setRentMonthDeal(Double.valueOf(amount));
			}else{
				dealAmount.setRentMonthDeal(0d);
			}
			if(dealAmount.getRentSeasonDeal() != null){
				amount = df.format(dealAmount.getRentSeasonDeal()/10000);
				dealAmount.setRentSeasonDeal(Double.valueOf(amount));
			}else{
				dealAmount.setRentSeasonDeal(0d);
			}
			if(dealAmount.getRentYearDeal() != null){
				amount = df.format(dealAmount.getRentYearDeal()/10000);
				dealAmount.setRentYearDeal(Double.valueOf(amount));
			}else{
				dealAmount.setRentYearDeal(0d);
			}
			if(dealAmount.getSaleYestDeal() != null){
				amount = df.format(dealAmount.getSaleYestDeal()/10000);
				dealAmount.setSaleYestDeal(Double.valueOf(amount));
			}else{
				dealAmount.setSaleYestDeal(0d);
			}
			if(dealAmount.getSaleMonthDeal() != null){
				amount = df.format(dealAmount.getSaleMonthDeal()/10000);
				dealAmount.setSaleMonthDeal(Double.valueOf(amount));
			}else{
				dealAmount.setSaleMonthDeal(0d);
			}
			if(dealAmount.getSaleSeasonDeal() != null){
				amount = df.format(dealAmount.getSaleSeasonDeal()/10000);
				dealAmount.setSaleSeasonDeal(Double.valueOf(amount));
			}else{
				dealAmount.setSaleSeasonDeal(0d);
			}
			if(dealAmount.getSaleYearDeal() != null){
				amount = df.format(dealAmount.getSaleYearDeal()/10000);
				dealAmount.setSaleYearDeal(Double.valueOf(amount));
			}else{
				dealAmount.setSaleYearDeal(0d);
			}
		}
		//盘源
		RYZBuildInfoModel sourceDisk = dashBoardService.getRYZBuildInfo();
		
		//客源tourists
		RYZBuildInfoModel tourists = dashBoardService.getRYZCstInfo();
		
		//本月出租前三
		List<RYProjSalesInfoModel> rent = dashBoardService.getRYProjRentInfo(month);
		RYProjSalesInfoModel rYProjSalesInfo = null;
		for (int i = 0; i < rent.size(); i++) {
			rYProjSalesInfo = rent.get(i);
			if(rYProjSalesInfo != null){
				if(rYProjSalesInfo.getMoney() != null){
					amount = df.format(rYProjSalesInfo.getMoney()/10000);
					rent.get(i).setMoney(Double.valueOf(amount));
				}else{
					rent.get(i).setMoney(0d);
				}
			}
		}
		
		//本月出售前三
		List<RYProjSalesInfoModel> sales = dashBoardService.getRYProjSalesInfo(month);
		for (int i = 0; i < sales.size(); i++) {
			rYProjSalesInfo = sales.get(i);
			if(rYProjSalesInfo != null){
				if(rYProjSalesInfo.getMoney() != null){
					amount = df.format(rYProjSalesInfo.getMoney()/10000);
					sales.get(i).setMoney(Double.valueOf(amount));
				}else{
					sales.get(i).setMoney(0d);
				}
			}
		}
		
		//周期转化率
		RYTransAnalyseModel rateAndCycle = dashBoardService.getRYTransAnalyse();
		
		//本月营销趋势
		List<RYZProjInfoModel> rYZProjInfoList = dashBoardService.getRYZProjInfo(month);
		List<String> categories = new ArrayList<String>();
		List<NameAndData> columnSeries = new ArrayList<NameAndData>();
		List<NameAndData> splineSeries = new ArrayList<NameAndData>();
		NameAndData nameAndData1 = new NameAndData();
		NameAndData nameAndData2 = new NameAndData();
		NameAndData nameAndData3 = new NameAndData();
		NameAndData nameAndData4 = new NameAndData();
		List<Integer> saleNumList = new ArrayList<Integer>();
		List<Integer> rentNumList = new ArrayList<Integer>();
		List<Double> saleAmountList = new ArrayList<Double>();
		List<Double> rentAmountList = new ArrayList<Double>();
		
		RYZProjInfoModel rYZProjInfo = null;
		for (int i = 0; i < rYZProjInfoList.size(); i++) {
			rYZProjInfo = rYZProjInfoList.get(i);
			if(rYZProjInfo != null){
				categories.add(rYZProjInfo.getDataDate());
				if(rYZProjInfo.getSaleNum() != null){
					saleNumList.add(rYZProjInfo.getSaleNum());
				}else{
					saleNumList.add(0);
				}
				if(rYZProjInfo.getRentNum() != null){
					rentNumList.add(rYZProjInfo.getRentNum());
				}else{
					rentNumList.add(0);
				}
				if(rYZProjInfo.getSaleAmount() != null){
					amount = df.format(rYZProjInfo.getSaleAmount()/10000);
					saleAmountList.add(Double.valueOf(amount));
				}else{
					saleAmountList.add((double) 0);
				}
				if(rYZProjInfo.getRentAmount() != null){
					amount = df.format(rYZProjInfo.getRentAmount()/10000);
					rentAmountList.add(Double.valueOf(amount));
				}else{
					rentAmountList.add((double) 0);
				}
				
			}
		}
		nameAndData1.setName("出售套数");
		nameAndData1.setData(saleNumList);
		columnSeries.add(nameAndData1);
		nameAndData2.setName("出租套数");
		nameAndData2.setData(rentNumList);
		columnSeries.add(nameAndData2);
		
		nameAndData3.setName("出售代理费");
		nameAndData3.setData(saleAmountList);
		splineSeries.add(nameAndData3);
		nameAndData4.setName("出租代理费");
		nameAndData4.setData(rentAmountList);
		splineSeries.add(nameAndData4);
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dealAmount", dealAmount);
		map.put("sourceDisk", sourceDisk);
		map.put("tourists", tourists);
		map.put("rent", rent);
		map.put("sales", sales);
		map.put("rateAndCycle", rateAndCycle);
		map.put("categories", categories);
		map.put("columnSeries", columnSeries);
		map.put("splineSeries", splineSeries);
		return ResultMessage.successMsg("获取成功", map);
	}
	
}
