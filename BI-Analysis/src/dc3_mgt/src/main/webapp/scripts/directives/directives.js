define(['angular'], function(){
	
	
	var commonDirectives = angular.module("commonDirectives", []);
	//tab切换指令
	commonDirectives.directive("tabsNav", function(){
        return {
            restrict: "AEC",
            link: function(scope, element, attrs){
                var element = $(element);
                var content = element.siblings(".tabs-content").children(".tab-inside");
                var tabs = element.find(".tab-nav");
                var index = (attrs.activeindex != undefined ? +attrs.activeindex : 0);
                tabs.eq(index).addClass("active");
                content.eq(index).show();
                tabs.click(function(){
                    $(this).addClass("active").siblings().removeClass("active");
                    var indexCurrent = 0;
                    var that = this;
                    $(this).parent().children(".tab-nav").each(function(index,li){
                        if(this === that){
                            indexCurrent = index
                        }
                    })
                    content.eq(indexCurrent).show().siblings().hide();
                });
            }
        }
    })
    //返回按钮指令
    .directive('backButton', function(){
        return {
            restrict: 'AC',
            link: function(scope, element, attrs) {
                element.bind('click', goBack);
                function goBack() {
                    history.back();
                    scope.$apply();
                }
            }
        }
    })
    //设置项目-流程分析指令
    .directive('projectProcess', [function () {
        return {
            restrict: "AE",
            scope:{
                title: "@",
                usedDays: "@",
                baseline: "@"
            },
            template: '<div class="project-process">' +
                        '<div class="process-title">{{title}}<b>{{usedDays}}</b>天</div>' +
                            //'<div class="process-bar clearfix">' +
                            //    '<div class="process-bar-inside pull-right exceeding" ng-show="baseline<usedDays" ng-style={"width":((usedDays-baseline)/usedDays*100+"%")}></div>' +
                            //    '<div class="process-bar-inside pull-left" ng-show="baseline>=usedDays" ng-style={"width":((usedDays/baseline)*100+"%")}></div>' +
                            //'</div>' +
                            '<div class="process-bar-num clearfix">' +
                                '<span class="process-bar-num-real" ng-class="{maxWidth: (usedDays - baseline) >= 0}" ng-style={"width":((usedDays/baseline)*100*0.66+"%")}></span>' +
                                '<span class="process-bar-num-over" ng-show="((usedDays - baseline) > 0)" ng-class="{maxWidth: usedDays*2 >= baseline*3}" ng-style={"width":((usedDays/baseline)*100*0.66+"%")}></span>' +
                                '<span ng-show="((usedDays - baseline) > 0)">超出：{{usedDays-baseline}}天</span>' +
                                '<span ng-show="((usedDays - baseline) <= 0)">所用时间：{{usedDays}}天</span>' +
                            '</div>' +
                            '<div class="process-bar-base clearfix">' +
                                '<span class="process-bar-base-in"></span><p class="process-bar-base-title">平均基线：{{baseline}}天</p>' +
                            '</div>' +
                            //'<div class="process-info clearfix">' +
                            //    '<span ng-class="{pullLeft:baseline<usedDays,pullRight:baseline>=usedDays}">平均基线：{{baseline}}天</span>' +
                            //    '<span class="pull-right" ng-show="usedDays>baseline">超出：{{usedDays-baseline}}天</span>' +
                            //    '<span class="pull-left" ng-show="usedDays<=baseline">所用时间：{{usedDays}}天</span>' +
                            //'</div>' +
                        '</div>'
        }
    }])
	//弹出一级菜单指令
	.directive("navbarBrand", [function() {
        return {
            restrict: "AC",
            link: function(scope, element, attrs) {
                var $menuPop, height, popBind;
                element.on("click", function(event){
                    $("#nav-pop-mask").fadeIn("fast", function(){
                        $(this).css("opacity", 0.5);
                    });
                    var h = $("#nav-pop").height();
                    $("#nav-pop").css({"opacity":0, "top": -h}).show().animate({"top":0,"opacity":1}, 100);
                    

                    $("#nav-pop-mask").bind("click", function(){
                        $("#nav-pop-mask").fadeOut("fast", function(){
                            $(this).css("opacity", 0.5);
                        });
                        var h = $("#nav-pop").height();
                        $("#nav-pop").animate({"top":-h,"opacity":0}, 100, function(){
                            $(this).hide();
                        });
                        $("#nav-pop-mask").unbind();
                        $("#nav-pop").unbind();
                    });
                    $("#nav-pop").click(function(){
                        $("#nav-pop-mask").trigger("click");
                    })
                });
                
            }
        }
    }])
	//console.log(angular);
	//angular.module('directives', []);

    //回到顶部指令
    .directive("goTopBtn", ["$timeout", function($timeout) {
        return {
            restrict: "AC",
            template: "<a href='javascript:;' class='animated'></a>",
            link: function(scope, element, attrs) {
                //var $menuPop, height, popBind;
                element.on("click", "a", function(event){
                    $("html,body").animate({"scrollTop": 0});
                });

                scope.$on("$destroy", function(){
                    $(window).unbind("scroll", checkScroll);
                });

                function checkScroll(){
                    var scrollTop = $(window).scrollTop();
                    timer && $timeout.cancel(timer);
                    timer = $timeout(function(){
                        if(scrollTop <= 100){
                            element.fadeOut("fast");
                        }else{
                            element.fadeIn("fast");
                        }
                    },100)
                }

                checkScroll();//计算是显示“回到顶部按钮”还是隐藏

                var timer = null;
                
                $(window).scroll(checkScroll);
                
            }
        }
    }])
    .directive("datePickerYm",function(){
        return {
            restrict:"A",
            link:function(scope, element, attr){
                element.bind("click", function () {
                    window.WdatePicker({
                        onpicked: function () {
                            var that = this;
                            scope.$apply(function(){
                                scope.dateYM = that.value
                            });
                        },
                        dateFmt:'yyyy年MM月'
                    });
                });
            }
        };
    })
    .directive("startDateYmd",function(){
        return {
            restrict:"A",
            link:function(scope, element, attr){
                element.bind("click", function () {
                    window.WdatePicker({
                        onpicked: function () {
                            var that = this;
                            scope.$apply(function(){
                                scope.startDate = that.value
                            });
                        },
                        dateFmt:'yyyy-MM-dd'
                    });
                });
            }
        };
    })
    .directive("endDateYmd",function(){
        return {
            restrict:"A",
            link:function(scope, element, attr){
                element.bind("click", function () {
                    window.WdatePicker({
                        onpicked: function () {
                            var that = this;
                            scope.$apply(function(){
                                scope.endDate = that.value
                            });
                        },
                        dateFmt:'yyyy-MM-dd'
                    });
                });
            }
        };
    })
    .directive("levelTwoMenu", function(){
        return {
            restrict:"A",
            link:function(scope, element, attr){
                element.bind("mouseenter", function () {
                    $(element).find("ul").show();
                });
                element.bind("mouseleave", function () {
                    $(element).find("ul").hide();
                });
            }
        };
    })
    .directive("levelThreeMenu", function(){
        return {
            restrict:"A",
            link:function(scope, element, attr){
                element.bind("click", function () {
                    $(element).closest("ul").hide();
                });
            }
        };
    })
})