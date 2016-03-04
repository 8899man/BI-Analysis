define(['app', 'jquery', 'salesQuery', 'toastr'], function (app) {
    //console.dir(app);
	app.register.controller('SalesQueryController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', 'salesQuery', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, salesQuery, toastr) {

		//console.log(salesQuery);

		$scope.initializeController = function () {
			$rootScope.layout.hasSubs = false;

			$scope.bans = [];
			$scope.units = [];

			$scope.getSalesQuery();
			
		};

		//获取数据
		$scope.getSalesQuery = function(){
			salesQuery.getSalesQuery({}, $scope.getSalesQuerySuccess, $scope.getSalesQueryError);
		};


		$scope.getSalesQuerySuccess = function(response, status){
			//console.log("response");
			//console.dir(response);
			$scope.bans = response;
			$scope.ban = $scope.bans[0];

			$scope.units = $scope.ban.units;
			$scope.unit = $scope.units[0];

			$scope.houses = $scope.unit.houses;

		};

		$scope.getSalesQueryError = function(response, status){
			toastr.warning('获取数据失败', '提示', {
				closeButton: true,
				timeOut: 5000
			});
		};

		$scope.setBanShow = function(ban){
			if($scope.ban == ban){
				return;
			}
			$scope.houseNumber = "";
			$scope.ban = ban;
			$scope.units = ban.units;
			$scope.unit = $scope.units[0];
			$scope.houses = $scope.unit.houses;
		};

		$scope.setUnitShow = function(unit){
			if($scope.unit == unit){
				return;
			}
			$scope.houseNumber = "";
			$scope.unit = unit;
			$scope.houses = $scope.unit.houses;
		};

		$scope.changeBan = function(ban){
			$scope.houseNumber = "";
			$scope.units = ban.units;
			$scope.unit = $scope.units[0];
			$scope.houses = $scope.unit.houses;
		}

		$scope.changeUnit = function(unit){
			$scope.houseNumber = "";
			$scope.unit = unit;
			$scope.houses = $scope.unit.houses;
		}

		$scope.search = function(){
			//console.log("search");
			$scope.houses = $scope.unit.houses;
			$scope.houses = $filter('filter')($scope.houses, {'houseTitle': $scope.houseNumber})
		}


	}]);
});
