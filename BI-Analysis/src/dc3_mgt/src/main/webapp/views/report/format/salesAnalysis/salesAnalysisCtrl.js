define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'salesAnalysisServices', 'toastr'], function (app, w, $) {
//console.dir(app);
	app.register.controller('SalesAnalysisController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'salesAnalysisServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, salesAnalysisServices, toastr) {
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

			$scope.endDate = getYM();//默认年月
			$scope.startDate = getFirstMonthDay();

			$scope.searchData();
		};


		$scope.searchData = function(){
			//首先赋值要查询的对象
			
			var startDate = $scope.startDate;
			var endDate = $scope.endDate;
			var info = {
				"startDate": startDate,
				"endDate": endDate
			}

			salesAnalysisServices.searchData(info, function(response, status){
				//表示已经成功收到查询数据
				$scope.searchDataLoaded = true;

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
			$scope.tabList = response.data.yeTaiTabData;
			
			//第1个图表
			$scope.chartConfigObj1 = {
				categories: response.data.yeTaiMap1Data.cityName,
				data: response.data.yeTaiMap1Data.compPromNum,
				type: 'bar',
				align: 'left',
				height: 293
			}
			$scope.chartConfig1 = charts.column1($scope.chartConfigObj1);


			//第2个图表
			$scope.chartConfigObj2 = {
				categories: response.data.yeTaiMap2Data.categories,
				columnSeries: response.data.yeTaiMap2Data.columnSeries,
				splineSeries: response.data.yeTaiMap2Data.splineSeries,
				yAxisTitle: [],
				colors: ['#28b778', '#f99506'],
				height: 293
			}

			$scope.chartConfig2 = charts.mix2($scope.chartConfigObj2);

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