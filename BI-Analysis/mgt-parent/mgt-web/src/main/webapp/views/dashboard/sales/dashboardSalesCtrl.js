define(['app', 'window', 'jquery', 'funnel', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'dashboardSalesServices', 'toastr'], function (app, w, $) {
	//console.dir(app);
	app.register.controller('DashboardSalesController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'dashboardSalesServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, dashboardSalesServices, toastr) {
	
		$scope.initializeController = function () {
			
			$scope.loaded = false;//默认未请求到数据
			$scope.getData();

		}


		$scope.getData = function(){
			dashboardSalesServices.getData({}, function(response, status){
				$scope.loaded = true;//已请求到数据
				//成交金额
				$scope.dealAmount = response.data.dealAmount;

				//成交套数
				$scope.dealNumber = response.data.dealNumber;

				//本月项目到访排行前三
				$scope.thisMonthVisitedTopThree = response.data.thisMonthVisitedTopThree;

				//本月项目成交排行
				//$scope.thisMonthTurnoverList = response.thisMonthTurnoverList;
				$scope.topThree = response.data.topThree;
				$scope.lastThree = response.data.lastThree;

				//住宅销售
				$scope.projSale = response.data.rptResidentialSale;
				
				//关键触点转化一览
//				$scope.keyContact = response.keyContact;

				//填充客户与成交漏斗图形
				var	customerAndDeal = [
						["到访阶段", response.data.rptResidentialSale.visit_number],
						["认筹阶段", response.data.rptResidentialSale.recognition_number],
						["认购阶段", response.data.rptResidentialSale.subscribe_number],
						["签约阶段", response.data.rptResidentialSale.contract_numner]
					];
				$scope.chartCustomerAndDeal = $scope.toFunnelData("客户数", customerAndDeal);

				//住宅销售转化率
				if(response.data.rptResidentialSale.visit_cst_num==0){
					$scope.data01 =(0).toFixed(2);
				}else{
					$scope.data01 = ((response.data.rptResidentialSale.visit_reco_num/response.data.rptResidentialSale.visit_cst_num)*100).toFixed(2);
				}
				
				if(response.data.rptResidentialSale.confess_cst_num==0){
					$scope.data02 =(0).toFixed(2);
				}else{
					$scope.data02 = ((response.data.rptResidentialSale.recognition_subs_num/response.data.rptResidentialSale.confess_cst_num)*100).toFixed(2);
				}
				
				if(response.data.rptResidentialSale.visit_cst_num==0){
					$scope.data03 =(0).toFixed(2);
				}else{
					$scope.data03 = ((response.data.rptResidentialSale.visit_subscribe_num/response.data.rptResidentialSale.visit_cst_num)*100).toFixed(2);
				}
				
				if(response.data.rptResidentialSale.subscribe_cst_num==0){
					$scope.data04 =(0).toFixed(2);
				}else{
					$scope.data04 = ((response.data.rptResidentialSale.subs_contract_num/response.data.rptResidentialSale.subscribe_cst_num)*100).toFixed(2);
				}

				if(response.data.rptResidentialSale.contract_cst_num==0){
					$scope.data05 =(0).toFixed(2);
				}else{
					$scope.data05 = ((response.data.rptResidentialSale.visit_contract_num/response.data.rptResidentialSale.visit_cst_num)*100).toFixed(2);
				}
				
//				$scope.data01 = ((response.data.rptResidentialSale.visit_reco_num/response.data.rptResidentialSale.visit_cst_num)*100).toFixed(2);
//				$scope.data02 = ((response.data.rptResidentialSale.recognition_subs_num/response.data.rptResidentialSale.confess_cst_num)*100).toFixed(2);
//				$scope.data03 = ((response.data.rptResidentialSale.visit_subscribe_num/response.data.rptResidentialSale.visit_cst_num)*100).toFixed(2);
//				$scope.data04 = ((response.data.rptResidentialSale.subs_contract_num/response.data.rptResidentialSale.subscribe_cst_num)*100).toFixed(2);
//				$scope.data05 = ((response.data.rptResidentialSale.visit_contract_num/response.data.rptResidentialSale.contract_cst_num)*100).toFixed(2);
				
				
				//本月营销趋势
//				$scope.thisMonthSales = response.thisMonthSales;

				$scope.objThisMonthSales = {
//					categories: $scope.thisMonthSales.categories,
//					columnSeries: $scope.thisMonthSales.columnSeries,
//					splineSeries: $scope.thisMonthSales.splineSeries,
					categories: response.data.categories,
					columnSeries: response.data.columnSeries,
					splineSeries: response.data.splineSeries,
					yAxisTitle: ['新增到访（人）','成交套数（套）'],
					units:['套', '人'],
					height: 340
				}
				$scope.chartThisMonthSales = charts.mix3($scope.objThisMonthSales);

				//本月开盘项目
				$scope.thisMonthOpened = response.data.thisMonthOpened;
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})
		};


		//转成漏斗数据格式
		$scope.toFunnelData = function(title, data){
			return {
				"options": {
					"chart": {
						"type": "funnel"
					},
					"title": {
						"text": null
					},
					tooltip: {
						pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <br><b>{point.y}</b><br/>'
			        },
					colors:['#27a9e3', '#28b779', '#fa9507', '#8356ab'],
				},
				"series": [
					{
			            name: title,
			            tooltip: {
				        	enabled: false
				        },
				        dataLabels: {
				        	enabled: false
				        },
			            data: data
			        }
				],
				"size": {
					"height": "280"
				},
				"credits": {
					"enabled": false
				}

			}
		}


	}]);
});

