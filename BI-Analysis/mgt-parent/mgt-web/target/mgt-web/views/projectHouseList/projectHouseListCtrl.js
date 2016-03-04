define([ 'app', 'jquery', 'projectHouseListService', 'toastr' ], function(app) {
	// console.dir(app);
	app.register.controller('ProjectHouseListCtrl', [
			'$location',
			'$modal',
			'$filter',
			'$scope',
			'$rootScope',
			'$state',
			'projectHouseListService',
			'toastr',
			function($location, $modal, $filter, $scope, $rootScope, $state,
					projectHouseListService, toastr) {

				
				$scope.initializeController = function() {
					$scope.tabSelected.tab = "tab1";// 选中住宅项目

					$scope.houseType = "all";// 设置默认类型

					$scope.PageSize = 16;// 默认显示一页页码数
					$scope.currentPage = 1;
					$scope.TotalRows = 0;
					$scope.houseList = [];
					$scope.getProjectHouseList(null);
					$scope.getProjectHouseArea();
				}
                //返回分页列表
				$scope.getProjectHouseList = function(search) {
					var projectInfo = $scope.createProjectObject(search);
					projectHouseListService.getProjectHouseList(projectInfo,
							$scope.projectHouseListCompleted,
							$scope.projectHouseListError);
				}

				$scope.getProjectHouseArea = function() {
					projectHouseListService.getProjectHouseArea(null,
							$scope.projectHouseAreaCompleted, function() {
							});
				}

				$scope.projectHouseAreaCompleted = function(response, status) {
					// 设置区域
					$scope.areas = response.data;
					$scope.areaSelected = $scope.areas[0];
				}
				
				$scope.error = {};
		    	$scope.areas = [];

				$scope.changeArea = function(){
					$scope.error.area = false;
			        $scope.error.city = false;
			        var big_code = $scope.areaSelected.big_code;
			        projectHouseListService.getCompany({"big_code" : big_code}, function(response, status){
			        	$scope.citys = response.data;
			        	$scope.citySelected = $scope.citys[0];
			        }, function(response, status){
			        	toastr.warning('获取数据失败', '提示', {
							closeButton: true,
							timeOut: 5000
						});
			        });
				}


				$scope.changeCity = function(){
					$scope.error.area = false;
			        $scope.error.city = false;
				}
				
				$scope.getFilterList = function(event) {
					if ($(event.target).hasClass("active")) {
						return;
					}
					setTimeout(function() {
						$scope.getProjectHouseList('');
					}, 10)
				}

				$scope.createProjectObject = function(search) {
					
					//首先赋值要查询的对象
					$scope.areaSelectedSearch = $scope.areaSelected;
					$scope.citySelectedSearch = $scope.citySelected;

					var projectHouse = {};

					if (search != null) {
						projectHouse.currentPage = 1;
						$scope.currentPage = 1;
					} else {
						projectHouse.currentPage = $scope.currentPage;
					}

					projectHouse.houseType = $scope.houseType;
					projectHouse.area = $scope.area;
					projectHouse.city = $scope.city;
					
					
					$scope.error.area = $scope.areaSelected ? false : true;
					$scope.error.city = $scope.citySelectedSearch ? false : true;
					
					if(!$scope.error.area && $scope.areaSelected.big_name == "全公司"){
						$scope.error.city = false;
					}
					
					return projectHouse;
				}

				$scope.projectHouseListCompleted = function(response, status) {
					$scope.houseList = response.data.list;
					$scope.pageSize = response.data.page.pageSize;
					$scope.currentPage = response.data.page.currentPage;
					$scope.TotalPages = response.data.page.pageCount;
					$scope.TotalRows = response.data.page.recordCount;

					/*
					 * var areas = []; var copyareas = [];
					 * $.each(response.data.list,function(n,value){
					 * if(value.area_id != '商置公司'){ areas[n]=value.area_id; }
					 * }); areas.sort(); $scope.areaList =
					 * areas.reverse().join(",").match(/([^,]+)(?!.*\1)/ig).reverse();
					 */

				}
				
				//查询按钮事件
			    $scope.search = function(){
			    	//alert($scope.areaSelected.areaName+","+$scope.citySelected.companyName);
			    	
			    	var info = {
							"big_name": $scope.areaSelected.big_name,
							"city_name": $scope.citySelected.city_name
					}
			    	//alert(info.big_name+","+info.city_name);
			    	$scope.getProjectHouseData(info);
			    }
			    
			    $scope.getProjectHouseData = function(info) {
					projectHouseListService.getProjectHouseData(info,
							$scope.projectHouseDataCompleted,function(){
					});
				}
			    
			    $scope.projectHouseDataCompleted = function(response, status) {
					//返回列表
			    	$scope.houseList = " ";
			    	$scope.houseList = response.data.list;
			    	$scope.pageSize = "";
					$scope.currentPage = "";
					$scope.TotalPages = "";
					$scope.TotalRows = "";
				}
				
				

				// 数据去除重复元素
				/*
				 * $scope.unique = function(array) { var ret = [], record =
				 * {},it,tmp,obj = "__object__", bak = [],i,len; var type ={
				 * "number": function(n) { return "__number__" + n; }, "string":
				 * function(n) { return "__string__" + n; }, "boolean":
				 * function(n) { return "__boolean__" + n; }, "undefined":
				 * function(n) { return "__undefined__"; }, "object":
				 * function(n) { return n === null ? "__null__" : obj in n ?
				 * n[obj] : ( n[obj] = obj + bak.push(n) ); } }; for (i = 0, len =
				 * array.length; i < len; i++) { it = array[i]; tmp =
				 * type[typeof it](it); if (!(tmp in record)) { ret.push(it);
				 * record[tmp] = true; } } for (i = 0, len = bak.length; i <
				 * len; delete bak[i++][obj]) { } return ret; };
				 */

				$scope.projectHouseListError = function(response, status) {
					toastr.warning('获取数据失败', '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}

				$scope.pageChanged = function() {
					$scope.getProjectHouseList(null);
				}
			} ]);
});
