define(['app', 'window', 'jquery', 'customerClassifyServices', 'toastr'], function (app, w) {
    //console.dir(app);
	app.register.controller('CustomerClassifyController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', 'customerClassifyServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, customerClassifyServices, toastr) {

	$scope.initializeController = function () {

		$scope.banner.active = 0;//默认显示banner第一张

		$scope.toStep2 = false;//初始化是没有到第二步
		$scope.toStep3 = false;//初始化是没有到第三步

		$scope.getAreaCoverage();//获取区域范围

	}

	//重置按钮点击事件
	$scope.reset = function(){
		$scope.areaCurrent = null;
		$scope.cityCurrent = null;
		$scope.projectCurrent = null;
		$scope.toStep2 = false;//初始化是没有到第二步
		$scope.toStep3 = false;//初始化是没有到第三步
	}

	//获取区域范围
	//getAreaCoverage
	//console.dir(customerClassifyServices);
	$scope.getAreaCoverage = function(){
		customerClassifyServices.getAreaCoverage({}, function(response, status){
//			$scope.areas = response;
			$scope.areas = response.data;
		}, function(response, status){
			toastr.warning('获取数据失败', '提示', {
				closeButton: true,
				timeOut: 5000
			});
		})
	}

	//区域切换
	$scope.changeArea = function(area){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.areaCurrent = area;
		$scope.cities = area.subs || [];
		$scope.cityCurrent = $scope.cities[0];
		$scope.projects = $scope.cityCurrent.subs || [];
		$scope.projectCurrent = $scope.projects[0];
		
	}

	//城市切换
	$scope.changeCity = function(city){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.cityCurrent = city;
		$scope.projects = city.subs || [];
		$scope.projectCurrent = $scope.projects[0];
	}

	//项目切换
	$scope.changeProject = function(project){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.projectCurrent = project;
	}


	
	$scope.nextStep = function(){
		if($scope.areaCurrent == null){
			new w.Window().alert({
    			title: "温馨提示",
    			width: 300,
    			height: 160,
    			content: '请先选择区域范围',
    			hasCloseBtn: true
    		});
			return;
		}
		if($scope.toStep2){
			//如果已经点了下一步，点击无效
			return;
		}
		$scope.getSubTypeData({
//			area: $scope.areaCurrent,
//			city: $scope.cityCurrent,
//			project: $scope.projectCurrent
			bigCode: $scope.areaCurrent.value,
			cityCode: $scope.cityCurrent.value,
			projGUID: $scope.projectCurrent.value
		});
		//$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");
		//$scope.toStep2 = true;
		//console.log($("#step2").offset().top);
	}


	//获取细分类型数据
	$scope.getSubTypeData = function(info){
		customerClassifyServices.getSubTypeData(info, function(response, status){
//			$scope.subTypeData = response;
			$scope.subTypeData = response.data;
			$scope.subTypeCurrent = null;//同点击类型绑定
			$scope.toStep2 = true;//表示已经进入了第二步
			$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");
			
			if(typeof fetchDataUploaded == "object"){
				fetchDataUploaded = {};
			}
			
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


	//获取细分类型数据
	var fetchDataUploaded = {};//把已经成功加载的细分类型保存到这个对象上
	$scope.fetchData = function(value, title){
		$scope.purchasedCustomer = value;
		if(title === $scope.subTypeCurrentTitle){
			return;//如果点击的是当前已被选中的分类则直接返回
		}
		$scope.subTypeCurrentTitle = title;//避免点击同一个细分类时候再次请求
		if(fetchDataUploaded[value]){
			//如果是已经加载过的，直接使用之前已经保存的数据
			var response = fetchDataUploaded[value];
			$scope.fetchDataTotal = response.total;
			$scope.persons = response.list;
			$scope.toStep3 = true;//表示已经进入了第二步
			$("html,body").animate({"scrollTop": $("#step2").offset().top + $("#step2").outerHeight()/3}, "fast");
			return;
		}
		$scope.getFetchData({
			cstType: value,
			bigCode: $scope.areaCurrent.value,
			cityCode: $scope.cityCurrent.value,
			projGUID: $scope.projectCurrent.value
		});
		
	}

	$scope.getFetchData = function(info){
		customerClassifyServices.getFetchData(info, function(response, status){
//			fetchDataUploaded[info.value] = response;
//			$scope.fetchDataTotal = response.total;
//			$scope.persons = response.list;
			fetchDataUploaded[info.cstType] = response.data;
			$scope.fetchDataTotal = response.data.total;
			$scope.persons = response.data.list;
			$scope.toStep3 = true;//表示已经进入了第二步
			$("html,body").animate({"scrollTop": $("#step2").offset().top + $("#step2").outerHeight()/3}, "fast");

		}, function(response, status){
			toastr.warning('获取数据失败', '提示', {
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
			
			cstType: $scope.purchasedCustomer,
			bigCode: $scope.areaCurrent.value,
			bigName: $scope.areaCurrent.title,
			cityCode: $scope.cityCurrent.value,
			cityName: $scope.cityCurrent.title,
			projGuid: $scope.projectCurrent.value,
			projName: $scope.projectCurrent.title,
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
			customerClassifyServices.exportData(info);
		}
		
	}

  }]);
});

