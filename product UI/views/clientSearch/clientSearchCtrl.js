define(['app', 'window', 'jquery', 'WdatePicker', 'clientSearchServices', 'toastr'], function (app, w, $) {
	//console.dir(app);
	app.register.controller('ClientSearchController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'clientSearchServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, clientSearchServices, toastr) {

		$scope.initializeController = function () {

			$scope.keyword = "";

		};



		$scope.search = function(){
			
			//如果有输入关键词，则进入查询画像
			var keyword = $.trim($scope.keyword);
			//console.log(/^(\d{18,18}|\d{15,15}|\d{17,17}x)$/.test(keyword));
			if(!(/^(\d{18,18}|\d{15,15}|\d{17,17}x)$/.test(keyword)) && !(/^\d{11}$/.test(keyword))){
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
		};

		$scope.getClient = function(){
			
			clientSearchServices.getClient({
				keyword: $scope.keyword
			}, function(response, status){
				//这里只模拟查找到了有这个客户，如果查找到没有这个客户，则弹出提示没有找到对应的客户，请重新输入关键词
				/*
				new w.Window().alert({
	    			title: "错误提示",
	    			width: 300,
	    			height: 160,
	    			content: '你好，没有找到符合你输入关键词的客户',
	    			hasCloseBtn: true
	    		});
				*/
				//获取的客户，根据id，去存储到clientSearchServices这个服务的clientFromId对象里，然后进行调整
				clientSearchServices.setClientFromId(response.clientId, response);
				$state.go("app.client.details", {"clientId": response.clientId});

			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			});
		};

		

		
	}]);
});

