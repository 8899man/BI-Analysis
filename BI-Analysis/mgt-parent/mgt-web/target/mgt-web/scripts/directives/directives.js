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
                                scope.startDate = that.value;
                            });
                        },
                        oncleared:function(){
                            scope.$apply(function(){
                                scope.startDate = "";
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
                        oncleared:function(){
                            scope.$apply(function(){
                                scope.endDate = "";
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
    //百分条指令
    .directive('percentScale', function(){
        return {
            restrict: "AE",
            scope:{
                featureTitle: "=",
                arr: "="
            },
            template: '<div class="clearfix has{{arr.length}}">' +
                            '<div class="customer-feature-title">{{featureTitle}}</div>' +
                            '<div class="customer-feature-percent"><div class="customer-feature-percent-outer">' +
                                '<div class="customer-feature-percent-nums">' +
                                    '<span class="s{{$index+1}}" ng-repeat="p in arr" ng-style={"width":(($index==0?(p.percent):($index==1?(arr[0].percent+arr[1].percent):($index==2)?(arr[0].percent+arr[1].percent+arr[2].percent):($index==3?(arr[0].percent+arr[1].percent+arr[2].percent+arr[3].percent):($index==4?(arr[0].percent+arr[1].percent+arr[2].percent+arr[3].percent+arr[4].percent):($index==5?(arr[0].percent+arr[1].percent+arr[2].percent+arr[3].percent+arr[4].percent+arr[5].percent):($index==6?(arr[0].percent+arr[1].percent+arr[2].percent+arr[3].percent+arr[4].percent+arr[5].percent+arr[6].percent):($index==7?(arr[0].percent+arr[1].percent+arr[2].percent+arr[3].percent+arr[4].percent+arr[5].percent+arr[6].percent+arr[7].percent):($index==8?(arr[0].percent+arr[1].percent+arr[2].percent+arr[3].percent+arr[4].percent+arr[5].percent+arr[6].percent+arr[7].percent+arr[8].percent):($index==9?(arr[0].percent+arr[1].percent+arr[2].percent+arr[3].percent+arr[4].percent+arr[5].percent+arr[6].percent+arr[7].percent+arr[8].percent+arr[9].percent):10)))))))))+"%")}></span>' +
                                    /*'<span></span>' +
                                    '<span></span>' +
                                    '<span></span>' +*/
                                '</div>' +
                                '<div class="customer-feature-percent-text clearfix">' +
                                    '<span class="s{{$index+1}}" ng-class="{clear: $index%4==0}" ng-repeat="p in arr"><i></i>{{p.name}} <b>{{p.percent}}</b>%</span>' +
                                    /*'<span><i></i>{{arr[0].name}} <b>{{arr[0].percent}}</b>%</span>' +
                                    '<span><i></i>45-54 <b>20</b>%</span>' +
                                    '<span><i></i>20-34 <b>15</b>%</span>' +
                                    '<span><i></i>55-64 <b>8</b>%</span>' +*/
                                '</div>' +
                            '</div></div>' +
                        '</div>'
        }
    })
    //客户概览左右切换指令
    .directive('listSlide', function(){
        return {
            restrict: "ACE",
            scope: {
                onepage: "@",//获取每屏显示的item数量
                customerSorts: "="
            },
            link: function(scope, element, attrs){
                scope.$watch('customerSorts', function(x,y){
                    if(x != undefined){
                        render();
                    }
                });

                //console.log(scope.onepage);
                var element = $(element);
                //获取容器
                var container = element.find(".page-container")
                //获取上一页跟下一页按钮
                var prevBtn = element.find(".arrow-prev");
                var nextBtn = element.find(".arrow-next");
                var currentIndex, items, onepage, pages
                function render(){
                    currentIndex = 1;//默认显示第一屏
                    items = element.find(".client-show-header-r-item");
                    onepage = (scope.onepage && (+scope.onepage)) || 1;
                    //console.log(typeof onepage);
                    pages = Math.ceil(items.length/onepage);
                    //遍历item设置left坐标
                    angular.forEach(items, function(item, index){
                        //console.log(item);
                        $(item).css({"left": index*33.333 + "%"});
                    });
                    setBtnStyle();
                }
                render();
                
                //设置上一页下一页按钮样式             
                function setBtnStyle(){
                    if(currentIndex == 1){
                        prevBtn.addClass("has-no");
                    }else{
                        prevBtn.removeClass("has-no");
                    }
                    if(currentIndex >= pages){
                        nextBtn.addClass("has-no");
                    }else{
                        nextBtn.removeClass("has-no");
                    }
                }
                setBtnStyle();


                var goToPage = function(){
                    //console.log(111);
                    //console.log(container.html());
                    container.animate({"left": -100*(currentIndex-1) + "%"});
                }

                nextBtn.click(function(){
                    if(currentIndex>=pages){
                        return;
                    }
                    currentIndex++;
                    goToPage();
                    setBtnStyle()
                });

                prevBtn.click(function(){
                    if(currentIndex<=1){
                        return;
                    }
                    currentIndex--;
                    goToPage();
                    setBtnStyle()
                })


                //console.log(pages);
                //console.log(scope);
                //console.log(element);
                //console.log(attrs);
            }
        }
    }).directive('placeholder', ['$compile', function($compile){
        return {
            restrict: 'A',
            scope: {},
            link: function(scope, ele, attr) {
                var input = document.createElement('input');
                var isSupportPlaceholder = 'placeholder' in input;
                if (!isSupportPlaceholder) {
                    var fakePlaceholder = angular.element(
                        '<span class="placeholder">' + attr['placeholder'] + '</span>');
                    fakePlaceholder.on('click', function(e){
                        e.stopPropagation();
                        ele.focus();
                    });
                    ele.before(fakePlaceholder);
                    $compile(fakePlaceholder)(scope);
                    ele.on('focus', function(){
                        fakePlaceholder.hide();
                    }).on('blur', function(){
                        if (ele.val() === '') {
                            fakePlaceholder.show();
                        }
                    });


                    scope.getElementPosition = function() {
                        return ele.position();    
                    };
                    scope.$watch(scope.getElementPosition, function(){
                        fakePlaceholder.css({
                            'top': ele.position().top + 'px',
                            'left': ele.position().left + 'px'
                        }); 
                    }, true);


                    scope.getElementHeight = function() {
                        return ele.outerHeight();  
                    };
                    scope.$watch(scope.getElementHeight, function(){
                        fakePlaceholder.css('line-height', ele.outerHeight() + 'px'); 
                    });
                    if (ele.css('font-size')){
                        fakePlaceholder.css('font-size', ele.css('font-size'));
                    }
                    if (ele.css('text-indent')){
                        fakePlaceholder.css('text-indent', 
                            parseInt(ele.css('text-indent')) + 
                            parseInt(ele.css('border-left-width'))
                        );
                    }
                    if (ele.css('padding-left')){
                        fakePlaceholder.css('padding-left', ele.css('padding-left'));
                    }
                    if (ele.css('margin-top')){
                        fakePlaceholder.css('margin-top', ele.css('margin-top'));
                    }



                    scope.isElementVisible = function(){
                        return ele.is(':visible'); 
                    };
                    scope.$watch(scope.isElementVisible, function(){
                        var displayVal = ele.is(':visible') ? 'block' : 'none';
                        fakePlaceholder.css('display', displayVal);
                        if (displayVal === 'blcok' && ele.val()) {
                            fakePlaceholder.hide();
                        }
                    });

                    scope.hasValue = function(){
                        return ele.val(); 
                    };
                    scope.$watch(scope.hasValue, function(){
                        if (ele.val()) {
                            fakePlaceholder.hide();
                        }
                    });


                }





            }
        };
    }])
	.directive("scrollFixTop", [function($timeout){
        return {
            restrict: "AE",
            link: function(scope, ele, attr){
                //console.log(ele);
                var ele = $(ele);
                ele.css({"position":"relative"});
                
                var scrollHeader = ele.find(".scroll-header");
                
                var scrollMain = ele.find(".scroll-main");
                var eleHeight = 0, scrollHeaderHeight = 0, scrollMainHeight = 0;

                //console.log("scrollMainW:" + scrollMain.width());

                function getMainHeight(){
                    return scrollMain.outerHeight();
                }


                scope.getMainHeight = function() {
                    return scrollMain.outerHeight();  
                };

                scope.$watch(scope.getMainHeight, function(){
                    eleHeight = ele.height();
                    scrollHeaderHeight = scrollHeader.outerHeight();
                    scrollMainHeight = scrollMain.outerHeight();
                    if(eleHeight - scrollHeaderHeight < scrollMainHeight){
                        //console.log(eleHeight - scrollHeaderHeight);
                        scrollMain.css({"height": (eleHeight - scrollHeaderHeight), "overflow": "auto"});
                        //console.log("w2: " + scrollMain.width());
                        scrollHeader.css({"paddingRight":17})
                    }
                });

                
            }
        }
    }])
	 //登录界面轮换背景图片指令
    .directive("slideBg", ["$timeout", function($timeout){
        return {
            restrict: "AE",
            scope: {
                slideTime: "@"
            },
            link: function(scope, element, attrs){
                //console.log("scope");
                //console.dir(scope);
                var $element = $(element);
                var imgs = attrs.imgs.split(",");
                var imgsUploaded = [];
                var imgsInitWidthHeight = [];//保存图片原始的宽高
                var i = 0;
                var time = +attrs.time * 1000;//切换渐变时间
                
                //console.log(imgs);
                createNext();
                function createNext(){
                    if(i == imgs.length){
                        //当已经加载完所有图片开始进行初始化绑定事件
                        init();
                        //console.log(imgsUploaded);
                        return;
                    }
                    var img = new Image();
                    img.src = imgs[i] + "?" + (+new Date());
                    //console.log(img);
                    img.onload = function(){
                        //console.log("w:" + img.width + " h: " + img.height);
                        imgsUploaded.push(img);
                        imgsInitWidthHeight.push({
                            "w": img.width,
                            "h": img.height
                        })
                        i++;
                        createNext();//继续加载下一张图片
                    }
                }

                function init(){
                    render();
                    bind();
                }

                //
                var $imgs = null;
                function render(){
                    for(var j=0, len=imgsUploaded.length; j<len; j++){
                        $element.append(imgsUploaded[j])
                    }
                    //默认显示第一个
                    $imgs = $element.find("img");
                    $imgs.hide();
                    $imgs.eq(0).fadeIn();
                }

                function bind(){
                    //绑定事件
                    windowResize();
                    goChangeImg();
                }

                var changeImg = null;
                var imgIndex = 0;
                function goChangeImg(){
                    changeImg = $timeout(function(){
                        //console.log("length:" + $imgs.length);
                        $imgs.eq(imgIndex).fadeOut();
                        if(imgIndex == $imgs.length-1){
                            imgIndex = 0;
                            $imgs.eq(imgIndex).fadeIn()
                        }else{
                            $imgs.eq(imgIndex+1).fadeIn();
                        }
                        imgIndex ++;
                        goChangeImg();
                    },time)
                }


                scope.$on("$destroy", function(){
                    $(window).unbind("resize", windowResize);
                });

                function windowResize(){
                    timer && $timeout.cancel(timer);
                    timer = $timeout(function(){
                        if($imgs == null){
                            return;
                        }
                        //console.log(1111111);
                        var width = $(window).width();
                        var height = $(window).height();
                        //$imgs.css({width: width})
                        $imgs.each(function(index, img){
                            

                            var w = width;
                            var h = (w/imgsInitWidthHeight[index].w)*imgsInitWidthHeight[index].h;

                            if(h<height){
                                h = height;
                            }

                            $(img).css({width: w, height: h, top: -(h-height) + "px"});

                            //console.log(img.width);
                            //var w = width;
                            //var h = width/imgsInitWidthHeight[index].w*
                        })

                    },100)
                }

                //checkScroll();//计算是显示“回到顶部按钮”还是隐藏

                var timer = null;
                
                $(window).resize(windowResize);

            }
        }
    }])
    
    //iframe盒子
    .directive("iframeBox", ["$timeout", function($timeout){
        return {
            restrict: "AE",
            scope: {
                iframeHref: "="
            },
            link: function(scope, element, attrs){
                //alert(scope.href);
                var $element = $(element);


                // 建议的正则
                function isURL(str){
                	return str.indexOf("http") == 0;
                }
                
                


                scope.$watch('iframeHref', function(href){
                    if(href == undefined){
                        return;
                    }

                    if(!isURL(href)){
                        return;
                    }
                    //console.log("haha");
                    //console.log(a);
                    //alert(href);

                    //<iframe ng-src="{{href}}" frameborder="0" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" allowtransparency="yes"></iframe>

                    var iframe = document.createElement("iframe");
                    iframe.src = href;
                    iframe.width = "100%";
                    iframe.height = "100%";
                    iframe.frameborder = "no";
                    iframe.border = 0;
                    $(iframe).css({border:"0", frameborder: "no"});

                    $element.append(iframe);

                    $timeout(function(){
                        //alert(1111);
                        $(window).trigger("resize");
                    },500)


                });

                resize();

                function resize(){
                    //console.log("resize");
                    $element.css({position:"relative", top:0});
                    var offset = $element.offset();
                    var top = offset.top;
                    //console.log(top);
                    $element.css({"width":"100%", "height": $(window).height()-top-4, "backgroundColor":"#fff", "position":"absolute", "left":0, "top": top});
                }

                $(window).bind("resize", resize);


                scope.$on("$destroy", function(){
                    $(window).unbind("resize", resize);
                })

            }
        }
    }])
    
    .directive("isDate", [function(){
		return {
			restrict: "AE",
			scope: {
				"dateTime": "="
			},
			link: function(scope, element, attrs){

				element.bind("click", function () {
                    window.WdatePicker({
                        onpicked: function () {
                            var that = this;
                            scope.$apply(function(){
                                scope.dateTime = that.value;
                            });
                        },
                        oncleared:function(){
                            scope.$apply(function(){
                                scope.dateTime = "";
                            });
                        }
                    });
                });
			}
		}
	}])
    
    
})