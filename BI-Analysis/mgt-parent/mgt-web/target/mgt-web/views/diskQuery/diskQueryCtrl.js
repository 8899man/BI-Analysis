define(['app', 'jquery'], function (app) {
    //console.dir(app);
	app.register.controller('DiskQueryController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', function ($location, $modal, $filter, $scope, $rootScope, $state) {


		$scope.initializeController = function () {
			$rootScope.layout.hasSubs = false;
		}



		$scope.keyword = '';

		$scope.TotalRows = 500;
		$scope.PageSize = 20;
		$scope.CurrentPageNumber = 1;

		$scope.houseType = "all";


	}]);
});
