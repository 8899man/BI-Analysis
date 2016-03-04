define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'turnoverProductServices', 'toastr','htmltoexcel','tableToExcel','tableExport','mybase64'], function (app, w, $) {
//console.dir(app);
	app.register.controller('TrunoverProductController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'turnoverProductServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, turnoverProductServices, toastr,htmltoexcel, tableToExcel, tableExport, mybase64) {
		
		var getYM = function(){
			var now = new Date();
		       
	        var year = now.getFullYear();       //年
	        var month = now.getMonth() + 1;     //月
	        var day = now.getDate();            //日
	       
	        var clock = year + "-";
	       
	        if(month < 10)
	            clock += "0";
	       
	        clock += month + "-";
	       
	        if(day < 10)
	            clock += "0";
	           
	        clock += day + " ";

	        return clock;
		}
		
		var getFirstMonthDay = function(){
			var now = new Date();
		       
	        var year = now.getFullYear();       //年
	        var month = now.getMonth() + 1;     //月
	        var firstdate = year + '-' + month + '-01';
	        return firstdate;
		}
		
		$scope.exporttabledown = function(){
			saveAsExcel("tab");

			angular.element($('#tab')).tableExport({ type: 'excel', escape: 'false' });
		}
		
		$scope.initializeController = function () {

			$scope.startDate = getFirstMonthDay();
			$scope.endDate = getYM();//默认年月

			$scope.getCoverage();

		};

		$scope.getCoverage = function(){
			turnoverProductServices.getCoverage({}, function(response, status){
				//设置区域
				$scope.areas = response.data;
//				$scope.areaSelected = $scope.areas[0];
//				$scope.citySelected = "请选择";
//				if($scope.areaSelected.id != 0){
//					$scope.changeArea();
//				}
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			}).then(function(response){
				//获取完区域范围后执行查询
//				$scope.search();
			});
		};

		$scope.error = {};
    	$scope.areas = [];

		$scope.changeArea = function(){
	        var areaCode = $scope.areaSelected.id;
	        turnoverProductServices.getCompany({"areaCode" : areaCode}, function(response, status){
	        	$scope.citys = response.data;
	        	$scope.error.area = false;
		        $scope.error.city = false;
	        	$scope.citySelected = "";
	        }, function(response, status){
	        	toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
	        });
	        //$scope.citySelected = "";
		}


		$scope.changeCity = function(){
			$scope.error.area = false;
	        $scope.error.city = false;
		}

		$scope.search = function(){
			//首先赋值要查询的对象
			$scope.areaSelectedSearch = $scope.areaSelected;
			$scope.citySelectedSearch = $scope.citySelected;

			$scope.error.area = $scope.areaSelected ? false : true;
			$scope.error.city = $scope.citySelectedSearch ? false : true;
			
			if(!$scope.error.area && $scope.areaSelected.name == "总公司"){
				$scope.error.city = false;
			}
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
			var startDate = $scope.startDate;
			var endDate = $scope.endDate;
			var companyCode = "";
			if($scope.areaSelectedSearch.id == 0){
				companyCode = "0"
			}else{
				companyCode = $scope.citySelectedSearch.id;
			}
			var info = {
				"areaCode": $scope.areaSelectedSearch.id,
				"companyCode": companyCode,
				"startDate": startDate,
				"endDate": endDate
			}

			turnoverProductServices.searchData(info, function(response, status){
				//表示已经成功收到查询数据
				$scope.searchDataLoaded = true;
				//设置居住区域
				$scope.OwnerType = response.data.ppDataList;

				var categories = ["20岁以下","20-34岁","35-44岁","45-54岁","55-64岁","64岁以上","未知"];
				var columnSeries = response.data.ssDtoList;
				var splineSeries = response.data.ssDto;
				
				//第2个图表 - 居住区域分布
				$scope.chartConfigObj1 = {
					categories: categories,
					columnSeries: columnSeries,
					splineSeries: splineSeries,
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