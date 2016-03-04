define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'ownerTypeServices', 'toastr'], function (app, w, $) {
//console.dir(app);
	app.register.controller('OwnerTypeController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'ownerTypeServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, ownerTypeServices, toastr) {
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
		

		$scope.initializeController = function () {

			$scope.dateYM = getYM();//默认年月
			$scope.getFirstMonthDay = getFirstMonthDay();
			$scope.dateType = "7天";//默认选中七天

			//时段
			$scope.timeIntervals = [
				{
					title: "签约时段",
					value: "1"
				},
				{
					title: "入伙时段",
					value: "2"
				}
			];
			$scope.currentTimeInterval = $scope.timeIntervals[0];
			$scope.getCoverage();
		}

		//监听年月的变化
		$scope.$watch('dateYM', function(value){
			if(value==undefined || value==""){
				return;
			}
			//一旦年月变化了 dateType置空
			$scope.dateType = "";
		});

		//监听dateType变化
		$scope.$watch('dateType', function(value){
			if(value==undefined || value==""){
				return;
			}
			//一旦年月变化了 dateYM年月置空
			$scope.dateYM = "";
		});




		$scope.getCoverage = function(){
			ownerTypeServices.getCoverage({}, function(response, status){
				//设置区域
				$scope.areas = response.data;
//				$scope.areaSelected = $scope.areas[0];
//				$scope.citySelected = $scope.areas[0]["subs"][0];
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
			ownerTypeServices.getCompanys({areaCode: $scope.areaSelected.id} , function(response) {
				$scope.areaSelected.subs = response.data;
				$scope.error.area = false;
		        $scope.error.city = false;
		        $scope.citySelected = "";
			}, function(response) {
				new w.Window().alert({
	    			title: "错误提示",
	    			width: 300,
	    			height: 160,
	    			content: '数据错误!',
	    			hasCloseBtn: true
	    		});
			})
		}


		$scope.changeCity = function(){
			$scope.error.area = false;
	        $scope.error.city = false;
		}

		$scope.search = function(){
			//首先赋值要查询的对象
			$scope.areaSelectedSearch = $scope.areaSelected;
			$scope.citySelectedSearch = $scope.citySelected;
			$scope.currentTimeIntervalSearch = $scope.currentTimeInterval;
//			$scope.dateTypeSearch = $scope.dateType;
//			$scope.dateYMSearch = $scope.dateYM;


			$scope.error.area = $scope.areaSelected ? false : true;
//			$scope.error.city = $scope.citySelectedSearch ? false : true;
			
			if(!$scope.error.area && $scope.areaSelected.name == "集团"){
				$scope.error.city = false;
			}

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
			
			
//			var info = {
//				areaSelectedSearch: $scope.areaSelectedSearch,
//				citySelectedSearch: $scope.citySelectedSearch,
//				currentTimeIntervalSearch: $scope.currentTimeIntervalSearch,
//				dateTypeSearch: $scope.dateTypeSearch,
//				dateYMSearch: $scope.dateYMSearch
//			}
			
			var _info = {
				areaCode : $scope.areaSelectedSearch.id,
				areaName : $scope.areaSelectedSearch.name,
				companyCode : $scope.citySelectedSearch.id,
				currentTimeIntervalSearchValue: $scope.currentTimeIntervalSearch.value,
				dateTypeSearch: $scope.dateTypeSearch,
				dateYMSearch: $scope.dateYMSearch
			}
			
			ownerTypeServices.searchData(_info , function(response, status){
				
				//表示已经成功收到查询数据
				$scope.searchDataLoaded = true;
				
				//设置居住区域
				
				$scope.liveArea = response.data.liveArea;
				$scope.OwnerType = response.data.OwnerType;
				$scope.sexs = response.data.sexs;
				$scope.ages = response.data.ages;
				
				
				//获取购买次数chart5
				
				ownerTypeServices.getBuyTimesData(_info, function(response) {
					var buyTimesData = response.data.buyTimesData,
						buycountList = response.data.buycountList,
						yezhuList = response.data.yezhuList;
					var chart5 = {
						"categories": ["准业主","磨合期业主","稳定期业主","老业主"],
						"series": [
							{
								"name": "1次",
					            "data": [32, 20, 18, 10]
							},
							{
								"name": "2次",
					            "data": [15, 12, 12, 10]
							},
							{
								"name": "2次以上",
					            "data": [10, 8, 7, 10]
							}
						]
					};
					
					chart5 = {
						categories:[],
						series: []
					};
					
					for (var a=0; a<buycountList.length; a++) {
						var buycount = buycountList[a];
						
						var _chart5_series = {name: "", data:[]};
						_chart5_series.name = buycount.name;
						for (var b=0; b<buyTimesData.length; b++) {
							var buyTime = buyTimesData[b];
							if (a==0) {
								chart5.categories.push(buyTime.owner_type);
							}
							_chart5_series.data.push(buyTime[buycount.alisName]);
						}
						chart5.series.push(_chart5_series);
					}
					
					//第5个图表 - 购买次数分布
					$scope.chartConfigObj5 = chart5;
					if (chart5.categories.length > 0) {
						$scope.chartConfig5 = charts.area1($scope.chartConfigObj5);
					}
				}, function() {
					
				})
				
				var chart1 = {
					categories:[],
					data:[],
					height: 460
				};
				
				var chart2 = {
					categories:[],
					series:[],
					height: 480
				}
				
				var chart3 = {
					categories:[],
					series:[],
					height: 293
				}
				
				var chart4 = {
					categories:[],
					series:[],
					height: 293
				}
				
				
				
				//chart3
				for (var _i3 = 0; _i3<$scope.sexs.length; _i3++) {
					var _chart3_series = {name: "", data: []};
					var _sex = $scope.sexs[_i3];
					_chart3_series.name = _sex.alisName;
					
					
					for (var _j3 = 0; _j3<$scope.OwnerType.length; _j3++) {
						var _owner = $scope.OwnerType[_j3];
						if (_i3 == 0) {
							chart3.categories.push(_owner.ctype);
						}
						_chart3_series.data.push(_owner[_sex.alisName]);
					}
					chart3.series.push(_chart3_series);
				}
				
				for (var i=0; i<$scope.OwnerType.length; i++) {
					var _owner = $scope.OwnerType[i];
					
					chart1.categories.push(_owner.ctype);
					
					//chart1
					var num = 0;
					for (var j=0; j<$scope.sexs.length; j++) {
						_sex = $scope.sexs[j];
						num = num*1 + _owner[_sex.alisName]*1;
					}
					$scope.OwnerType[i].count = num;
					chart1.data.push(num);
					
					
					//chart2
					
					var _chart2_series = {name: "", data: []};
					_chart2_series.name = _owner.ctype;
					for (var z=0; z<$scope.liveArea.length; z++) {
						var _liveArea = $scope.liveArea[z];
						chart2.categories.push(_liveArea.alisName);
						_chart2_series.data.push(_owner[_liveArea.alisName]);
					}
					chart2.series.push(_chart2_series);
					
					
					//chart4
//					chart4.categories.push(_owner.ctype);
					var _chart4_series = {name: "", data: []};
					for (var _m=0; _m<$scope.ages.length; _m++) {
						var _age = $scope.ages[_m];
						_chart4_series.name = _owner.ctype;
						chart4.categories.push(_age.alisName);
						_chart4_series.data.push(_owner[_age.alisName]);
					}
					chart4.series.push(_chart4_series);
				}
				
//				console.log(chart4);

				//第1个图表 - 数量统计
				$scope.chartConfigObj1 = chart1;
				if (chart1.categories.length > 0) {
					$scope.chartConfig1 = charts.column1($scope.chartConfigObj1);
				} 

				//第2个图表 - 居住区域分布
				$scope.chartConfigObj2 = chart2;
				if (chart2.categories.length > 0) {
					$scope.chartConfig2 = charts.column2($scope.chartConfigObj2);
				}

				//第3个图表 - 性别分布
				$scope.chartConfigObj3 = chart3;
				if (chart3.categories.length > 0) {
					$scope.chartConfig3 = charts.column3($scope.chartConfigObj3);
				}

				//第4个图表 - 年龄段分布
				$scope.chartConfigObj4 = chart4;
				if (chart4.categories.length > 0) {
					$scope.chartConfig4 = charts.column4($scope.chartConfigObj4);
				}
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})

		}

	}]);
});