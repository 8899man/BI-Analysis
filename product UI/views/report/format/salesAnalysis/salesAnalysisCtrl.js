define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'salesAnalysisServices', 'toastr'], function (app, w, $) {
//console.dir(app);
	app.register.controller('SalesAnalysisController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'salesAnalysisServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, salesAnalysisServices, toastr) {
		var getYM = function(){
			var now = new Date();
			var Y = now.getFullYear();
			var M = now.getMonth() + 1;
			return Y + "年" + (M>=10?M:("0" + M)) + "月"
		}
		

		$scope.initializeController = function () {

			

			//默认单位是"集团"
			$scope.unit = {
				title: "集团",
				id: "-1",
				type: "group"
			}

			

			$scope.selectRadio = "月报";//默认选择月报

			$scope.getCoverage();

		};


		


		
		$scope.firstLoadedData = null;//第一次请求的数据


		$scope.getCoverage = function(){
			salesAnalysisServices.getCoverage({}, function(response, status){
				//console.dir(response);
				//设置区域
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



		

		$scope.searchBack = function(idSearchPrev, dateTypeSearchPrev, dateYMSearchPrev){
			//console.dir($scope.hasSearchedData[id + dateTypeSearch + dateYMSearch]);
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
			//location.reload();
		}


		$scope.search = function(unit){
			//通过点击单位进入
			$scope.unit = unit;
			$scope.searchData();
		}
		

		$scope.searchData = function(){
			//首先赋值要查询的对象
			$scope.startDateSearch = $scope.startDate;
			$scope.endDateSearch = $scope.endDate;
			$scope.unitSearch = $scope.unit;
			

			var info = {
				startDateSearch: $scope.startDateSearch,
				endDateSearch: $scope.endDateSearch,
				unitId: $scope.unitSearch.id,
				unitType: $scope.unitSearch.type,
			}

			salesAnalysisServices.searchData(info, function(response, status){
				//表示已经成功收到查询数据
				$scope.searchDataLoaded = true;

				//保存初始数据
				if($scope.unitSearch.id == "-1"){
					$scope.firstLoadedData = response;//赋值到firstLoadedData对象上
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

			//第1个图表
			/*$scope.chartConfigObj1 = {
				categories: response.chart1.categories,
				data: response.chart1.data,
				type: 'bar',
				align: 'left',
				height: 293
			}
			$scope.chartConfig1 = charts.column1($scope.chartConfigObj1);*/

			

			//第2个图表
			$scope.chartConfigObj2 = {
				categories: response.chart2.categories,
				columnSeries: [],
				splineSeries: response.chart2.splineSeries,
				yAxisTitle: "问题数",
				colors: ['#28b778', '#f99506', '#f74c4c', '#26a9e3'],
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