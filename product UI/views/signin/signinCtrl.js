define(['app', 'window', 'jquery', 'signinServices', 'toastr'], function (app, w, $) {
    //console.dir(app);
	app.register.controller('SigninController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', 'signinServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, signinServices, toastr) {


		$scope.initializeController = function () {
			//$rootScope.layout.hasSubs = false;
			$scope.loginBtnText = "登录";
			$scope.username = "";
			$scope.password = "";
			$scope.code = "";
		}

		$scope.login = function() {
			//跳转之前验证是否正确
			$state.go('app.client.search');
		}

		$scope.forgetPassword = function(){
			new w.Window().alert({
    			title: "忘记密码",
    			width: 480,
    			height: 160,
    			content: '您好，请联系管理员重置密码',
    			hasCloseBtn: true
    		});
		}

		$scope.signin = function(){
			//console.log("signin");
			if($scope.logining){
				return ;
			}
			$scope.logining = true;//避免重复提交
			$scope.loginBtnText = "登录中";
			signinServices.login({
				username: $scope.username,
				password: $scope.password
			}, function(response, status){

				$scope.logining = false;
				$scope.loginBtnText = "登录";

				//设置导航同用户名后跳转
				$rootScope.menuItems = response.data.menu;
				$rootScope.userName = response.data.user.userName +"["+ response.data.user.name +"]";
				$rootScope.orgId =  response.data.user.orgId;
				$rootScope.userType =  response.data.user.userType;

                
                //登录成功就跳转到客户概览
               /* var dashboardRoute = "";
                angular.forEach($rootScope.MenuItems, function(menu, index){
                	//console.log(index);
                	if(menu.stateInclude === "app.dashboard"){
                		dashboardRoute = menu["subs"][0].Href
                	}
                })*/
				$state.go("app.client.show");

			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
				$scope.logining = false;
				$scope.loginBtnText = "登录";
			})
		}


	}]);
});
