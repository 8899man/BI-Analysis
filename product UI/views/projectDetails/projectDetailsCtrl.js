define(['app', 'jquery', 'chart', 'dataToChartConfig', 'filters'], function (app) {

	

    //console.dir(app);
	app.register.controller('ProjectDetailsController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$stateParams', '$timeout', 'util', 'charts', 'dataToChartConfig', function ($location, $modal, $filter, $scope, $rootScope, $stateParams, $timeout, util, charts, dataToChartConfig) {

		//console.dir(pie);

		//$scope.charts = charts;


		/*业态指数 认购 签约 在售圆饼 开始*/
		$scope.chartConfig1 = [
			['认购', 400],
			['签约', 280],
			['在售', 800]
		];

		$scope.chartConfig1 = dataToChartConfig.dataToPie1Con($scope.chartConfig1)
		/*业态指数 认购 签约 在售圆饼 结束*/


		/*业态指数右边两个圆弧 开始*/
		$scope.exponential = [
			{
				title: '成交金额（千万元）',
				finished: 0,
				noFinished: 84
			},
			{
				title: '成交套数（套）',
				finished: 60,
				noFinished: 140
			}
		]
		dataToChartConfig.dataToPie2Con($scope.exponential)
		/*业态指数右边两个圆弧 结束*/

		/*关键流程分析开始*/

		$scope.projectProcesses = [
			{
				title: "到访----认购时间",
				usedDays: 12,
				baseline: 10
			},
			{
				title: "认购----签约时间",
				usedDays: 5,
				baseline: 7
			}
		]

		/*关键流程分析结束*/


		/*转化率分析 开始*/
		$scope.fractional = [
			{
				title: '来电转到访',
				finished: 15,
				noFinished: 75
			},
			{
				title: '到访转认筹',
				finished: 45,
				noFinished: 59
			},
			{
				title: '到访转认购',
				finished: 55,
				noFinished: 8
			},
			{
				title: '认筹转认购',
				finished: 25,
				noFinished: 79
			},
			{
				title: '认购转签约',
				finished: 85,
				noFinished: 25
			},
			{
				title: '签约转回款',
				finished: 35,
				noFinished: 65
			}
		]

		dataToChartConfig.dataToPie2Con($scope.fractional)

		/*转化率分析 结束*/






		$scope.chartConfigObj4 = [
			['20岁以下', 9100],
			['20-34岁', 7600],
			['35-44岁', 2800],
			['45-54岁', 2600],
			['55-64岁', 2100],
			['64岁以上', 800]
		];
		$scope.chartConfig4 = charts.pie3($filter('addDataKey')($scope.chartConfigObj4));



		$scope.chartConfigObj5 = {
			categories: ['银行','保险','航空','能源','政府机关'],
			data: [17480, 8780, 1250, 3245, 2535]
		}

		$scope.chartConfig5 = charts.column1($scope.chartConfigObj5);


		$scope.chartConfigObj6 = {
			categories: ['揭阳市','长沙市','武汉市','贵州市','南宁市', '香港'],
			data: [17480, 8780, 1250, 3245, 2535, 9800]
		}
		$scope.chartConfig6 = charts.column1($scope.chartConfigObj6);





	    


		$scope.initializeController = function () {
			$rootScope.layout.hasSubs = false;
			//console.dir($stateParams)
			$scope.project = {};
			$scope.project.id = $stateParams.projectId;
			//console.log($scope.project.id);
			//获取传入的id做ajax请求处理

			//绑定屏幕变化时候执行计算高度
			var windowTime = null;
			$(window).resize(function(){
				windowTime && $timeout.cancel(windowTime);
				windowTime = $timeout(function(){
					//console.log("timeout");
					$scope.setHeight();
				},300)
			})

			$scope.setHeight();

			

		}

		$scope.$on("$destroy", function(){
			$(window).unbind("resize");
		});

		$scope.setHeight = function(){
			//console.log(111);
			util.setMaxHeightSame(".client-details-info", ".project-details-feature", true);
		};



		//默认展示项目目标
		$scope.featuresType = "projectTarget";

		$scope.changeFeaturesType = function(type){
			if($scope.featuresType == type){
				return;
			}
			$scope.featuresType = type;
			$scope.setHeight();
		}
		


                
                



	}]);
});