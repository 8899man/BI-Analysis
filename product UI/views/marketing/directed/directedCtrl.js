define(['app', 'window', 'jquery', 'directedServices', 'toastr'], function (app, w) {
    //console.dir(app);
	app.register.controller('DirectedController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', 'directedServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, directedServices, toastr) {

	$scope.initializeController = function () {

		$scope.banner.active = 2;//默认显示banner第三张

		$scope.toStep2 = false;//初始化是没有到第二步
		$scope.toStep3 = false;//初始化是没有到第三步

		$scope.getCoverage();//获取区域范围

	}

	//重置按钮点击事件
	$scope.reset = function(){
		
		$scope.toStep2 = false;//初始化是没有到第二步
		$scope.toStep3 = false;//初始化是没有到第三步

		//分析类型
		$scope.analysisTypes.analysisTypeCurrent = $scope.analysisTypes[0];
		
		//营销区域范围赋值
		$scope.marketingAreaCurrent = $scope.marketingAreas[0];
		$scope.marketingCities = $scope.marketingAreaCurrent['subs'];
		$scope.marketingCityCurrent = $scope.marketingCities[0];

		$scope.marketingProjects = $scope.marketingCityCurrent.subs || [];
		$scope.marketingProjectCurrent = $scope.marketingProjects[0];

		//分析区域范围赋值
		$scope.analysisAreaCurrent = $scope.analysisAreas[0]
		$scope.analysisCities = $scope.analysisAreaCurrent['subs'];
		$scope.analysisCityCurrent = $scope.analysisCities[0];

		$scope.analysisProjects = $scope.analysisCityCurrent.subs || [];
		$scope.analysisProjectCurrent = $scope.analysisProjects[0];


	}

	//获取区域范围
	//getAreaCoverage
	//console.dir(directedServices);
	$scope.getCoverage = function(){
		directedServices.getCoverage({}, function(response, status){

			//分析类型
			$scope.analysisTypes = response.analysisTypes;
			
			$scope.analysisTypes.analysisTypeCurrent = $scope.analysisTypes[0];
			
			//营销区域范围赋值
			$scope.marketingAreas = response.areas;
			$scope.marketingAreaCurrent = $scope.marketingAreas[0];
			$scope.marketingCities = $scope.marketingAreaCurrent['subs'];
			$scope.marketingCityCurrent = $scope.marketingCities[0];

			$scope.marketingProjects = $scope.marketingCityCurrent.subs || [];
			$scope.marketingProjectCurrent = $scope.marketingProjects[0];

			//分析区域范围赋值
			$scope.analysisAreas = response.areas;
			$scope.analysisAreaCurrent = $scope.analysisAreas[0]
			$scope.analysisCities = $scope.analysisAreaCurrent['subs'];
			$scope.analysisCityCurrent = $scope.analysisCities[0];

			$scope.analysisProjects = $scope.analysisCityCurrent.subs || [];
			$scope.analysisProjectCurrent = $scope.analysisProjects[0];






		}, function(response, status){
			toastr.warning('获取数据失败', '提示', {
				closeButton: true,
				timeOut: 5000
			});
		})
	}

	//目标营销区域切换
	$scope.changeMarketingArea = function(area){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.marketingAreaCurrent = area;
		$scope.marketingCities = $scope.marketingAreaCurrent.subs || [];
		$scope.marketingCityCurrent = $scope.marketingCities[0];

		$scope.marketingProjects = $scope.marketingCityCurrent.subs || [];
		$scope.marketingProjectCurrent = $scope.marketingProjects[0];
	}

	//目标营销城市切换
	$scope.changeMarketingCity = function(city){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.marketingCityCurrent = city;

		$scope.marketingProjects = $scope.marketingCityCurrent.subs || [];
		$scope.marketingProjectCurrent = $scope.marketingProjects[0];
	}

	//目标营销项目切换
	$scope.changeMarketingProject = function(project){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.marketingProjectCurrent = project;
	}

	//客源分析区域切换
	$scope.changeAnalysisArea = function(area){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.analysisAreaCurrent = area;
		$scope.analysisCities = $scope.analysisAreaCurrent.subs || [];
		$scope.analysisCityCurrent = $scope.analysisCities[0];

		$scope.analysisProjects = $scope.analysisCityCurrent.subs || [];
		$scope.analysisProjectCurrent = $scope.analysisProjects[0];
	}

	//客源分析城市切换
	$scope.changeAnalysisCity = function(city){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.analysisCityCurrent = city;

		$scope.analysisProjects = $scope.analysisCityCurrent.subs || [];
		$scope.analysisProjectCurrent = $scope.analysisProjects[0];
	}

	//客源分析项目切换
	$scope.changeAnalysisProject = function(project){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.analysisProjectCurrent = project;
	}



	




	$scope.nextStep = function(){
		
		if($scope.toStep2){
			//如果已经点了下一步，点击无效
			return;
		}
		$scope.getFetchData({
			analysisTypes: $scope.analysisTypes,
			marketingAreaCurrent: $scope.marketingAreaCurrent,
			marketingCityCurrent: $scope.marketingCityCurrent,
			analysisAreaCurrent: $scope.analysisAreaCurrent,
			analysisCityCurrent: $scope.analysisTypes.analysisTypeCurrent
		});
		//$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");
		//$scope.toStep2 = true;
		//console.log($("#step2").offset().top);
	}



	//获取数据
	$scope.getFetchData = function(info){
		directedServices.getFetchData(info, function(response, status){
			$scope.fetchDataTotal = response.total;
			$scope.persons = response.list;
			$scope.toStep2 = true;//表示已经进入了第二步
			$scope.toStep3 = true;//表示已经进入了第三步
			$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");
			//默认全选提取项
			$scope.dataModalName = true;
			$scope.dataModalTel = true;
			$scope.dataModalEmail = true;
			$scope.dataModalAddress = true;

		}, function(response, status){
			toastr.warning('获取数据失败', '提示', {
				closeButton: true,
				timeOut: 5000
			});
		})
	}

	//提取数据按钮事件
	$scope.downloadData = function(){
		/*
            var form = $("<form>");   //定义一个form表单
            form.attr('style', 'display:none');   //在form表单中添加查询参数
            form.attr('target', '');
            form.attr('method', 'post');
            form.attr('action', "/api/ExportHandler.ashx");
            var input1 = $('<input>');
            input1.attr('type', 'hidden');
            input1.attr('name', 'labelId');
            input1.attr('value', labelId);
            var input2 = $('<input>');
            input2.attr('type', 'hidden');
            input2.attr('name', 'dataModalName');
            input2.attr('value', $scope.dataModalName);
            var input3 = $('<input>');
            input3.attr('type', 'hidden');
            input3.attr('name', 'dataModalTel');
            input3.attr('value', $scope.dataModalTel);
            var input4 = $('<input>');
            input4.attr('type', 'hidden');
            input4.attr('name', 'dataModalEmail');
            input4.attr('value', $scope.dataModalEmail);
            var input5 = $('<input>');
            input5.attr('type', 'hidden');
            input5.attr('name', 'dataModalAddress');
            input5.attr('value', $scope.dataModalAddress);
            var input6 = $('<input>');
            input6.attr('type', 'hidden');
            input6.attr('name', 'subTypeCurrentTitle');
            input6.attr('value', $scope.subTypeCurrentTitle);
            $('body').append(form);  //将表单放置在web中
            form.append(input1);   //将查询参数控件提交到表单上
            form.submit();   //表单提交
            */
	}



	


	//$scope.persons = 

     
  }]);
});

