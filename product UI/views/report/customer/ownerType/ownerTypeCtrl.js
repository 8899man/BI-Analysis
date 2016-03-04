define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'ownerTypeServices', 'toastr'], function (app, w, $) {
//console.dir(app);
	app.register.controller('OwnerTypeController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'ownerTypeServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, ownerTypeServices, toastr) {
		
		

		$scope.initializeController = function () {

			
			$scope.selectRadio = "月报";//默认选择月报


			$scope.getCoverage();




		}

		


		$scope.getCoverage = function(){
			ownerTypeServices.getCoverage({}, function(response, status){
				//console.dir(response);
				//设置区域
				$scope.areas = response.areas;
				$scope.earliestDate = response.earliestDate;//最早日期

				//算出最新时间，即是昨天
				var now = +new Date();
				var yesterday = new Date(now-24*60*60*1000);
				var year = yesterday.getFullYear();
				var month = ((yesterday.getMonth()+1)>=10?(yesterday.getMonth()+1):("0" + (yesterday.getMonth()+1)));
				var date = (yesterday.getDate()>=10?yesterday.getDate():("0" + (yesterday.getDate())))

				$scope.yesterday = yesterday;
				//console.log(yesterday);
				$scope.newestDate = year + "-" + month + "-" + date;
				//console.log($scope.newestDate);

				//默认昨天前月的1号
				$scope.startDate = year + "-" + month + "-01";
				//默认结束时间昨天
				$scope.endDate = $scope.newestDate


				$scope.areaSelected = $scope.areas[0];
				$scope.citySelected = $scope.areas[0]["subs"][0];
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			}).then(function(response){
					//获取完区域范围后执行查询
					//$scope.search();
			});
		};

		$scope.error = {};
    	$scope.areas = [];

		$scope.changeArea = function(){
			$scope.error.area = false;
	        $scope.error.city = false;
	        $scope.citySelected = "";
		}


		$scope.changeCity = function(){
			$scope.error.area = false;
	        $scope.error.city = false;
		}



		$scope.search = function(){
			//首先赋值要查询的对象
			$scope.areaSelectedSearch = $scope.areaSelected;
			$scope.citySelectedSearch = $scope.citySelected;


			$scope.startDateSearch = $scope.startDate;
			$scope.endDateSearch = $scope.endDate;


			$scope.error.area = $scope.areaSelected ? false : true;
			$scope.error.city = $scope.citySelectedSearch ? false : true;

			//console.dir($scope.error);
			if($scope.error.area){
				new w.Window().alert({
	    			title: "错误提示",
	    			width: 300,
	    			height: 160,
	    			content: '你好，请先选择区域',
	    			hasCloseBtn: true
	    		});
	    		return;
			}

			if($scope.error.city){
				new w.Window().alert({
	    			title: "错误提示",
	    			width: 300,
	    			height: 160,
	    			content: '你好，请先选择城市',
	    			hasCloseBtn: true
	    		});
	    		return;
			}
			

			var info = {
				areaSelectedSearch: $scope.areaSelectedSearch,
				citySelectedSearch: $scope.citySelectedSearch,
				startDateSearch: $scope.startDateSearch,
				endDateSearch: $scope.endDateSearch
			}

			ownerTypeServices.searchData(info, function(response, status){
				//表示已经成功收到查询数据
				$scope.searchDataLoaded = true;
				//设置居住区域
				$scope.liveArea = response.liveArea;
				$scope.OwnerType = response.OwnerType;

				//第1个图表 - 数量统计
				$scope.chartConfigObj1 = {
					categories: response.chart1.categories,
					data: response.chart1.data,
					height: 460
				}
				$scope.chartConfig1 = charts.column1($scope.chartConfigObj1);

				//第2个图表 - 居住区域分布
				$scope.chartConfigObj2 = {
					categories: response.chart2.categories,
					series: response.chart2.series,
					height: 480
				}

				$scope.chartConfig2 = charts.column2($scope.chartConfigObj2);


				//第3个图表 - 性别分布
				$scope.chartConfigObj3 = {
					categories: response.chart3.categories,
					series: response.chart3.series,
					height: 293
				}

				$scope.chartConfig3 = charts.column3($scope.chartConfigObj3);


				//第4个图表 - 年龄段分布
				$scope.chartConfigObj4 = {
					categories: response.chart4.categories,
					series: response.chart4.series,
					height: 293
				}

				$scope.chartConfig4 = charts.column4($scope.chartConfigObj4);

				//第5个图表 - 购买次数分布
				$scope.chartConfigObj5 = {
					categories: response.chart5.categories,
					series: response.chart5.series,
					height: 293
				}

				$scope.chartConfig5 = charts.area1($scope.chartConfigObj5);


				
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})

		}





	}]);
});