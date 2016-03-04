define(['app', 'jquery', 'clientSearchServices'], function (app) {
    //console.dir(app);
	app.register.controller('ClientDetailsController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$stateParams', '$timeout', 'util', 'clientSearchServices', function ($location, $modal, $filter, $scope, $rootScope, $stateParams, $timeout, util, clientSearchServices) {

		$scope.initializeController = function () {
			$rootScope.layout.hasSubs = false;
			//console.dir($stateParams)
			$scope.client = {};
			$scope.client.id = $stateParams.clientId;


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


			util.setMaxHeightSame(".client-details-info", ".client-details-features");


			$scope.getData();

		};


		$scope.getData = function(){

			//如果这个数据是已经保存过的，则直接使用保存过的数据，避免从客户查询过来，多请求一次数据
			if(clientSearchServices.getClientFromId($scope.client.id)){

				//把scope上客户的数据通过已保存的客户获取
				var client = clientSearchServices.getClientFromId($scope.client.id);
				//console.dir(client);

			}else{
				//如果没有被保存则ajax请求

			}

		}


		$scope.$on("$destroy", function(){
			$(window).unbind("resize");
		});

		$scope.setHeight = function(){
			util.setMaxHeightSame(".client-details-info", ".client-details-features");
		}



		//意向特征选项
		$scope.intentions = [
			{
				title: "坪山花园城一期",
				grade: "A",
				layout: "三室两厅",
				area: "145-200平米",
				type: "复式",
				price: "普通住宅",
				region: "深圳-南山",
				project: "花园城一期"
			},
			{
				title: "坪山花园城二期",
				grade: "B",
				layout: "四室两厅",
				area: "80-100平米",
				type: "复式",
				price: "普通住宅",
				region: "深圳-福田",
				project: "花园城二期"
			},
			{
				title: "坪山花园城三期",
				grade: "C",
				layout: "三室两厅",
				area: "145-200平米",
				type: "复式",
				price: "豪宅",
				region: "深圳-盐田",
				project: "花园城一期"
			}
		]
		$scope.intention = $scope.intentions[0];



		//房产特征选项
		$scope.houses = [
			{
				title: "坪山花园城一期",
				type: "复式",
				layout: "三室两厅",
				area: "145-200平米",
				price: "普通住宅",
				region: "深圳-南山",
				project: "花园城一期",
				feature: "学区房，免税，红本在手"
			},
			{
				title: "坪山花园城二期",
				type: "复式",
				layout: "三室两厅",
				area: "145-200平米",
				price: "豪宅",
				region: "深圳-福田",
				project: "花园城二期",
				feature: "红本在手"
			}
		]
		$scope.house = $scope.houses[0];



		$scope.clientDetails = {
			baseInfo: {
				tels: ['13752012023', '13652365203', '16965201252'],
				houses: [
					{
						"houseName": "花园城-8栋8A",
						"houseId": "00001"
					},
					{
						"houseName": "花园城-8栋8B",
						"houseId": "00002"
					}
				],
				certificates: ["420106********1210", "420106********5262"],
				emails: ["liuyao@sxit.com.cn", "maozedong@sxit.com.cn"]

			}
		}




	}]);
});