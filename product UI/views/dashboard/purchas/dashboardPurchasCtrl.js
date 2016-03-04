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
				$scope.dealAmount = response.dealAmount;

				//盘源
				$scope.sourceDisk = response.sourceDisk;

				//本月成交排行前三
				$scope.thisMonthTurnoverList = response.thisMonthTurnoverList;

				//客源
				$scope.tourists = response.tourists;

				//转化率与转化周期
				$scope.rateAndCycle = response.rateAndCycle;

				//本月营销趋势
				$scope.thisMonthSalesPurchas = response.thisMonthSales;

				$scope.objThisMonthSalesPurchas = {
					categories: $scope.thisMonthSalesPurchas.categories,
					columnSeries: $scope.thisMonthSalesPurchas.columnSeries,
					splineSeries: $scope.thisMonthSalesPurchas.splineSeries,
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
					/*tooltip: {
			        	enabled: false
			        },*/
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

