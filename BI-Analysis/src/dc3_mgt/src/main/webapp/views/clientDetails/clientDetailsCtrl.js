define(['app', 'jquery', 'clientDetailsService'], function (app) {
    //console.dir(app);
	app.register.controller('ClientDetailsController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$stateParams', '$timeout', 'util', 'clientDetailsService', function ($location, $modal, $filter, $scope, $rootScope, $stateParams, $timeout, util, clientDetailsService) {
		$scope.initializeController = function () {
			$rootScope.layout.hasSubs = false;
			//console.dir($stateParams)
			$scope.client = {};
			$scope.client.id = $stateParams.clientId;
			
			$scope.getClientDetail($scope.getClientDetailsSuccess, $scope.getClientDetailsError);
			
			
			$scope.initShow = false;


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
		}
		$scope.$on("$destroy", function(){
			$(window).unbind("resize");
		});

		$scope.setHeight = function(){
			util.setMaxHeightSame(".client-details-info", ".client-details-features");
		}
		
		$scope.getClientDetail = function( successFunction, errorFunction){
			clientDetailsService.getClientDetail({'cstGUID' : $stateParams.cstGUID}, successFunction, errorFunction);
		};
		$scope.getClientDetailsSuccess = function(response){
			
			$scope.initShow = true;
			
			console.log(response.data);
			$scope.customer = response.data.customer;
			$scope.tContractRoomList = response.data.tContractRoomList;
			$scope.tContractList = response.data.tContractList;
			$scope.cstMemberList = response.data.cstMemberList;
			$scope.sFollowRecordList = response.data.sFollowRecordList;
			$scope.unionTradeList = response.data.unionTradeList;
			$scope.mailList = response.data.mailList;
			
			if(response.data.oppList != null && response.data.oppList.length > 0){
				$scope.oppList = response.data.oppList;
				$scope.oppSelected = response.data.oppList[0];
			}
			$scope.lifeArea = response.data.lifeArea;
			$scope.hometown = response.data.hometown;
			$scope.address = response.data.address;
			$scope.degree = response.data.degree;
			$scope.job = response.data.job;
			$scope.position = response.data.position;
			if(response.data.tradeList != null && response.data.tradeList.length > 0){
				$scope.tradeList = response.data.tradeList;
				$scope.tradeSelected = response.data.tradeList[0];
			}
			
			$scope.setHeight();
			
		};
		
		$scope.getClientDetailsError = function(response){
			alert(response.header.message);
		};

		
	}]);
});