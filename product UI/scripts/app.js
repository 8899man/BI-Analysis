"use strict";

define(['angularAMD', 'config', 'util', 'window', 'directives', 'jquery', 'ui-bootstrap', 'angular-sanitize', 'blockUI', 'angular-ui-router', 'highcharts-ng', 'slider', 'toastr', 'upload'], function (angularAMD, config, util, w) {

    
    //console.log(util)
    var app = angular.module("app", ['blockUI', 'ngSanitize', 'ui.bootstrap', 'ui.router', 'utilModule', 'highcharts-ng', 'commonDirectives', 'ui.slider', 'toastr', 'ngFileUpload']);
    
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


    // 设置拦截器
    app.config(['$httpProvider', function($httpProvider) {

        var interceptor = function($q, $rootScope) {
            return {
                "response": function(response) {

                    if (response && response.data && response.data.header && response.data.header.code) {
                        switch (response.data.header.code) {
                            // 对应401未授权的请求
                            case 3:
                                $rootScope
                                    .$broadcast("auth:loginRequired")
                                break;
                        }
                    }

                    return response;
                },
                "responseError": function(rejection) {
                    console.log("no");
                    console.dir(rejection)
                    switch (rejection.status) {
                        // 对应401未授权的请求
                        case 401:
                            $rootScope
                                .$broadcast("auth:loginRequired")
                            break;
                            // 对应403禁止的请求
                        case 403:
                            $rootScope
                                .$broadcast("auth:forbidden")
                            break;
                            // 对应404页面找不到
                        case 404:
                            $rootScope
                                .$broadcast("page:notFound")
                            break;
                            // 对应500服务器错误
                        case 500:
                            $rootScope
                                .$broadcast("server:error")
                            break;
                    }
                    return $q.reject(rejection);
                }
            }
        }

        // 注入拦截器
        $httpProvider.interceptors.push(interceptor);

    }]);


    

    app.run(["$rootScope", "$state", "$stateParams", "$location", function($rootScope, $state, $stateParams, $location){
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;

        //身份验证事件绑定
        // 对应401未授权的请求
        $rootScope.$on("auth:loginRequired", function() {
            // console.log("auth:loginRequired");
            // 跳转到登录界面
            if ($location.$$path.split("/").join(".")
                    .slice(1) == "access.signin") {
                // 如果当前已经是登录界面则不用继续调整到登录界面
                return false;
            }
            $state.go("access.signin");
        });

        // 对应403禁止的请求
        $rootScope.$on("auth:forbidden", function() {
            // console.log("auth:forbidden");
        });

        // 对应404页面找不到
        $rootScope.$on("page:notFound", function() {
            // console.log("page:notFound");
        });

        // 对应500服务器错误
        $rootScope.$on("server:error", function() {
            // console.log("server:error");
        });

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
                //"abstract": !0,
                url: "/client",
                templateUrl: "views/direct/direct.html?" + config.templateVersion,
                controllerUrl: 'views/direct/directCtrl'
            }))
            .state("app.client.show", angularAMD.route({
                url: "/show",
                templateUrl: "views/clientShow/clientShow.html?" + config.templateVersion,
                controllerUrl: 'views/clientShow/clientShowCtrl'
            }))
            .state("app.client.search", angularAMD.route({
                url: "/search",
                templateUrl: "views/clientSearch/clientSearch.html?" + config.templateVersion,
                controllerUrl: 'views/clientSearch/clientSearchCtrl'
            }))
            .state("app.client.batchSearch", angularAMD.route({
                url: "/batchSearch",
                templateUrl: "views/clientBatchSearch/clientBatchSearch.html?" + config.templateVersion,
                controllerUrl: 'views/clientBatchSearch/clientBatchSearchCtrl'
            }))
            .state("app.client.details", angularAMD.route({
                url: "/details/:clientId",
                templateUrl: "views/clientDetails/clientDetails.html?" + config.templateVersion,
                controllerUrl: 'views/clientDetails/clientDetailsCtrl'
            }))
            .state("app.project", angularAMD.route({
                //"abstract": !0,
                url: "/project",
                templateUrl: "views/direct/direct.html?" + config.templateVersion,
                controllerUrl: 'views/direct/directCtrl'
            }))
            .state("app.project.show", angularAMD.route({
                url: "/show",
                templateUrl: "views/projectShow/projectShow.html?" + config.templateVersion,
                controllerUrl: 'views/projectShow/projectShowCtrl'
            }))
            //项目页面调准
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
                //"abstract": !0,
                url: "/label",
                templateUrl: "views/direct/direct.html?" + config.templateVersion,
                controllerUrl: 'views/direct/directCtrl'
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
            .state("app.help", angularAMD.route({
                url: "/help",
                templateUrl: "views/help/help.html?" + config.templateVersion,
                controllerUrl: 'views/help/helpCtrl'
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
                //"abstract": !0,
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
                //"abstract": !0,
                url: "/report",
                templateUrl: "views/direct/direct.html?" + config.templateVersion,
                controllerUrl: 'views/direct/directCtrl'
            }))
            .state("app.report.customer", angularAMD.route({
                url: "/customer",
                templateUrl: "views/direct/direct.html?" + config.templateVersion,
                controllerUrl: 'views/direct/directCtrl'
            }))
            .state("app.report.customer.ownerType", angularAMD.route({
                url: "/ownerType",
                templateUrl: "views/report/customer/ownerType/ownerType.html?" + config.templateVersion,
                controllerUrl: 'views/report/customer/ownerType/ownerTypeCtrl'
            }))
            .state("app.report.customer.turnoverCustomer", angularAMD.route({
                url: "/turnoverCustomer",
                templateUrl: "views/report/customer/turnoverCustomer/turnoverCustomer.html?" + config.templateVersion,
                controllerUrl: 'views/report/customer/turnoverCustomer/turnoverCustomerCtrl'
            }))
            .state("app.report.customer.repeatBuy", angularAMD.route({
                url: "/repeatBuy",
                templateUrl: "views/report/customer/repeatBuy/repeatBuy.html?" + config.templateVersion,
                controllerUrl: 'views/report/customer/repeatBuy/repeatBuyCtrl'
            }))

            .state("app.report.product", angularAMD.route({
                url: "/product",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            .state("app.report.product.turnoverProduct", angularAMD.route({
                url: "/turnoverProduct",
                templateUrl: "views/report/product/turnoverProduct/turnoverProduct.html?" + config.templateVersion,
                controllerUrl: 'views/report/product/turnoverProduct/turnoverProductCtrl'
            }))

            .state("app.report.format", angularAMD.route({
                url: "/format",
                templateUrl: "views/blank.html?" + config.templateVersion
            }))
            .state("app.report.format.salesAnalysis", angularAMD.route({
                url: "/salesAnalysis",
                templateUrl: "views/report/format/salesAnalysis/salesAnalysis.html?" + config.templateVersion,
                controllerUrl: 'views/report/format/salesAnalysis/salesAnalysisCtrl'
            }))

            .state("app.dashboard", angularAMD.route({
                //"abstract": !0,
                url: "/dashboard",
                templateUrl: "views/direct/direct.html?" + config.templateVersion,
                controllerUrl: 'views/direct/directCtrl'
            }))

            .state("app.dashboard.sales", angularAMD.route({
                url: "/sales",
                templateUrl: "views/dashboard/sales/dashboardSales.html?" + config.templateVersion,
                controllerUrl: 'views/dashboard/sales/dashboardSalesCtrl'
            }))

            .state("app.dashboard.customer", angularAMD.route({
                url: "/customer",
                templateUrl: "views/dashboard/customer/dashboardCustomer.html?" + config.templateVersion,
                controllerUrl: 'views/dashboard/customer/dashboardCustomerCtrl'
            }))

            .state("app.dashboard.purchas", angularAMD.route({
                url: "/purchas",
                templateUrl: "views/dashboard/purchas/dashboardPurchas.html?" + config.templateVersion,
                controllerUrl: 'views/dashboard/purchas/dashboardPurchasCtrl'
            }))

            //外链嵌套路由
            .state("app.embed", angularAMD.route({
                url: "/embed/:menuId",
                templateUrl: "views/embed/embed.html?" + config.templateVersion,
                controllerUrl: 'views/embed/embedCtrl'
            }))

            //外链嵌套一级菜单路由跳转
            .state("app.nest", angularAMD.route({
                url: "/nest",
                templateUrl: "views/direct/direct.html?" + config.templateVersion,
                controllerUrl: 'views/direct/directCtrl'
            }))

            //外链嵌套二级菜单路由跳转
            .state("app.nest.menu1", angularAMD.route({
                url: "/menu1",
                templateUrl: "views/direct/direct.html?" + config.templateVersion,
                controllerUrl: 'views/direct/directCtrl'
            }))

            //.when('/app/user/project', '/app/user/projectlist/houseList')
            //.when('/app/user/project/list', '/app/user/projectlist/houseList')
            /*.state("app.dashboard", angularAMD.route({
                url: "/dashboard",
                templateUrl: "views/Main/Welcome.html",
                controllerUrl: 'views/Main/WelcomeController'
            }));*/
            
            //由于“仪表盘”会根据角色不定导致地址不定，所以把登录后的匹配路径设置到客户概览里
            $urlRouterProvider.otherwise('/app/client/show');

      }]);

    
    

    var time = 0;
    var indexController = function($scope, $rootScope, $http,
            $location, $window, $state, toastr, blockUI) {

        $scope.initializeController = function() {

            $scope.Title = "数据管理平台";

            // 获取导航以及
            $scope.initializeApplication(
                    $scope.initializeApplicationComplete,
                    $scope.initializeApplicationError);

        }

        $rootScope.layout = {};

        // 弹出导航颜色样式数组
        $scope.popMenuBg = [ 'bg-info', 'bg-primary', 'bg-success',
                'bg-warning', 'bg-danger', 'bg-inverse', 'bg-primary',
                'bg-success', 'bg-info', 'bg-primary', 'bg-success',
                'bg-warning', 'bg-danger', 'bg-inverse', 'bg-primary',
                'bg-success' ];

        $scope.initializeApplicationComplete = function(response,
                status) {

            // 初始化登录成功，如果验证失败直接跳转到登录界面
            if (response.header.code == 0) {

                // 如果是已经登录的，且又是在登录界面，则跳转到仪表盘，暂时屏蔽，否则在登录界面刷新会跳转到仪表盘
                /*
                 * if($location.$$path.split("/").join(".").slice(1) ==
                 * "access.signin"){ $state.go("app.dashboard"); }
                 */

                $rootScope.menuItems = response.data.menu;
                $rootScope.userName = response.data.user.userName + "["
                        + response.data.user.name + "]";
                $rootScope.orgId = response.data.user.orgId;
                $rootScope.userType = response.data.user.userType;
                // 设置二级导航
                var path = $location.$$path.split("/").join(".").slice(
                        1);
                $scope.menuCurrent = null;
                checkMenu($rootScope.menuItems, path);
                // console.log("now1");
                // console.log($scope.menuCurrent);
                $scope.setMenu($scope.menuCurrent);
            } else {
                // 跳转到登录界面
                if ($location.$$path.split("/").join(".").slice(1) == "access.signin") {
                    // 如果当前已经是登录界面则不用继续调整到登录界面
                    return false;
                }
                $state.go("access.signin");
            }

        };

        $scope.$on('$stateChangeSuccess',
                function(scope, next, current) {
                    // 路由切换的时候，设置正确的二级导航
                    var path = $location.$$path.split("/").join(".")
                            .slice(1);
                    // console.log(path);
                    $scope.menuCurrent = null;
                    checkMenu($rootScope.menuItems, path);

                    // console.log($scope.menuCurrent);

                    // console.log($scope.menuCurrent);
                    $scope.setMenu($scope.menuCurrent);

                    $("html, body").animate({
                        "scrollTop" : 0
                    }, "fast");
                });

        /*
         * $scope.$on('$stateChangeSuccess', function (scope, next,
         * current) { //路由切换的时候，设置正确的二级导航 var path =
         * $location.$$path.split("/").join(".").slice(1);
         * $scope.menuCurrent = null; checkMenu($rootScope.MenuItems,
         * path); $scope.setMenu($scope.menuCurrent); $("html,
         * body").animate({"scrollTop": 0}, "fast"); });
         */

        function checkMenu(menus, path) {
            // console.log("menus:" + menus);
            // console.log("path:" + path);
            var path = path.split(".")[1];
            // console.log(path);
            angular.forEach(menus, function(menu, index) {
                // console.dir(menu)
                // console.log(menu.href);
                // console.log(path);
                // console.log(menu.href.split(".")[1]);
                if (menu.href.split(".")[1] == path) {
                    // console.log(2111);
                    $scope.menuCurrent = menu;
                    // console.dir($scope.menuCurrent);
                }
                /*
                 * if(menu.subMenus && menu.subMenus.length>0){
                 * checkMenu(menu.subMenus, path) }
                 */
            });
        }

        // 设置二级导航
        function getRootMenu(menu) {
            if (menu == null) {
                return {}
            }
            // console.log(menu)
            if (menu.ParentID == null) {
                $scope.rootMenu = menu;
            } else {
                // console.log("no");
                // console.log(111);
                // console.log("now3");
                // console.dir($rootScope.menuItems);
                getParentMenu(menu, $rootScope.menuItems);
                getRootMenu(parentMenu)
            }
            // angular.forEach()
        }
        var parentMenu = null;
        function getParentMenu(menu, items) {
            // console.log("start");
            // console.log(menu);
            angular.forEach(items, function(item, index) {
                // console.log("menu");
                // console.log(menu);
                // console.log("menuId:" + item.menuId + " parentId: " +
                // menu.parentId);
                if (item.menuId == menu.parentId) {
                    // alert(3333);
                    // console.log("same");
                    parentMenu = item;
                }
                if (item.subMenus && item.subMenus.length > 0) {
                    getParentMenu(menu, item.subMenus);
                }
            });
            // return parentMenu;
        }
        $scope.setMenu = function(menu) {
            // console.log("now2");
            // console.dir(menu);
            getRootMenu(menu);
            // console.log("rootmenu");
            // console.dir($scope.rootMenu);
            $rootScope.subMenus = $scope.rootMenu
                    && $scope.rootMenu['subMenus'];

        }

        $scope.initializeApplicationError = function(response, status) {
            // 提示请求失败
            new w.Window().alert({
                width : 300,
                height : 200,
                content : "请求失败"
            })
        }

        $scope.initializeApplication = function(successFunction,
                errorFunction) {
            blockUI.start();
            $scope.AjaxGet("api/main/initializeApplication.json?123", successFunction,
                    errorFunction);
            blockUI.stop();
        };

        $scope.AjaxGet = function(route, successFunction, errorFunction) {
            setTimeout(function() {
                $http({
                    method : 'GET',
                    url : route
                }).success(function(response, status, headers, config) {
                    successFunction(response, status);
                }).error(function(response) {
                    errorFunction(response);
                });
            }, 1);
        };

        // 退出登录
        $scope.exitSign = function() {
            $http({
                method : 'GET',
                url : "api/main/exitSign.json"
            }).success(function(response, status) {
                // 退出成功后跳转到登录界面
                $state.go("access.signin");
            }).error(function(response, status) {
                toastr.warning('获取数据失败', '提示', {
                    closeButton : true,
                    timeOut : 5000
                });
            });
        }

    };

    app.filter('strToDate', [ function() {
        return function(text) {
            if (text == null || text == '') {
                return '未知';
            } else {
                var date = text.replace(/-/ig, "/");
                var date_time = Date.parse(date);
                var str = date.substring(0, 4);
                if (str == '1970') {
                    return '未知';
                }
                return new Date(date_time);
            }
        }
    } ]);

    indexController.$inject = [ '$scope', '$rootScope', '$http',
            '$location', '$window', '$state', 'toastr', 'blockUI' ];
    app.controller("indexController", indexController);
    angularAMD.bootstrap(app);
    return app;
});