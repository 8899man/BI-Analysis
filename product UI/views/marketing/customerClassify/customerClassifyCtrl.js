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
			$scope.areas = response;
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
			area: $scope.areaCurrent,
			city: $scope.cityCurrent,
			project: $scope.projectCurrent
		});
		//$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");
		//$scope.toStep2 = true;
		//console.log($("#step2").offset().top);
	}


	//获取细分类型数据
	$scope.getSubTypeData = function(info){
		customerClassifyServices.getSubTypeData(info, function(response, status){
			$scope.subTypeData = response;
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
			value: value,
			title: title
		});
		
	}

	$scope.getFetchData = function(info){
		customerClassifyServices.getFetchData(info, function(response, status){
			fetchDataUploaded[info.value] = response;
			$scope.fetchDataTotal = response.total;
			$scope.persons = response.list;
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

