define(['app', 'window', 'jquery', 'WdatePicker', 'clientSearchServices', 'toastr'], function (app, w, $) {
	app.register.controller('ClientSearchController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'clientSearchServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, clientSearchServices, toastr) {

      $scope.initializeController = function () {
    	  
    	$scope.keyword = "";
    	$scope.PageSize = 10;//默认显示一页页码数
		$scope.currentPage = 1;
		$scope.TotalRows = 0;
    	
		$scope.detailsLoaded = false;//初始时候不显示搜索明细列表
		
		//所属业态
		$scope.belongsFormat = [
			{
				"title": "住宅客户",
				"value": 2
			},
			{
				"title": "商业客户",
				"value": 8
			},
			{
				"title": "置业客户",
				"value": 4
			},
			{
				"title": "住宅&置业",
				"value": 6
			},
			{
				"title": "住宅&商业",
				"value": 10
			},
			{
				"title": "置业&商业",
				"value": 12
			},
			{
				"title": "住宅&置业&商业",
				"value": 14
			}
		]
		$scope.formatChecked = "";
		

		//默认初始区域
		$scope.area = "";
		$scope.city = "";
		$scope.project = "";
		
		//获取界面数据
		$scope.getGroup();
		
        //$rootScope.layout.hasSubs = false;
        
        //$scope.btnTitle = "查看画像";
        //$scope.btnDisabled = false;
      }
      
      //获取组织架构
      $scope.getGroup = function(){
    	  clientSearchServices.getGroup({}, function(response, status){
    		  
    		  $scope.areas = response.data;
    		  //$scope.areas = response;
    		  $scope.city = "";
    		  $scope.project = "";
    	  }, function(response, status){
    		  toastr.warning('获取数据失败', '提示', {
    			  closeButton: true,
    			  timeOut: 5000
    		  });
    	  })
      }
      
      //区域改变
      $scope.changeArea = function(){
    	  $scope.city = "";
    	  $scope.project = "";
      }

      //城市改变
      $scope.changeCity = function(){
    	  $scope.project = "";
      }
      
      $scope.search = function(){
			
			//如果有输入关键词，则进入查询画像，当没有输入关键词，则进入查询明细
			if($scope.keyword != ''){
				var keyword = $.trim($scope.keyword);
				//console.log(/^(\d{18,18}|\d{15,15}|\d{17,17}x)$/.test(keyword));
				if(!(/^(\d{18,18}|\d{15,15}|\d{17,17}(X|x))$/.test(keyword)) && !(/^\d{11}$/.test(keyword))){
					//如果不能匹配身份证号码跟手机号码，则提示输入正确的身份证号或手机号码
					new w.Window().alert({
		    			title: "错误提示",
		    			width: 300,
		    			height: 160,
		    			content: '你好，请输入正确的身份证号或手机号码',
		    			hasCloseBtn: true
		    		});
		    		return false;
				}

				//进入查询画像
				$scope.getClient();
			}else{
				new w.Window().alert({
	    			title: "错误提示",
	    			width: 300,
	    			height: 160,
	    			content: '你好，请输入身份证号、手机号码',
	    			hasCloseBtn: true
	    		});
	    		return false;
				/**
				//赋值查询的数据对象
				if($scope.area != null && $scope.area != ''){
					$scope.areaSearch = $scope.area.id;//城市
				}else{
					$scope.areaSearch = null;
				}
				if($scope.city != null && $scope.city != ''){
					$scope.citySearch = $scope.city.id;//城市
				}else{
					$scope.citySearch = null;
				}
				
				if($scope.project != null && $scope.project != ''){
					$scope.projectSearch = $scope.project.id;//城市
				}else{
					$scope.projectSearch = null;
				}
				if($scope.formatChecked != null && $scope.formatChecked != ''){
					$scope.formatCheckedSearch = $scope.formatChecked.value;//所属业态
				}else{
					$scope.formatCheckedSearch = null;
				}
				$scope.startDateSearch = $scope.startDate;//创建时间起始
				$scope.endDateSearch = $scope.endDate;//创建时间结束
				*/
				/*
				if(($scope.area == null || $scope.area == '') 
						&& ($scope.formatChecked == null ||$scope.formatChecked == '')
						&& typeof($scope.startDate) == "undefined"
						&& typeof($scope.endDate) == "undefined"){
					new w.Window().alert({
		    			title: "错误提示",
		    			width: 300,
		    			height: 160,
		    			content: '你好，请输入身份证号、手机号码或者选择条件进行查询',
		    			hasCloseBtn: true
		    		});
		    		return false;
				}
				//进入查询明细
				$scope.getList();
				 */
			}
		};

		$scope.getClient = function(){
			
			clientSearchServices.getClient({
				number: $scope.keyword
			}, function(response){
				if(response.header.code == -1){
					//这里只模拟查找到了有这个客户，如果查找到没有这个客户，则弹出提示没有找到对应的客户，请重新输入关键词
					new w.Window().alert({
						title: "错误提示",
						width: 300,
						height: 160,
						content: response.header.message,
						hasCloseBtn: true
					});
				}else{
					//获取的客户，根据id，去存储到clientSearchServices这个服务的clientFromId对象里，然后进行调整
					clientSearchServices.setClientFromId(response.data, response);
					$state.go("app.client.details", {"cstGUID": response.data});
				}

			}, function(response){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			});
		};

		//查询明细页码切换
		$scope.pageChanged = function () {
			$scope.getList(null);
		}


		//获取查询明细
		$scope.getList = function (search) {
			var searchInfo = $scope.createSearchInfo(search);
			clientSearchServices.getList(searchInfo, function(response){
				//填充内容
				$scope.customerList = response.data.clientList;
				$scope.totalRows = response.data.totalRows;
				$scope.detailsLoaded = true;

			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})
			//projectHouseListService.getProjectHouseList(searchInfo, $scope.projectHouseListCompleted, $scope.projectHouseListError);
		}
		
		//导出execl
		$scope.exportExcel = function() {
			var searchvo = $scope.createSearchInfo(null);
			clientSearchServices.customerExport(searchvo);
		}


		//生成传给后台的查询对象
		$scope.createSearchInfo = function (search) {

			var searchInfo = {};

			if (search != null){
				searchInfo.currentPage = 1;
				$scope.currentPage = 1;
			}
			else{
				searchInfo.currentPage = $scope.currentPage;
			}
			
			searchInfo.areaSearch = $scope.areaSearch;//区域
			searchInfo.citySearch = $scope.citySearch;//城市
			searchInfo.projectSearch = $scope.projectSearch;//项目
			searchInfo.formatCheckedSearch = $scope.formatCheckedSearch;//所属业态
			searchInfo.startDate = $scope.startDateSearch;//创建时间起始
			searchInfo.endDate = $scope.endDateSearch;//创建时间结束
			searchInfo.PageSize = $scope.PageSize;
			
			return searchInfo;
		}
      
  }]);
});

