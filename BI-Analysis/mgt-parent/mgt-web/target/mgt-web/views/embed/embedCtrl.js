define(['app', 'jquery'], function (app, $) {
	//console.dir(app);
	app.register.controller('EmbedController', ['$scope', '$rootScope', '$state', '$stateParams', '$timeout', function ($scope, $rootScope, $state, $stateParams, $timeout) {

		$scope.initializeController = function () {
			//$rootScope.layout.hasSubs = true;
			$scope.set();

			$scope.menuId=$stateParams.menuId;
			//遍历导航中对应的导航添加active
			//
			//console.log($(".navbar-nav li").length)
			$scope.$watch("menuItems", function(){
				
				$scope.set();
			})
		};



		var menuArr = [];


		$scope.set = function(){
			//alert(2222);
			var menuId = $stateParams.menuId;
			if($scope.menuItems == undefined){
				return;
			}
			//console.log(1111111);
			//console.log($scope.menuItems);
			if($scope.menuItems.length>0){
				$timeout(function(){
					/*console.log("hoho")
					console.log($(".navbar-nav li").length)
					$(".navbar-nav li").each(function(index, menu){
						var $menu = $(menu);
						//console.log("index: " + index);
						if($menu.find("a").attr("href").split("#/app/embed/")[1] === menuId){
							$menu.addClass("active").siblings().removeClass("active");

						}
						//if(menu.find("a").attr("href").split("#/app/embed/"))
					})*/
				},50);

				//设置//$scope.iframeHref = "http://www.baidu.com";
				//var menuArr = [];//设置一个数组用来存储所有的菜单项

				function getAllMenu(menus){
					for(var i=0, len=menus.length; i<len; i++){
						menuArr.push(menus[i]);
						if(menus[i].subs && menus[i].subs.length>0){
							getAllMenu(menus[i].subs);
						}
					}
				}

				getAllMenu($scope.menuItems);


				var path = "";
				$scope.iframeHref = "";
				angular.forEach(menuArr, function(menu, index){
					//console.log("index2: " + index + " menuId: " + menu.ID);
					if(menu.menuId == menuId){
						$scope.iframeHref = menu.href;
						//alert($scope.iframeHref);
						path = menu.path;
						//alert(1111);
					}
					//if(menu.path.indexOf(menuId))
				})

				//console.log("is menu arr");
				//console.log(menuArr);

				//设置选中状态
				angular.forEach($scope.menuItems, function(menu, index){
					//console.log("index2: " + index + " menuId: " + menu.ID);
					//console.log("path: " + path + " menu.path " + menu.path);
					if(path.indexOf(menu.path) == 0){
						//alert("is active")
						//menu.isActive = true;
						//alert(1111);
						$rootScope.subMenus = menu.subs;

						

						$timeout(function(){
							$(window).trigger("resize");
						},50)
					}
					//if(menu.path.indexOf(menuId))
				});

				angular.forEach(menuArr, function(menu, index){
					//console.log("index2: " + index + " menuId: " + menu.ID);
					//console.log("path: " + path + " menu.path " + menu.path);
					if(path.indexOf(menu.path) == 0){
						//alert("path:" + path + " menu.path: " + menu.path)
						//alert("is active")
						menu.isActive = true;
						//alert(1111);
					}else{
						menu.isActive = false;
					}
					//if(menu.path.indexOf(menuId))
				});

				
				/*
				//如果是点一级菜单，如果有子集，则跳转到第一个子集
				angular.forEach($scope.menuItems, function(menu, index){
					//alert("menu.id: " + menu.ID + " menuId: " + menuId);
					if(menu.menuId == menuId){
						//alert(222222222);
						if(menu.subs && menu.subs.length>0){
							//alert(11111111);
							$state.go("app.embed", {"menuId": menu.subs[0].menuId});
						}
					}
				});

				//如果选中二级里面还有子菜单就继续跳里面去
				//如果是点一级菜单，如果有子集，则跳转到第一个子集
				angular.forEach($scope.subMenus, function(menu, index){
					//alert("menu.id: " + menu.ID + " menuId: " + menuId);
					if(menu.menuId == menuId){
						//alert(222222222);
						if(menu.subs && menu.subs.length>0){
							//alert(11111111);
							$state.go("app.embed", {"menuId": menu.subs[0].menuId});
						}
					}
				});
				*/

			}
		}


		$scope.$on("$destroy", function(){
			//$(".navbar-nav li").removeClass("active");
			angular.forEach(menuArr, function(menu, index){
				menu.isActive = false;
			})
		})


	}]);
});

