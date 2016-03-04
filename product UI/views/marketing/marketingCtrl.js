define(['app', 'jquery'], function (app) {
//console.dir(app);
	app.register.controller('MarketingController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', function ($location, $modal, $filter, $scope, $rootScope, $state) {

		$scope.initializeController = function () {
			//$rootScope.layout.hasSubs = true;

			$rootScope.noShowSubMenu = true;
			
			//给一级导航“营销”设置选中状态
			$scope.setActive();
			
		}
		$scope.banner = {};

		$scope.changeBanner = function(index){
			if($scope.banner.active == index){
				return;
			}
			$scope.banner.active = index;
		}


		$scope.$watch('menuItems', function(menuItems){
			if(menuItems != undefined){
				$scope.setActive();
			}
		})


		$scope.setActive = function(){
			//console.log($rootScope.menuItems)
			if($rootScope.menuItems != null){
				//遍历导航一遍跳转到一级菜单的子目录
				var menus = [];//用来存储所有导航

				function pushMenu(menu){
					menus.push(menu);
					if(menu.subMenus && menu.subMenus.length>0){
						for(var i=0, len=menu.subMenus.length; i<len; i++){
							pushMenu(menu.subMenus[i]);
						}
					}
				}

				//先把所有的菜单push到数组menus里
				for(var i=0, len=$rootScope.menuItems.length; i<len; i++){
					pushMenu($rootScope.menuItems[i]);
				}

				//console.log(menus);
				//给二级菜单ETL管理添加选中状态
				for(var j=0, menusLen= menus.length; j<menusLen; j++){
					if(menus[j].href.indexOf('app.marketing') == 0){
						$scope.menu = menus[j];
						menus[j].isActive = true;
					}
					//console.dir(menus[j]);
				}

			}
		}

		$scope.$on("$destroy", function(){
			$scope.menu.isActive = false;
			$rootScope.noShowSubMenu = false;
		})


	}]);
});

