"use strict";

define(['angularAMD', 'config', 'util', 'window', 'directives', 'jquery', 'ui-bootstrap', 'angular-sanitize', 'blockUI', 'angular-ui-router', 'highcharts-ng', 'slider'], function (angularAMD, config, util, w) {

    
    //console.log(util)
    var app = angular.module("app", ['blockUI', 'ngSanitize', 'ui.bootstrap', 'ui.router', 'utilModule', 'highcharts-ng', 'commonDirectives', 'ui.slider']);
    
    app.config(function ($httpProvider) {
        $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
        $httpProvider.defaults.withCredentials = true;
    });

    app.filter("deletePoint", function(){
        return function(str){
            var str = str.slice(0,str.length-1);
            var num = parseInt(+str);
            return num + "%";
        }
    })

    //设置block ui
    app.config(function (blockUIConfigProvider) {
        blockUIConfigProvider.message("数据正在加载中");
        blockUIConfigProvider.delay(1);
        blockUIConfigProvider.autoBlock(false);
    });

    

    app.run(["$rootScope", "$state", "$stateParams", function($rootScope, $state, $stateParams){
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;
    }]);

    app.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {

        
            $stateProvider
            .state("app", angularAMD.route({
                "abstract": !0,
                url: "/app",
                views: {
                    "": {
                        templateUrl: "views/layout.html?" + config.templateVersion
                    }
                }
            }))
            .state("app.client", angularAMD.route({
                "abstract": !0,
                url: "/client",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            
            .state("app.client.search", angularAMD.route({
                url: "/search",
                templateUrl: "views/clientSearch/clientSearch.html?" + config.templateVersion,
                controllerUrl: 'views/clientSearch/clientSearchCtrl'
            }))
            //进入客户画像详情页
            .state("app.client.details", angularAMD.route({
                url: "/details/:cstGUID",
                templateUrl: "views/clientDetails/clientDetails.html?" + config.templateVersion,
                controllerUrl: 'views/clientDetails/clientDetailsCtrl'
            }))
            .state("app.project", angularAMD.route({
                "abstract": !0,
                url: "/project",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            .state("app.project.list", angularAMD.route({
                "abstract": !0,
                url: "/list",
                templateUrl: "views/projectList/projectList.html?" + config.templateVersion,
                controllerUrl: 'views/projectList/projectListCtrl'
            }))
            
            .state("app.project.list.houseList", angularAMD.route({
                url: "/houseList",
                templateUrl: "views/projectHouseList/projectHouseList.html?" + config.templateVersion,
                controllerUrl: 'views/projectHouseList/projectHouseListCtrl'
            }))
            .state("app.project.list.homeList", angularAMD.route({
                url: "/homeList",
                templateUrl: "views/projectHomeList/projectHomeList.html?" + config.templateVersion,
                controllerUrl: 'views/projectHomeList/projectHomeListCtrl'
            }))
            .state("app.project.details", angularAMD.route({
                url: "/details/:projectId",
                templateUrl: "views/projectDetails/projectDetails.html?" + config.templateVersion,
                controllerUrl: 'views/projectDetails/projectDetailsCtrl'
            }))
            .state("app.project.salesQuery", angularAMD.route({
                url: "/salesQuery/:projectId",
                templateUrl: "views/salesQuery/salesQuery.html?" + config.templateVersion,
                controllerUrl: 'views/salesQuery/salesQueryCtrl'
            }))
            .state("app.project.customerQuery", angularAMD.route({
                url: "/customerQuery/:projectId",
                templateUrl: "views/customerQuery/customerQuery.html?" + config.templateVersion,
                controllerUrl: 'views/customerQuery/customerQueryCtrl'
            }))
            .state("app.project.propertyQuery", angularAMD.route({
                url: "/propertyQuery/:projectId",
                templateUrl: "views/propertyQuery/propertyQuery.html?" + config.templateVersion,
                controllerUrl: 'views/propertyQuery/propertyQueryCtrl'
            }))
            .state("app.project.diskQuery", angularAMD.route({
                url: "/diskQuery/:projectId",
                templateUrl: "views/diskQuery/diskQuery.html?" + config.templateVersion,
                controllerUrl: 'views/diskQuery/diskQueryCtrl'
            }))
            .state("app.project.houseDetails", angularAMD.route({
                url: "/houseDetails/:houseId",
                templateUrl: "views/houseDetails/houseDetails.html?" + config.templateVersion,
                controllerUrl: 'views/houseDetails/houseDetailsCtrl'
            }))
            .state("app.label", angularAMD.route({
                "abstract": !0,
                url: "/label",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            .state("app.label.network", angularAMD.route({
                url: "/network",
                templateUrl: "views/labelNetwork/labelNetwork.html?" + config.templateVersion,
                controllerUrl: 'views/labelNetwork/labelNetworkCtrl'
            }))
            .state("app.label.local", angularAMD.route({
                url: "/local",
                templateUrl: "views/labelLocal/labelLocal.html?" + config.templateVersion,
                controllerUrl: 'views/labelLocal/labelLocalCtrl'
            }))
            .state("app.set", angularAMD.route({
                url: "/set",
                templateUrl: "views/set/set.html?" + config.templateVersion,
                controllerUrl: 'views/set/setCtrl'
            }))
            .state("access", angularAMD.route({
                url: "/access",
                template: '<div ui-view class="fade-in-right-big smooth"></div>'
            }))
            .state("access.signin", angularAMD.route({
                url: "/signin",
                templateUrl: "views/signin/signin.html?" + config.templateVersion,
                controllerUrl: 'views/signin/signinCtrl'
            }))
            .state("app.marketing", angularAMD.route({
                "abstract": !0,
                url: "/marketing",
                templateUrl: "views/marketing/marketing.html?" + config.templateVersion,
                controllerUrl: 'views/marketing/marketingCtrl'
            }))
            
            .state("app.marketing.customerClassify", angularAMD.route({
                url: "/customerClassify",
                templateUrl: "views/marketing/customerClassify/customerClassify.html?" + config.templateVersion,
                controllerUrl: 'views/marketing/customerClassify/customerClassifyCtrl'
            }))
            .state("app.marketing.investmentCustomer", angularAMD.route({
                url: "/investmentCustomer",
                templateUrl: "views/marketing/investmentCustomer/investmentCustomer.html?" + config.templateVersion,
                controllerUrl: 'views/marketing/investmentCustomer/investmentCustomerCtrl'
            }))
            .state("app.marketing.directed", angularAMD.route({
                url: "/directed",
                templateUrl: "views/marketing/directed/directed.html?" + config.templateVersion,
                controllerUrl: 'views/marketing/directed/directedCtrl'
            }))
            
            
            
            .state("app.report", angularAMD.route({
                "abstract": !0,
                url: "/report",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            .state("app.report.customer", angularAMD.route({
                url: "/customer",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            .state("app.report.customer.ownerType", angularAMD.route({ //业主类型统计
                url: "/ownerType",
                templateUrl: "views/report/customer/ownerType/ownerType.html?" + config.templateVersion,
                controllerUrl: 'views/report/customer/ownerType/ownerTypeCtrl'
            }))
            .state("app.report.customer.turnoverCustomer", angularAMD.route({//成交客户数量分析
                url: "/turnoverCustomer",
                templateUrl: "views/report/customer/turnoverCustomer/turnoverCustomer.html?" + config.templateVersion,
                controllerUrl: 'views/report/customer/turnoverCustomer/turnoverCustomerCtrl'
            }))
            .state("app.report.customer.repeatBuy", angularAMD.route({ //重复购买分析
                url: "/repeatBuy",
                templateUrl: "views/report/customer/repeatBuy/repeatBuy.html?" + config.templateVersion,
                controllerUrl: 'views/report/customer/repeatBuy/repeatBuyCtrl'
            }))

            .state("app.report.product", angularAMD.route({
                url: "/product",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            .state("app.report.product.turnoverProduct", angularAMD.route({ //产品成交类型分析
                url: "/turnoverProduct",
                templateUrl: "views/report/product/turnoverProduct/turnoverProduct.html?" + config.templateVersion,
                controllerUrl: 'views/report/product/turnoverProduct/turnoverProductCtrl'
            }))

            .state("app.report.format", angularAMD.route({
                url: "/format",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            .state("app.report.format.salesAnalysis", angularAMD.route({ //售后分析
                url: "/salesAnalysis",
                templateUrl: "views/report/format/salesAnalysis/salesAnalysis.html?" + config.templateVersion,
                controllerUrl: 'views/report/format/salesAnalysis/salesAnalysisCtrl'
            }))
            //.when('/app/user/project', '/app/user/projectlist/houseList')
            //.when('/app/user/project/list', '/app/user/projectlist/houseList')
            /*.state("app.dashboard", angularAMD.route({
                url: "/dashboard",
                templateUrl: "views/Main/Welcome.html",
                controllerUrl: 'views/Main/WelcomeController'
            }));*/

            $urlRouterProvider.otherwise('/app/client/search');

      }]);

    
    

    var time = 0;
    var indexController = function ($scope, $rootScope, $http, $location,  $window, blockUI) {

        $scope.initializeController = function () {
            //console.log(222222222222222);
            $scope.Title = "深讯后台管理";

            //获取导航以及
            $scope.initializeApplication($scope.initializeApplicationComplete, $scope.initializeApplicationError);
            
        }

        $rootScope.layout = {};
        
        //弹出导航颜色样式数组
        $scope.popMenuBg = ['bg-info', 'bg-primary', 'bg-success', 'bg-warning', 'bg-danger', 'bg-inverse', 'bg-primary', 'bg-success'];

        $scope.initializeApplicationComplete = function (response, status) {
            $rootScope.MenuItems = response.MenuItems;
            $rootScope.userName = response.userName;
            
          //设置二级导航
            //console.log($location);
            //console.log($location.$$path);
            var path = $location.$$path.split("/").join(".").slice(1);
            //console.log(path);
            $scope.menuCurrent = null;
            checkMenu($rootScope.MenuItems, path);

            //console.log($scope.menuCurrent);
            
            //console.log($scope.menuCurrent);
            $scope.setMenu($scope.menuCurrent);
        }
        
        function checkMenu(menu, path){
            angular.forEach(menu, function(menu, index){
                //console.log(menu.Href);
                //console.log(path);
                if(menu.Href == path){
                    //alert(2111);
                    $scope.menuCurrent = menu;
                }
                if(menu.subs && menu.subs.length>0){
                    checkMenu(menu.subs, path)
                }
            });
        }

        //设置二级导航
        function getRootMenu(menu){
            if(menu == null){
                return {}
            }
            //console.log(menu)
            if(menu.ParentID == 0){
                $scope.rootMenu = menu;
            }else{
                //console.log("no");
                //console.log(111);
                getParentMenu(menu, $rootScope.MenuItems);
                getRootMenu(parentMenu)
            }
            //angular.forEach()
        }
        var parentMenu = null;
        function getParentMenu(menu, items){
            //console.log("start");
            //console.log(menu);
            angular.forEach(items, function(item, index){
                //console.log("menu");
                //console.log(menu);
                if(item.ID == menu.ParentID){
                    //alert(3333);
                    //console.log("same");
                    parentMenu = item;
                }
                if(item.subs && item.subs.length>0){
                    getParentMenu(menu, item.subs);
                }
            });
            //return parentMenu;
        }
        $scope.setMenu = function(menu){
            getRootMenu(menu);
            //console.log(menu);
            //console.log($scope.rootMenu);
            $rootScope.SubMenuItems = $scope.rootMenu && $scope.rootMenu['subs'];
            //console.log($scope.rootMenu);
            //console.log($rootScope.SubMenuItems);
            //console.log($rootScope.SubMenuItems);
        }

        $scope.initializeApplicationError = function (response, status) {
            //提示请求失败
            new w.Window().alert({
                width: 300,
                height: 200,
                content: "请求失败"
            })
        }

        $scope.initializeApplication = function (successFunction, errorFunction) {
            blockUI.start();
            $scope.AjaxGet("api/main/initializeApplication.json", successFunction, errorFunction);
            blockUI.stop();
        };

        $scope.AjaxGet = function (route, successFunction, errorFunction) {
            setTimeout(function () {
                $http({ method: 'GET', url: route }).success(function (response, status, headers, config) {
                    successFunction(response, status);
                }).error(function (response) {
                    errorFunction(response);
                });
            }, 1);
        };


    };
    
    app.filter('strToDate', [function () {
        return function (text) {
			if(text==null || text=='')
			{
			  return '未知';
			}else{
				var date = text.replace(/-/ig, "/");
				var date_time = Date.parse(date);
				var str = date.substring(0, 4);
				if(str == '1970'){
					return '未知';
				}
				return new Date(date_time);
			}
        }
    }]);

    indexController.$inject = ['$scope', '$rootScope', '$http', '$location', '$window', 'blockUI'];
    app.controller("indexController", indexController);    
    angularAMD.bootstrap(app);
    return app;
});