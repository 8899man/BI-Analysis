define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'turnoverCustomerServices', 'toastr'], function (app, w, $) {
//console.dir(app);
	app.register.controller('TurnoverCustomerController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'turnoverCustomerServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, turnoverCustomerServices, toastr) {
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

			//默认单位是"集团"
			$scope.unit = {
				title: "集团",
				countCode: "-1",
				unitType: "group"
			}
			$scope.searchData();
		};

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
		
		$scope.firstLoadedData = null;//第一次请求的数据

		$scope.searchBack = function(item){
			//console.dir($scope.hasSearchedData[id + dateTypeSearch + dateYMSearch]);
			if(item.unitType == "city"){
				//返回区域列表
				$scope.setData($scope.firstLoadedData);
				//重置导出选项选项
				//console.log($scope.dateYM);
				$scope.dateTypeSearch = $scope.dateType;
				$scope.dateYMSearch = $scope.dateYM;
				$scope.unitSearch = $scope.unit = {
					title: "集团",
					countCode: "-1",
					unitType: "group"
				}
			}else{
				//返回城市列表
				$scope.setData($scope.citiesLoadedData);
				$scope.dateTypeSearch = $scope.dateTypeCity;
				$scope.dateYMSearch = $scope.dateYMCity;
				$scope.unitSearch = $scope.unit = $scope.unitCity;
			}
			
			//location.reload();
		}


		$scope.search = function(unit){
			//通过点击单位进入
			$scope.unit = unit;
			$scope.unitSearch.countCode = unit.countCode;
			$scope.unitSearch.unitType = unit.unitType;
			$scope.searchData();
		}
		

		$scope.searchData = function(){
			//首先赋值要查询的对象
			$scope.dateTypeSearch = $scope.dateType;
			$scope.dateYMSearch = $scope.dateYM;
			$scope.unitSearch = $scope.unit;

			var info = {
//				dateTypeSearch: $scope.dateTypeSearch,
//				dateYMSearch: $scope.dateYMSearch,
				countCode: $scope.unitSearch.countCode,
				unitType: $scope.unitSearch.unitType,
			}
			
//			console.log(info);

			turnoverCustomerServices.searchData(info, function(response, status){
				
//				console.log(response.data);
				
				$scope.groupItems = response.data.groupItems;
				$scope.huxingList = response.data.huxingList;
				$scope.mianjiList = response.data.mianjiList;
				$scope.ageList = response.data.ageList;
				$scope.sexList = response.data.sexList;
				$scope.turnoverCustomerData = response.data.turnoverCustomerData;
				
				//表示已经成功收到查询数据
				$scope.searchDataLoaded = true;

				//保存初始数据
				if($scope.unitSearch.countCode == "-1"){
					$scope.firstLoadedData = response.data;//赋值到firstLoadedData对象上
				}

				//保存返回的城市列表信息
				if($scope.unitSearch.unitType == "area"){
					$scope.citiesLoadedData = response.data;//赋值到firstLoadedData对象上
					$scope.dateTypeCity = $scope.dateType;
					$scope.dateYMCity = $scope.dateYM;
					$scope.unitCity = $scope.unit;
				}

				$scope.setData(response.data);
				
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})

		}

		$scope.setData = function(params){
			
//			console.dir("setData: ");
//			console.log(params)
			
			//设置数据列表
			$scope.list = params.turnoverCustomerData;
			$scope.fromId = params.fromId;
			
			// int chart1
			var chart1 = {
					categories: [],
					data: [],
					height: 460
			}
			
			var chart3 = {
				"categories": [],
				"series": [],
				height: 293
			}
			//chart3
			for (var _i3 = 0; _i3<$scope.sexList.length; _i3++) {
				var _chart3_series = {name: "", data: []};
				var _sex = $scope.sexList[_i3];
				_chart3_series.name = _sex.name;
				
				
				for (var _j3 = 0; _j3<$scope.list.length; _j3++) {
					var item = $scope.list[_j3];
					if (_i3 == 0) {
						chart3.categories.push(item.countType);
					}
					_chart3_series.data.push(item[_sex.alisName]);
				}
				chart3.series.push(_chart3_series);
			}
			
			var chart4 = {
					categories: [],
					series: [],
					colors: ['#f99506', '#28b778', '#26a9e3', '#5371c7'],
					height: 293
			}
			
			var chart5 = {
					categories: [],
					series: [],
					height: 293
			};
			for (var a=0; a<$scope.list.length; a++) {
				var item = $scope.list[a];
				
				//chart1
				chart1.categories.push(item.countType);
				chart1.data.push(item.total);
				
				
				//chart4
				var _chart4_series = {name: "", data: []};
				for (var d=0; d<$scope.huxingList.length; d++) {
					var _huxing = $scope.huxingList[d];
					_chart4_series.name = item.countType;
					chart4.categories.push(_huxing.name);
					_chart4_series.data.push(item[_huxing.alisName]);
				}
				chart4.series.push(_chart4_series);
				
				//chart5
				var _chart5_series = {name: "", data: []};
				for (var _m=0; _m<$scope.mianjiList.length; _m++) {
					var _mianji = $scope.mianjiList[_m];
					_chart5_series.name = item.countType;
					chart5.categories.push(_mianji.name);
					_chart5_series.data.push(item[_mianji.alisName]);
				}
				chart5.series.push(_chart5_series);
			}
			
//			console.log(chart5);
			
			//第1个图表 - 数量统计
			$scope.chartConfigObj1 = chart1
			if (chart1.categories.length > 0) {
				$scope.chartConfig1 = charts.column1($scope.chartConfigObj1);
			}

			//第2个图表 - 居住区域分布
			$scope.chartConfigObj2 = {
				"categories": ["别墅","洋房","普通多房","小高层","高层","超高层"],
				"series": [
					{
						"name": "深圳市",
			            "data": [30, 20, 18, 12, 31, 12]
					},
					{
						"name": "广州市",
			            "data": [15, 12, 12, 11, 21, 8]
					},
					{
						"name": "佛山市",
			            "data": [10, 8, 7, 5, 21, 32]
					},
					{
						"name": "东莞市",
			            "data": [8, 6, 4, 2, 6, 9]
					}
				],
				height: 480
			}

			$scope.chartConfig2 = charts.column2($scope.chartConfigObj2);


			//第3个图表 - 性别分布
			$scope.chartConfigObj3 = chart3
			if (chart3.categories.length > 0) {
				$scope.chartConfig3 = charts.column4($scope.chartConfigObj3);
			}

			$scope.chartConfigObj4 = chart4;
			if (chart4.categories.length > 0) {
				$scope.chartConfig4 = charts.area1($scope.chartConfigObj4);
			}
			
			$scope.chartConfigObj5 = chart5;
			if (chart5.categories.length > 0) {
				$scope.chartConfig5 = charts.column4($scope.chartConfigObj5);
			}
		}



		//导出按钮事件
		$scope.downloadData = function(){
			/*
	            var form = $("<form>");   //定义一个form表单
	            form.attr('style', 'display:none');   //在form表单中添加查询参数
	            form.attr('target', '');
	            form.attr('method', 'post');
	            form.attr('action', "/api/ExportHandler.ashx");
	            var input1 = $('<input>');
	            input1.attr('type', 'hidden');
	            input1.attr('name', 'dateTypeSearch');
	            input1.attr('value', $scope.dateTypeSearch);
	            var input2 = $('<input>');
	            input2.attr('type', 'hidden');
	            input2.attr('name', 'dateYMSearch');
	            input2.attr('value', $scope.dateYMSearch);
	            var input3 = $('<input>');
	            input3.attr('type', 'hidden');
	            input3.attr('name', 'unitSearchId');
	            input3.attr('value', $scope.unitSearch.id);
	            $('body').append(form);  //将表单放置在web中
	            form.append(input1);   //将查询参数控件提交到表单上
	            form.submit();   //表单提交
	            */
		}
	}]);
});