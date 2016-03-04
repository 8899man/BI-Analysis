package com.sxit.mgt.dashboard.dao;

import java.util.List;
import java.util.Map;

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

public interface DashBoardDao {

	public String getMaxDate();
	
	public SalesMoneyModel getDealAmount(String createTime);
	
	public SalesMoneyModel getDealNumber(String createTime);
	
	public List<TMonTopThreeModel> getThisMonthVisitedTopThree(String month);

	public List<TMonTopThreeModel> getTopThree(String month);
	
	public List<TMonTopThreeModel> getLastThree(String month);
	
	public int getProjCount(String month);
	
	public List<MonthOpenedModel> getThisMonthOpened(Map<String, Object> map);
	
	public List<MonthSalesModel> getThisMonthSales(Map<String, Object> map);
	
	//客户物业仪表盘
	public String getMaxDateFromRptYKWA();
	
	public CustonerAnalysModel getCustonerAnalyse(String createTime);
	
	public String getCustomerYezhu1(String createTime);
	
	public String getCustomerYezhu2(Map<String, Object> map);
	
	public String getCustomerYezhu3();
	
	public List<CustomerOwnerAnalysModel> getCustomerOwnerAnalys();
	
	public List<RYKMonthRuhuoModel> getRYKMonthRuhuo(String month);
	
	public List<RYKMonthAnalyseModel> getRYKMonthAnalyse(String month);
	
	//置业仪表盘
	public RZPRentSaleModel getRZPRentSale();
	
	public RYZBuildInfoModel getRYZBuildInfo();
	
	public RYZBuildInfoModel getRYZCstInfo();
	
	public List<RYProjSalesInfoModel> getRYProjRentInfo(String month);
	
	public List<RYProjSalesInfoModel> getRYProjSalesInfo(String month);
	
	public RYTransAnalyseModel getRYTransAnalyse();
	
	public List<RYZProjInfoModel> getRYZProjInfo(String month);
	
	
}
