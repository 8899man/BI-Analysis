define(['app', 'jquery'], function (app) {
    //console.dir(app);
    app.register.controller('ProjectHomeListCtrl', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', function ($location, $modal, $filter, $scope, $rootScope, $state) {

      $scope.initializeController = function () {
          $rootScope.layout.hasSubs = false;
      }

      $scope.tabSelected.tab = "tab2";

      $scope.keyword = '';

      $scope.TotalRows = 500;
      $scope.PageSize = 20;
      $scope.CurrentPageNumber = 1;

      $scope.houseType = "all";


      $scope.checkDetails = function(id){
        //验证关键词是否有效
        $state.go('app.client.details', {"clientId": id});
      }

  }]);
});

