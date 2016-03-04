define(['app', 'jquery'], function (app) {
//console.dir(app);
	app.register.controller('MarketingController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', function ($location, $modal, $filter, $scope, $rootScope, $state) {

		$scope.initializeController = function () {
			//$rootScope.layout.hasSubs = true;
			
			
		}
		$scope.banner = {};

		$scope.changeBanner = function(index){
			if($scope.banner.active == index){
				return;
			}
			$scope.banner.active = index;
		}




	}]);
});

