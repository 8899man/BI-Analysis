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
				$scope.dealAmount = response.dealAmount;

				//成交套数
				$scope.dealNumber = response.dealNumber;

				//本月项目到访排行前三
				$scope.thisMonthVisitedTopThree = response.thisMonthVisitedTopThree;

				//本月项目成交排行
				$scope.thisMonthTurnoverList = response.thisMonthTurnoverList;

				//关键触点转化一览
				$scope.keyContact = response.keyContact;

				//填充客户与成交漏斗图形
				var customerAndDeal = [
		            ["到访阶段", response.keyContact.customerAndDeal.visitStage.persons],
		            ["认筹阶段", response.keyContact.customerAndDeal.planStage.persons],
		            ["认购阶段", response.keyContact.customerAndDeal.subscribeStage.persons],
		            ["签约阶段", response.keyContact.customerAndDeal.signStage.persons]
		        ];
				$scope.chartCustomerAndDeal = $scope.toFunnelData("客户数", customerAndDeal);

				//本月营销趋势
				$scope.thisMonthSales = response.thisMonthSales;

				$scope.objThisMonthSales = {
					categories: $scope.thisMonthSales.categories,
					columnSeries: $scope.thisMonthSales.columnSeries,
					splineSeries: $scope.thisMonthSales.splineSeries,
					yAxisTitle: ['新增到访（人）','成交套数（套）'],
					units:['套', '人'],
					height: 340
				}
				$scope.chartThisMonthSales = charts.mix3($scope.objThisMonthSales);

				//本月开盘项目
				$scope.thisMonthOpened = response.thisMonthOpened;
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
			        	//enabled: false
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

