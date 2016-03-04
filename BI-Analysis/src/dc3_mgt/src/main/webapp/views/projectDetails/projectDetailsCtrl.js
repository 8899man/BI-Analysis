define(['app', 'jquery', 'chart', 'dataToChartConfig', 'filters','projectDetailsService'], function (app) {

	

    //console.dir(app);
	app.register.controller('ProjectDetailsController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$stateParams', '$timeout', 'util', 'charts', 'dataToChartConfig', 'projectDetailsService', function ($location, $modal, $filter, $scope, $rootScope, $stateParams, $timeout, util, charts, dataToChartConfig, projectDetailsService) {

		//console.dir(pie);

		//$scope.charts = charts;

        //console.dir(projectDetailsService);
		$scope.initializeController = function () {
			$rootScope.layout.hasSubs = false;
			//console.dir($stateParams)
			$scope.project = {};
			$scope.project.id = $stateParams.projectId;
			//console.log($scope.project.id);
			//获取传入的id做ajax请求处理
			$scope.getProjectDetails();

			//绑定屏幕变化时候执行计算高度
			var windowTime = null;
			$(window).resize(function(){
				windowTime && $timeout.cancel(windowTime);
				windowTime = $timeout(function(){
					//console.log("timeout");
					$scope.setHeight();
				},300)
			})

			$timeout(function(){
				$(window).trigger("resize");
			},100)

		}

		$scope.$on("$destroy", function(){
			$(window).unbind("resize");
		});

		$scope.setHeight = function(){
			//console.log(111);
			util.setMaxHeightSame(".client-details-info", ".project-details-feature", true);
		}
		
		$scope.getProjectDetails = function () {
	          console.log($scope.project.id);
	          projectDetailsService.getProjectDetails({"proj_guid": $scope.project.id}, $scope.ProjectDetailsCompleted, $scope.ProjectDetailsError);
	      }
		
		
		$scope.ProjectDetailsCompleted = function (response, status) {
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
	  		$scope.chartConfig1 = [
	  			['认购', response.data.bProjSum.subsc_sum],
	  			['签约', response.data.bProjSum.sale_sum],
	  			['在售', response.data.bProjSum.family_sum-response.data.bProjSum.subsc_sum]
	  		];

	  		$scope.chartConfig1 = dataToChartConfig.dataToPie1Con($scope.chartConfig1)
	  		/*业态指数 认购 签约 在售圆饼 结束*/


	  		/*业态指数右边两个圆弧 开始*/
	  		$scope.exponential = [
	  			{
	  				title: '成交金额（万元）',
	  				finished: response.data.indexbase.subscribe_amount_sum, //response.data.bProj.saleAmount
	  				noFinished: response.data.bProjSum.saleamountsum 
	  			},
	  			{
	  				title: '成交套数（套）',
	  				finished: response.data.bProjSum.sale_sum,
	  				noFinished: response.data.bProjSum.family_sum
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
	  				noFinished: response.data.formatConvert.incoming_tele_sum
	  			},
	  			{
	  				title: '到访转认筹',
	  				finished: response.data.formatConvert.visit_confess_sum,
	  				noFinished: response.data.formatConvert.visit_cst_num
	  			},
	  			{
	  				title: '到访转认购',
	  				finished: response.data.formatConvert.visti_subscribe_sum,
	  				noFinished: response.data.formatConvert.visit_cst_num
	  			},
	  			{
	  				title: '认筹转认购',
	  				finished: response.data.formatConvert.confess_subscribe_sum,
	  				noFinished: response.data.formatConvert.confess_cst_num
	  			},
	  			{
	  				title: '认购转签约',
	  				finished: response.data.formatConvert.subscribe_contract_sum,
	  				noFinished: response.data.formatConvert.subscribe_cst_num
	  			},
	  			{
	  				title: '签约转回款',
	  				finished: response.data.formatConvert.contract_returned_sum,
	  				noFinished: response.data.formatConvert.contract_cst_num
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

	      }
		  /*籍贯区域     结束*/

	      $scope.ProjectDetailsError = function (response, status) {
	        toastr.warning('获取数据失败', '提示', {
	          closeButton: true,
	          timeOut: 5000
	        });
	      }
	}]);
});