define(['app', 'window', 'jquery', 'funnel', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'dashboardPurchasServices', 'toastr'], function (app, w, $) {
	//console.dir(app);
	app.register.controller('DashboardPurchasController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'dashboardPurchasServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, dashboardPurchasServices, toastr) {
	
		$scope.initializeController = function () {
			$scope.loaded = false;//默认未请求到数据
			$scope.getData();

		}


		$scope.getData = function(){
			dashboardPurchasServices.getData({}, function(response, status){
				$scope.loaded = true;//已请求到数据
				//成交金额
				$scope.dealAmount = response.data.dealAmount;
				
				//盘源
				$scope.sourceDisk = response.data.sourceDisk;
				//客源
				$scope.tourists = response.data.tourists;
				
				//本月成交排行前三
				//$scope.thisMonthTurnoverList = response.thisMonthTurnoverList;
				$scope.rent = response.data.rent;
				$scope.sales = response.data.sales;

				//转化率与转化周期
				$scope.rateAndCycle = response.data.rateAndCycle;

				//本月营销趋势
				//$scope.thisMonthSalesPurchas = response.thisMonthSales;

				$scope.objThisMonthSalesPurchas = {
//					categories: $scope.thisMonthSalesPurchas.categories,
//					columnSeries: $scope.thisMonthSalesPurchas.columnSeries,
//					splineSeries: $scope.thisMonthSalesPurchas.splineSeries,
					categories: response.data.categories,
					columnSeries: response.data.columnSeries,
					splineSeries: response.data.splineSeries,
					yAxisTitle: ['金额（万元）', '套数（套）'],
					units:['套', '万'],
					height: 360
				}

				$scope.chartThisMonthSalesPurchas = charts.mix3($scope.objThisMonthSalesPurchas);
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})
		};


	}]);
});

