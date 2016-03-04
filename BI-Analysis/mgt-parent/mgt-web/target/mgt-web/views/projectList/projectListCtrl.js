define(['app', 'jquery'], function (app) {
    //console.dir(app);
	app.register.controller('ProjectListController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', function ($location, $modal, $filter, $scope, $rootScope, $state) {

		$scope.tabSelected = {};

		$scope.initializeController = function () {
			$rootScope.layout.hasSubs = false;
			//console.log(333333);
		}


	}]);
});
