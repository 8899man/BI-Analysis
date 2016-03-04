define(['app', 'window', 'jquery', 'directedServices', 'toastr'], function (app, w) {
    //console.dir(app);
	app.register.controller('DirectedController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', 'directedServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, directedServices, toastr) {

	$scope.initializeController = function () {
		
		$scope.addressName = "户籍所在地";
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
//			$scope.analysisTypes = response.analysisTypes;
			$scope.analysisTypes = [{'title': '户籍异地购房','value': '1'},{'title': '工作异地购房','value':'2'}];
			
			$scope.analysisTypes.analysisTypeCurrent = $scope.analysisTypes[0];
			
			//营销区域范围赋值
//			$scope.marketingAreas = response.areas;
			$scope.marketingAreas = response.data.areas;
			
			$scope.marketingAreaCurrent = $scope.marketingAreas[0];
			$scope.marketingCities = $scope.marketingAreaCurrent['subs'];
			$scope.marketingCityCurrent = $scope.marketingCities[0];

			$scope.marketingProjects = $scope.marketingCityCurrent.subs || [];
			$scope.marketingProjectCurrent = $scope.marketingProjects[0];

			//分析区域范围赋值
//			$scope.analysisAreas = response.areas;
			$scope.analysisAreas = response.data.provinces;
			$scope.analysisAreaCurrent = $scope.analysisAreas[0]
			$scope.analysisCities = $scope.analysisAreaCurrent['subs'];
			$scope.analysisCityCurrent = $scope.analysisCities[0];

			
		}, function(response, status){
			toastr.warning("操作失败", '提示', {
				closeButton: true,
				timeOut: 5000
			});
		})
	}
	
	$scope.changeRadio = function(typeId){
		if(typeId == "1"){
			$scope.addressName = "户籍所在地";
		}else if(typeId == "2"){
			$scope.addressName = "工作所在地";
		}
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

	}

	//客源分析城市切换
	$scope.changeAnalysisCity = function(city){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.analysisCityCurrent = city;

	}

	$scope.nextStep = function(){
		
		if($scope.toStep2){
			//如果已经点了下一步，点击无效
			return;
		}
		$scope.getFetchData({
			analysisType: $scope.analysisTypes.analysisTypeCurrent.value,
			cityName: $scope.marketingCityCurrent.title,
			houseCityCode: $scope.analysisCityCurrent.value
		});
		//$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");
		//$scope.toStep2 = true;
		//console.log($("#step2").offset().top);
	}



	//获取数据
	$scope.getFetchData = function(info){
		directedServices.getFetchData(info, function(response, status){
//			$scope.fetchDataTotal = response.total;
			$scope.fetchDataTotal = response.data.total;
//			$scope.persons = response.list;
			$scope.persons = response.data.list;
			$scope.toStep2 = true;//表示已经进入了第二步
			$scope.toStep3 = true;//表示已经进入了第三步
			$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");
			//默认全选提取项
			$scope.dataModalName = true;
			$scope.dataModalTel = true;
			$scope.dataModalEmail = true;
			$scope.dataModalAddress = true;
			
		}, function(response, status){
			toastr.warning("操作失败", '提示', {
				closeButton: true,
				timeOut: 5000
			});
		})
	}
	
	//提取数据按钮事件
	$scope.downloadData = function(){
		var titleTop = "";
		if($scope.dataModalName){
			titleTop += "1";
		}
		if($scope.dataModalTel){
			titleTop += ",2";
		}
		if($scope.dataModalEmail){
			titleTop += ",3";
		}
		if($scope.dataModalAddress){
			titleTop += ",4";
		}
		
		$scope.exportData({
			analysisType: $scope.analysisTypes.analysisTypeCurrent.value,
			cityCode: $scope.marketingCityCurrent.value,
			cityName: $scope.marketingCityCurrent.title,
			projGuid: $scope.marketingProjectCurrent.value,
			projName: $scope.marketingProjectCurrent.title,
			houseCityCode: $scope.analysisCityCurrent.value,
			houseCityName: $scope.analysisCityCurrent.title,
			titleTop: titleTop
		});
	}
	
	$scope.exportData = function(info){
		if($scope.fetchDataTotal == 0){
			toastr.warning("暂无数据", '提示', {
				closeButton: true,
				timeOut: 5000
			});
		}else if(info.titleTop == null || info.titleTop == ""){
			toastr.warning("请选择提取项", '提示', {
				closeButton: true,
				timeOut: 5000
			});
		}else{
			directedServices.exportData(info);
		}
		
	}


  }]);
});

