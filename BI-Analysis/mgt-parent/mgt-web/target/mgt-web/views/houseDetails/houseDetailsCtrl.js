define(['app', 'jquery', "window", "houseDetailService"], function (app) {

    //console.dir(app);
	app.register.controller('HouseDetailsController', ['$location', '$http', '$modal', '$filter', '$scope', '$rootScope', '$stateParams', '$timeout', 'util', "houseDetailService", function ($location, $http, $modal, $filter, $scope, $rootScope, $stateParams, $timeout, util, houseDetailService) {


		$scope.initializeController = function () {
			$rootScope.layout.hasSubs = false;
			//console.dirhouseDetailService($stateParams)houseDetail
			$scope.project = {};
			$scope.project.id = $stateParams.houseId;
			//console.log($scope.project.id);
			//获取传入的id做ajax请求处理
			
			var reqData = $stateParams.houseId;
			
			houseDetailService.houseDetail({"reqData": reqData}, function(response) {
				//console.log(response);
				$scope.data = response.data;
				$scope.setHeight();
			}, function(response) {
				
			});
			
			/*
			$http.get("house/houseDetail").success(function(response) {
				
				alert(1);
			})*/
			

			//绑定屏幕变化时候执行计算高度
			var windowTime = null;
			$(window).resize(function(){
				//console.log("resize")
				windowTime && $timeout.cancel(windowTime);
				windowTime = $timeout(function(){
					//console.log("timeout");
					$scope.setHeight();
				},300)
			})

			util.setMaxHeightSame(".client-details-info", ".project-details-feature", true);

		};

		$scope.$on("$destroy", function(){
			$(window).unbind("resize");
		});

		$scope.setHeight = function(){
			//console.log("resizeAAA");
			//console.log(111);
			util.setMaxHeightSame(".client-details-info", ".project-details-feature", true);
		}


	}]);
});
