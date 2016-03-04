define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'turnoverProductServices', 'toastr'], function (app, w, $) {
//console.dir(app);
	app.register.controller('TrunoverProductController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'turnoverProductServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, turnoverProductServices, toastr) {
		var getYM = function(){
			var now = new Date();
			var Y = now.getFullYear();
			var M = now.getMonth() + 1;
			return Y + "年" + (M>=10?M:("0" + M)) + "月"
		}
		

		$scope.initializeController = function () {

			// $scope.dateYM = "";//默认年月
			// $scope.dateType = "7天";//默认选中七天

			//时段
			/*$scope.timeIntervals = [
				{
					title: "签约时段",
					value: "1"
				},
				{
					title: "入伙时段",
					value: "2"
				}
			];
			$scope.currentTimeInterval = $scope.timeIntervals[0];*/

			$scope.selectRadio = "月报";//默认选择月报


			$scope.getCoverage();

		};


		
		$scope.getCoverage = function(){
			turnoverProductServices.getCoverage({}, function(response, status){
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
			//$scope.currentTimeIntervalSearch = $scope.currentTimeInterval;
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
				//currentTimeIntervalSearch: $scope.currentTimeIntervalSearch,
				startDateSearch: $scope.startDateSearch,
				endDateSearch: $scope.endDateSearch
			}

			turnoverProductServices.searchData(info, function(response, status){
				//表示已经成功收到查询数据
				$scope.searchDataLoaded = true;
				//设置居住区域
				$scope.liveArea = response.liveArea;
				$scope.OwnerType = response.OwnerType;

				

				//第2个图表 - 居住区域分布
				$scope.chartConfigObj1 = {
					categories: response.chart1.categories,
					columnSeries: response.chart1.columnSeries,
					splineSeries: response.chart1.splineSeries,
					yAxisTitle: ['客<br>户<br>数<br>量', '年<br>龄<br>区<br>段<br>数<br>量'],
					height: 480
				}

				$scope.chartConfig1 = charts.mix1($scope.chartConfigObj1);



				
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})

		}





	}]);
});