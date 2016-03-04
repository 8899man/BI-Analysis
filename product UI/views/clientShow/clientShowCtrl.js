define(['app', 'window', 'jquery', 'WdatePicker', 'chart', 'dataToChartConfig', 'filters', 'clientShowServices', 'toastr'], function (app, w, $) {
	//console.dir(app);
	app.register.controller('ClientShowController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'charts', 'dataToChartConfig', 'clientShowServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, charts, dataToChartConfig, clientShowServices, toastr) {

		$scope.initializeController = function () {
			$scope.loaded = false;//初始化未加载过数据，则隐藏内容区
			$scope.getData();
		}


		$scope.getData = function(){
			//console.log(clientShowServices);
			clientShowServices.getData({}, function(response, status){

				$scope.loaded = true;//表示已经加载数据
				//全部客户
				$scope.allCustomer = response.allCustomer;

				//客户分类
				$scope.customerSorts = response.customerSorts;

				//多业态客户
				$scope.customerFormat = response.customerFormat;

				//分类客户占比
				$scope.customerTypeProportion = response.customerTypeProportion;
				dataToChartConfig.dataToPie2Con($scope.customerTypeProportion);

				//第1个图表 - 城市公司客户排行前十位
				$scope.chartConfigObj1 = {
					categories: response.chart1.categories,
					data: response.chart1.data,
					height: 190
				}
				$scope.chartConfig1 = charts.column1($scope.chartConfigObj1);

				//第2个图表 - 城市公司客户排行后十位
				$scope.chartConfigObj2 = {
					colors: ["#b0b0b0"],
					categories: response.chart2.categories,
					data: response.chart2.data,
					height: 190
				}
				$scope.chartConfig2 = charts.column1($scope.chartConfigObj2);

				//标签客户占比
				$scope.labels = response.labels;


			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})
		}





		


	}]);
});

