package com.sxit.mgt.dashboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.sxit.mgt.dashboard.dao.DashBoardDao;
import com.sxit.mgt.dashboard.vo.CustomerOwnerAnalysModel;
import com.sxit.mgt.dashboard.vo.CustonerAnalysModel;
import com.sxit.mgt.dashboard.vo.MonthOpenedModel;
import com.sxit.mgt.dashboard.vo.MonthSalesModel;
import com.sxit.mgt.dashboard.vo.RYKMonthAnalyseModel;
import com.sxit.mgt.dashboard.vo.RYKMonthRuhuoModel;
import com.sxit.mgt.dashboard.vo.RYProjSalesInfoModel;
import com.sxit.mgt.dashboard.vo.RYTransAnalyseModel;
import com.sxit.mgt.dashboard.vo.RYZBuildInfoModel;
import com.sxit.mgt.dashboard.vo.RYZProjInfoModel;
import com.sxit.mgt.dashboard.vo.RZPRentSaleModel;
import com.sxit.mgt.dashboard.vo.SalesMoneyModel;
import com.sxit.mgt.dashboard.vo.TMonTopThreeModel;

public class DashBoardService {
	
	@Autowired
	private DashBoardDao dashBoardDao;
	
	public String getMaxDate(){
		return dashBoardDao.getMaxDate();
	}
	
	public SalesMoneyModel getDealAmount(String createTime){
		return dashBoardDao.getDealAmount(createTime);
	}
	
	public SalesMoneyModel getDealNumber(String createTime){
		return dashBoardDao.getDealNumber(createTime);
	}
	
	public List<TMonTopThreeModel> getThisMonthVisitedTopThree(String month){
		return dashBoardDao.getThisMonthVisitedTopThree(month);
	}
	
	public List<TMonTopThreeModel> getTopThree(String month){
		return dashBoardDao.getTopThree(month);
	}
	
	public List<TMonTopThreeModel> getLastThree(String month){
		return dashBoardDao.getLastThree(month);
	}
	
	public int getProjCount(String month){
		return dashBoardDao.getProjCount(month);
	}
	
	public List<MonthOpenedModel> getThisMonthOpened(String startDate, String endDate){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return dashBoardDao.getThisMonthOpened(map);
	}
	
	public List<MonthSalesModel> getThisMonthSales(String startDate, String endDate){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return dashBoardDao.getThisMonthSales(map);
	}
	
	//客户/物业仪表盘
	public String getCustomerYezhu1(String createTime){
		return dashBoardDao.getCustomerYezhu1(createTime);
	}
	
	public String getCustomerYezhu2(String startTime, String endTime){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		return dashBoardDao.getCustomerYezhu2(map);
	}
	
	public String getCustomerYezhu3(){
		return dashBoardDao.getCustomerYezhu3();
	}
	
	public String getMaxDateFromRptYKWA(){
		return dashBoardDao.getMaxDateFromRptYKWA();
	}
	
	
	public CustonerAnalysModel getCustonerAnalyse(String createTime){
		return dashBoardDao.getCustonerAnalyse(createTime);
	}
	
	public List<CustomerOwnerAnalysModel> getCustomerOwnerAnalys(){
		return dashBoardDao.getCustomerOwnerAnalys();
	}
	
	public List<RYKMonthRuhuoModel> getRYKMonthRuhuo(String month){
		return dashBoardDao.getRYKMonthRuhuo(month);
	}
	
	public List<RYKMonthAnalyseModel> getRYKMonthAnalyse(String month){
		return dashBoardDao.getRYKMonthAnalyse(month);
	}
	
	//置业仪表盘
	public RZPRentSaleModel getRZPRentSale(){
		return dashBoardDao.getRZPRentSale();
	}
	
	public RYZBuildInfoModel getRYZBuildInfo(){
		return dashBoardDao.getRYZBuildInfo();
	}
	
	public RYZBuildInfoModel getRYZCstInfo(){
		return dashBoardDao.getRYZCstInfo();
	}
	
	public List<RYProjSalesInfoModel> getRYProjRentInfo(String month){
		return dashBoardDao.getRYProjRentInfo(month);
	}
	
	public List<RYProjSalesInfoModel> getRYProjSalesInfo(String month){
		return dashBoardDao.getRYProjSalesInfo(month);
	}
	
	public RYTransAnalyseModel getRYTransAnalyse(){
		return dashBoardDao.getRYTransAnalyse();
	}
	
	public List<RYZProjInfoModel> getRYZProjInfo(String month){
		return dashBoardDao.getRYZProjInfo(month);
	}
	
}
