define(['app', 'jquery', 'chart', 'dataToChartConfig', 'filters','projectDetailsService','toastr'], function (app) {

	

	app.register.controller('ProjectDetailsController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$stateParams', '$timeout', 'util', 'charts', 'dataToChartConfig', 'projectDetailsService','toastr', function ($location, $modal, $filter, $scope, $rootScope, $stateParams, $timeout, util, charts, dataToChartConfig, projectDetailsService,toastr) {
		
		//$scope.charts = charts;
		$scope.initializeController = function () {
			
			$rootScope.layout.hasSubs = false;
			$scope.selectLunch="1"; //设置默认为销售类型
			$scope.projType = "day";// 设置默认类型
			
			$scope.visible = false; //页面初始化默认隐藏客服赔付周期层
			
			$scope.project = {};
			$scope.project.id = $stateParams.projectId;
			
			//获取传入的id做ajax请求处理
			$scope.getProjectDetails();
			
			//关键指标
			$scope.getProjectIndex("day");

			//绑定屏幕变化时候执行计算高度
			var windowTime = null;
			$(window).resize(function(){
				windowTime && $timeout.cancel(windowTime);
				windowTime = $timeout(function(){
					$scope.setHeight();
				},300)
			})

			$timeout(function(){
				$(window).trigger("resize");
			},100)

		}
		
		var ballApp = angular.module('BallApp', []);
		ballApp.controller('LunchCtrl', function($scope) {
		    $scope.changeIndex = function() {
		    	switch($scope.selectLunch)
	        	{
	        	case "1": //销售
	        		$scope.getProjectDetails();
	        	  break;
	        	case "2": //客服
	        		$scope.getCustomerData();
	        	  break;
	        	case "3": //物业
	        		alert("没有数据，功能待续！！！");
	        		$scope.getPropertyData = function(){
	        			projectDetailsService.getPropertyData({}, function(response, status){
	        				$scope.loaded = true;//表示已经成功加载数据
	        			}, function(response, status){
	        				toastr.warning('获取数据失败', '提示', {
	        					closeButton: true,
	        					timeOut: 5000
	        				});
	        			})
	        		}
	        	  break;
	        	case "4": //置业
	        		$scope.getHousePurchData();
	        	  break;
	        	}
		    };
		});
		
		//客服
		$scope.getCustomerData = function(){
			projectDetailsService.getCustomerData({"proj_guid": $scope.project.id}, function(response, status){
				$scope.loaded = true;//表示已经成功加载数据
				$scope.index_num = 2;
				$scope.visible = true; //显示关键流程分析-->赔付周期 
				$scope.houseDetails = " "; //清空
				$scope.houseDetails = response.data.rptKfKeyIndex;
				$scope.proccess = response.data.rptKfIndexFlow;
				
				/*$scope.chartConfig1 = [
				       	  			['会员发展数', response.data.rptKfFormatIndex.devel_member_num],
				       	  			['报修满意度', response.data.rptKfFormatIndex.repair_satisfy_num],
				       	  			['投诉满意度', response.data.rptKfFormatIndex.complain_satisfy_num]
				       	  		];

				$scope.chartConfig1 = dataToChartConfig.dataToPie1Con($scope.chartConfig1)*/
				
				//客服业态指数
				$scope.exponential = [
      	  			{
      	  				title: '会员发展数',
      	  				finished: response.data.rptKfFormatIndex.devel_member_num,
      	  				noFinished: (response.data.rptKfFormatIndex.cst_num-response.data.rptKfFormatIndex.devel_member_num)
      	  			},
      	  			{
      	  				title: '报修满意度',
      	  				finished: response.data.rptKfFormatIndex.repair_satisfy_num,
      	  				noFinished: (response.data.rptKfFormatIndex.repair_num-response.data.rptKfFormatIndex.repair_satisfy_num)
      	  			},
      	  		    {
      	  				title: '投诉满意度',
      	  				finished: response.data.rptKfFormatIndex.complain_satisfy_num,
      	  				noFinished: (response.data.rptKfFormatIndex.complain_num-response.data.rptKfFormatIndex.complain_satisfy_num)
      	  			}
      	  		]
      	  		dataToChartConfig.dataToPie2Con($scope.exponential);
				
				$scope.fractional = [
				     	  			{
				     	  				title: '业主转活动参与',
				     	  				finished: 59,
				     	  				noFinished: 12
				     	  			},
				     	  			{
				     	  				title: '活动参与转会员',
				     	  				finished: 103,
				     	  				noFinished: 101
				     	  			},
				     	  			{
				     	  				title: '会员转消费',
				     	  				finished: 5,
				     	  				noFinished: 73
				     	  			}
				     	  		]
			  dataToChartConfig.dataToPie2Con($scope.fractional);
				
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})
		}
		
		//置业
		$scope.getHousePurchData = function(){
			projectDetailsService.getHousePurchData({"proj_guid": $scope.project.id}, function(response, status){
				$scope.loaded = true;//表示已经成功加载数据
				$scope.index_num = 4;
				$scope.visible = false; //隐藏关键流程分析-->赔付周期 
				$scope.houseDetails = " "; //清空
				$scope.houseDetails = response.data.rptZyKeyIndex;
				$scope.proccess = response.data.rptZyIndexFlow;
				
				/*$scope.chartConfig1 = [
				       	  			['会员发展数', response.data.rptKfFormatIndex.devel_member_num],
				       	  			['报修满意度', response.data.rptKfFormatIndex.repair_satisfy_num],
				       	  			['投诉满意度', response.data.rptKfFormatIndex.complain_satisfy_num]
				       	  		];

				$scope.chartConfig1 = dataToChartConfig.dataToPie1Con($scope.chartConfig1)*/
				
				//置业业态指数
				$scope.exponential = [
      	  			{
      	  				title: '租赁套数完成率',
      	  				finished: response.data.rptZyFormatIndex.plan_rent_set,
      	  				noFinished: (response.data.rptZyFormatIndex.fini_Rent_set-response.data.rptZyFormatIndex.plan_rent_set)
      	  			},
      	  			{
      	  				title: '租赁金额完成率',
      	  				finished: response.data.rptZyFormatIndex.plan_rent_money,
      	  				noFinished: (response.data.rptZyFormatIndex.fini_rent_money-response.data.rptZyFormatIndex.plan_rent_money)
      	  			},
      	  		    {
      	  				title: '成交套数完成率',
      	  				finished: response.data.rptZyFormatIndex.plan_deal_set,
      	  				noFinished: (response.data.rptZyFormatIndex.fini_deal_set-response.data.rptZyFormatIndex.plan_deal_set)
      	  			},
      	  		    {
      	  				title: '成交金额完成率',
      	  				finished: response.data.rptZyFormatIndex.plan_deal_money,
      	  				noFinished: (response.data.rptZyFormatIndex.fini_deal_money-response.data.rptZyFormatIndex.plan_deal_money)
      	  			}
      	  		]
      	  		dataToChartConfig.dataToPie2Con($scope.exponential);
				
				$scope.fractional = [
	     	  			{
	     	  				title: '客源转成交',
	     	  				finished: response.data.rptZyFormatConvert.buy_cst_deal_num,
	     	  				noFinished: (response.data.rptZyFormatConvert.buy_cst_num-response.data.rptZyFormatConvert.buy_cst_deal_num)
	     	  			},
	     	  			{
	     	  				title: '推荐转成交',
	     	  				finished: response.data.rptZyFormatConvert.tj_cst_deal_num,
	     	  				noFinished: (response.data.rptZyFormatConvert.tj_cst_num-response.data.rptZyFormatConvert.tj_cst_deal_num)
	     	  			},
	     	  			{
	     	  				title: '带看转成交',
	     	  				finished: response.data.rptZyFormatConvert.dk_cst_deal_num,
	     	  				noFinished: (response.data.rptZyFormatConvert.dk_cst_num-response.data.rptZyFormatConvert.dk_cst_deal_num)
	     	  			},
	     	  			{
	     	  				title: '客源转租赁',
	     	  				finished: response.data.rptZyFormatConvert.rent_cst_deal_num,
	     	  				noFinished: (response.data.rptZyFormatConvert.rent_cst_num-response.data.rptZyFormatConvert.rent_cst_deal_num)
	     	  			},
	     	  			{
	     	  				title: '推荐转租赁',
	     	  				finished: response.data.rptZyFormatConvert.tj_rent_cst_deal_num,
	     	  				noFinished: (response.data.rptZyFormatConvert.tj_rent_cst_num-response.data.rptZyFormatConvert.tj_rent_cst_deal_num)
	     	  			},
	     	  			{
	     	  				title: '带看转租赁',
	     	  				finished: response.data.rptZyFormatConvert.dk_rent_cst_deal_num,
	     	  				noFinished: (response.data.rptZyFormatConvert.dk_rent_cst_num-response.data.rptZyFormatConvert.dk_rent_cst_deal_num)
	     	  			}
     	  		]
     	  	dataToChartConfig.dataToPie2Con($scope.fractional);
				
			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})
		}

		
		$scope.getProjectIndex = function(projType) {
			var info ={
					  "proj_guid": $scope.project.id,
					  "projType": projType
			};
			
			projectDetailsService.getProjectIndex(info, $scope.ProjectIndexCompleted, function(){
			});
			
		}
		
		$scope.ProjectIndexCompleted = function (response, status) {
			$scope.index_num = 1;
			$scope.houseDetails = " "; //清空
			$scope.houseDetails = response.data.indexbase; //关键指标项
			$scope.indexcount = response.data.indexcount; //关键指标项
		}
		
		$scope.getFilterList = function(event, projType) {
			if ($(event.target).hasClass("active")) {
				return;
			}
			setTimeout(function() {
				$scope.getProjectIndex(projType);
			}, 10)
		}

		$scope.$on("$destroy", function(){
			$(window).unbind("resize");
		});

		$scope.setHeight = function(){
			util.setMaxHeightSame(".client-details-info", ".project-details-feature", true);
		}
		
		$scope.getProjectDetails = function () {
	          projectDetailsService.getProjectDetails({"proj_guid": $scope.project.id}, $scope.ProjectDetailsCompleted, $scope.ProjectDetailsError);
	    }

		$scope.ProjectDetailsCompleted = function (response, status) {
			  $scope.index_num = 1;
			  $scope.visible = false; //隐藏客服赔付周期层
	          $scope.houseDetails = response.data.indexbase; //关键指标项
	          $scope.proccess = response.data.indexFlow; //关键流程分析
	          $scope.houseName = response.data.bProjSum; //项目汇总
	          $scope.houseCst = response.data.rptCustomerCountMain; //客户主表
	          $scope.houseCstSum = response.data.rptCustomerCountMain.customer_bought_sum
	                                + response.data.rptCustomerCountMain.customer_intention_sum; //已购+意向=总客户数
	          $scope.houseyg = response.data.rptCustomerBoughtCount; //客户分类信息
	          $scope.age = response.data.RptAttachCount;//年龄分布
	          $scope.bproj = response.data.bProj;  //项目基础信息
	          $scope.sFList = response.data.sFollowRecordList //项目轨迹
	          
	          $scope.selledNum = response.data.rptXsFormatIndex.deal_house_num //项目基础信息中的已售套数
	          $scope.noSellNum = response.data.bProj.roomNum-response.data.rptXsFormatIndex.deal_house_num //项目基础信息中的在售套数
	          
	          //单独提前本地的值放在页面上
	          var arrArea = []; //存放籍贯区域人数
	          var arrName = []; //存放籍贯区域省份
	          var listAreas = []; //存放剔除籍贯区域人数最大的
	          var listNames = []; //存放剔除籍贯省份最大的
	          
	          $.each(response.data.RptArea,function(n,value){
	        	  arrArea[n]=value.cst_num;
	        	  arrName[n]=value.area_id;
		  	  });
              
	          
	          var j = arrArea[0]; //数组第一个元素
	          for (var i=0;i<arrArea.length;i++ ){
	              if(arrArea[i]>=j){  
	            	  $scope.RptAreaNum = arrArea[i]; //获得本省名称
	            	  $scope.RptAreaName = arrName[i]; //获得本省的数据
	            	  $scope.RptProj=response.data.bProjSum.proj_name; //项目名称
	              }else{
	            	  listAreas.push(arrArea[i]); //剔除本省的其他省份名称
	            	  listNames.push(arrName[i]); //剔除本省的其他省份数据
	              } 
	          }
	          
	          /*判断汇总金额为空的默认为零*/
	          if(response.data.bProjSum.subsc_sum == null)
	        	  response.data.bProjSum.subsc_sum = 0;
	          if(response.data.bProjSum.sale_sum == null)
	        	  response.data.bProjSum.sale_sum = 0;
	          if(response.data.bProjSum.family_sum == null)
	        	  response.data.bProjSum.family_sum = 0;
	          
	        /*业态指数 认购 签约 在售圆饼 开始*/
	  		/*$scope.chartConfig1 = [
	  			['认购', response.data.rptXsFormatIndex.rg_num],
	  			['签约', response.data.rptXsFormatIndex.qs_num],
	  			['在售', response.data.rptXsFormatIndex.zs_num]
	  		];

	  		$scope.chartConfig1 = dataToChartConfig.dataToPie1Con($scope.chartConfig1)*/
	  		/*业态指数 认购 签约 在售圆饼 结束*/


	  		/*业态指数右边两个圆弧 开始*/
	  		$scope.exponential = [
	  			{
	  				title: '成交金额（万元）',
	  				finished: response.data.rptXsFormatIndex.deal_money,
	  				noFinished: (response.data.rptXsFormatIndex.esti_Deal_money-response.data.rptXsFormatIndex.deal_money)
	  			},
	  			{
	  				title: '成交套数（套）',
	  				finished: response.data.rptXsFormatIndex.deal_house_num,
	  				noFinished: (response.data.rptXsFormatIndex.house_all_num-response.data.rptXsFormatIndex.deal_house_num)
	  			},
	  			{
	  				title: '成交面积（平米）',
	  				finished: response.data.rptXsFormatIndex.deal_acreage,
	  				noFinished: (response.data.rptXsFormatIndex.house_all_acreage-response.data.rptXsFormatIndex.deal_acreage)
	  			}
	  		]
	  		dataToChartConfig.dataToPie2Con($scope.exponential);
	  		/*业态指数右边两个圆弧 结束*/
	  		//alert("来电人数："+response.data.formatConvert.incoming_tele_sum);
	  		/*转化率分析 开始*/
	  		$scope.fractional = [
	  			{
	  				title: '来电转到访',
	  				finished: response.data.formatConvert.incoming_visit_sum,
	  				noFinished: (response.data.formatConvert.incoming_tele_sum-response.data.formatConvert.incoming_visit_sum)
	  			},
	  			{
	  				title: '到访转认筹',
	  				finished: response.data.formatConvert.visit_confess_sum,
	  				noFinished: (response.data.formatConvert.visit_cst_num-response.data.formatConvert.visit_confess_sum)
	  			},
	  			{
	  				title: '到访转认购',
	  				finished: response.data.formatConvert.visti_subscribe_sum,
	  				noFinished: (response.data.formatConvert.visit_cst_num-response.data.formatConvert.visti_subscribe_sum)
	  			},
	  			{
	  				title: '认筹转认购',
	  				finished: response.data.formatConvert.confess_subscribe_sum,
	  				noFinished: (response.data.formatConvert.confess_cst_num-response.data.formatConvert.confess_subscribe_sum)
	  			},
	  			{
	  				title: '认购转签约',
	  				finished: response.data.formatConvert.subscribe_contract_sum,
	  				noFinished: (response.data.formatConvert.subscribe_cst_num-response.data.formatConvert.subscribe_contract_sum)
	  			},
	  			{
	  				title: '签约转回款',
	  				finished: response.data.formatConvert.contract_returned_sum,
	  				noFinished: (response.data.formatConvert.contract_cst_num-response.data.formatConvert.contract_returned_sum)
	  			}
	  		]
	  		dataToChartConfig.dataToPie2Con($scope.fractional);
	  		
	  		/*转化率分析 结束*/
	  		 /*$.each(response.data.RptAttachCount,function(n,value){
	  			alert(value.customer_age_type+":"+value.customer_age_sum);
	  		 });*/
	  		 /*前端对json数据做2维数据封装*/
	  		 var arr1 = response.data.listData;
	         var arr2 = response.data.listValue;
	          
	         var arr3 = [];
	         for(var i=0, len=arr1.length; i<len; i++){
	              arr3[i] = [];
	              arr3[i].push(arr1[i], arr2[i]);
	         }
	  		
	        
	  		$scope.chartConfigObj4 = arr3;
	  		$scope.chartConfig4 = charts.pie3($filter('addDataKey')($scope.chartConfigObj4));
	  		
	  		/*从事行业*/
	  		$scope.chartConfigObj5 = {
			categories: response.data.listRptCstName,//从事行业名称
			data: response.data.listRptCstValue      //从事行业值
		    }

		    $scope.chartConfig5 = charts.column1($scope.chartConfigObj5);
	  		/*从事行业    结束*/
	  		
	  		/*籍贯区域*/
	  		$scope.chartConfigObj6 = {
				categories:listNames, //response.data.listareaName, //籍贯区域名称
	  			data:listAreas //response.data.listareaValue       //籍贯区域值
			}
			$scope.chartConfig6 = charts.column1($scope.chartConfigObj6); //横向
			//$scope.chartConfig6 = charts.bar1($scope.chartConfigObj6);  //纵向
	  		
	  		$scope.setHeight();//左右对齐

	      }
		  /*籍贯区域     结束*/

	      $scope.ProjectDetailsError = function (response, status) {
	        toastr.warning('获取数据失败', '提示', {
	          closeButton: true,
	          timeOut: 5000
	        });
	      }
	      
	      
	      $scope.pageChanged = function() {
				$scope.getProjectIndex(null);
			}
	}]);
});