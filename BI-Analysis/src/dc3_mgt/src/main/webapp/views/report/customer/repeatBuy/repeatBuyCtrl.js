define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'repeatBuyServices', 'toastr'], function (app, w, $) {
//console.dir(app);
	app.register.controller('RepeatBuyController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'repeatBuyServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, repeatBuyServices, toastr) {
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
				id: "-1",
				type: "group"
			}

			

			$scope.searchData();

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

		
		$scope.firstLoadedData = null;//第一次请求的数据



		

		$scope.searchBack = function(item){
			if(item.type == "city"){
				//返回区域列表
				$scope.setData($scope.firstLoadedData);
				//重置导出选项选项
				//console.log($scope.dateYM);
				$scope.dateTypeSearch = $scope.dateType;
				$scope.dateYMSearch = $scope.dateYM;
				$scope.unitSearch = $scope.unit = {
					title: "集团",
					id: "-1",
					type: "group"
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
			$scope.searchData();
		}
		

		$scope.searchData = function(){
			//首先赋值要查询的对象
			$scope.dateTypeSearch = $scope.dateType;
			$scope.dateYMSearch = $scope.dateYM;
			$scope.unitSearch = $scope.unit;
			

			var info = {
				dateTypeSearch: $scope.dateTypeSearch,
				dateYMSearch: $scope.dateYMSearch,
				unitId: $scope.unitSearch.id,
				unitType: $scope.unitSearch.type,
			}

			repeatBuyServices.searchData(info, function(response, status){
				//表示已经成功收到查询数据
				$scope.searchDataLoaded = true;

				//保存初始数据
				if($scope.unitSearch.id == "-1"){
					$scope.firstLoadedData = response;//赋值到firstLoadedData对象上
				}

				//保存返回的城市列表信息
				if($scope.unitSearch.type == "area"){
					//保存城市列表相关信息
					$scope.citiesLoadedData = response;//赋值到firstLoadedData对象上
					$scope.dateTypeCity = $scope.dateType;
					$scope.dateYMCity = $scope.dateYM;
					$scope.unitCity = $scope.unit;
				}
				

				$scope.setData(response);
				
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})

		}

		$scope.setData = function(response){
			
			//设置数据列表
			$scope.list = response.list;
			$scope.fromId = response.fromId;

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

			$scope.chartConfig3 = charts.column4($scope.chartConfigObj3);


			//第4个图表 - 年龄段分布
			$scope.chartConfigObj4 = {
				categories: response.chart4.categories,
				series: response.chart4.series,
				colors: ['#f99506', '#28b778', '#26a9e3', '#5371c7'],
				height: 293
			}

			$scope.chartConfig4 = charts.area1($scope.chartConfigObj4);

			//第5个图表 - 购买次数分布
			$scope.chartConfigObj5 = {
				categories: response.chart5.categories,
				series: response.chart5.series,

				height: 293
			}

			$scope.chartConfig5 = charts.column4($scope.chartConfigObj5);
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