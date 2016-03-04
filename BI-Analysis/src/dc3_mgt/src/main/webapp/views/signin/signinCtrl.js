define(['app', 'jquery'], function (app) {
    //console.dir(app);
	app.register.controller('SigninController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', function ($location, $modal, $filter, $scope, $rootScope, $state) {


		$scope.initializeController = function () {
			//$rootScope.layout.hasSubs = false;
		}

		$scope.login = function() {
			//跳转之前验证是否正确
			$state.go('app.client.search');
		}


	}]);
});
