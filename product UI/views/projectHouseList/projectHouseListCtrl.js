define(['app', 'jquery', 'projectHouseListService', 'toastr'], function (app) {
    //console.dir(app);
    app.register.controller('ProjectHouseListCtrl', ['$location', '$timeout', '$modal', '$filter', '$scope', '$rootScope', '$state', 'projectHouseListService', 'toastr', function ($location, $timeout, $modal, $filter, $scope, $rootScope, $state, projectHouseListService, toastr) {

//console.dir(toastr);
//console.log(projectHouseListService.getProjectHouseList);
      $scope.initializeController = function () {

        //alert(3333);
          $scope.tabSelected.tab = "tab1";//选中住宅项目

          $scope.houseType = "all";//设置默认类型


          $scope.PageSize = 16;//默认显示一页页码数
          $scope.currentPage = 1;
          $scope.TotalRows = 0;
          $scope.houseList = [];
          $scope.getProjectHouseList(null);

      }

      //alert($scope.initializeController);
      


      $scope.getProjectHouseList = function (search) {
          var projectInfo = $scope.createProjectObject(search);
          projectHouseListService.getProjectHouseList(projectInfo, $scope.projectHouseListCompleted, $scope.projectHouseListError);
      }


      $scope.getFilterList = function(event){
        //console.dir(this);
        //console.dir(event);
        if($(event.target).hasClass("active")){
          return;
        }
        $timeout(function(){
          $scope.getProjectHouseList('');
        },10);        
      }




      $scope.createProjectObject = function (search) {

          var projectHouse = {};
          
          if (search != null){
              projectHouse.currentPage = 1;
              $scope.currentPage = 1;
          }
          else{
              projectHouse.currentPage = $scope.currentPage;
          }
          projectHouse.houseType = $scope.houseType;
          projectHouse.area = $scope.area;
          projectHouse.city = $scope.city;

          return projectHouse;
      }


      $scope.pageChanged = function () {
          $scope.getProjectHouseList(null);
      }



      $scope.projectHouseListCompleted = function (response, status) {
          $scope.houseList = response.houseList;
          $scope.TotalRows = response.TotalRows;
      }

      $scope.projectHouseListError = function (response, status) {
        toastr.warning('获取数据失败', '提示', {
          closeButton: true,
          timeOut: 5000
        });
      }


      

      
      
      
      



      

  }]);
});

