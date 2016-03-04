define(['app', 'window', 'jquery', 'investmentCustomerServices', 'toastr'], function (app, w) {
    //console.dir(app);
	app.register.controller('InvestmentCustomerController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', 'investmentCustomerServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, investmentCustomerServices, toastr) {

	$scope.initializeController = function () {

		$scope.banner.active = 1;//默认显示banner第二张

		$scope.toStep2 = false;//初始化是没有到第二步
		$scope.toStep3 = false;//初始化是没有到第三步

		$scope.getCoverage();//获取区域范围

	}


	





	//重置按钮点击事件
	$scope.reset = function(){

		//重置区域偏好
		$scope.areaCurrent = $scope.areas[0];
		$scope.cityCurrent = null;
		//重置户型偏好
		$scope.layoutCurrent = $scope.layouts[0];
		//重置面积偏好
		$scope.acreageCurrent = $scope.acreages[0];
		//重置产品偏好
		$scope.productCurrent = $scope.products[0];
		//重置总价偏好
		$scope.totalPriceCurrent = $scope.totalPrices[0];
		//重置类别偏好
		$scope.categoryCurrent = $scope.categorys[0];

		$scope.toStep2 = false;//重置没有到第二步
		$scope.toStep3 = false;//重置没有到第三步
	}

	//获取区域范围
	//getAreaCoverage
	//console.dir(investmentCustomerServices);
	$scope.getCoverage = function(){
		investmentCustomerServices.getCoverage({}, function(response, status){

			//区域偏好
			$scope.areas = response.areas;
			$scope.areaCurrent = $scope.areas[0];
			//户型偏好
			$scope.layouts = response.layouts;
			$scope.layoutCurrent = $scope.layouts[0];
			//面积偏好
			$scope.acreages = response.acreages;
			$scope.acreageCurrent = $scope.acreages[0];
			//产品偏好
			$scope.products = response.products;
			$scope.productCurrent = $scope.products[0];
			//总价偏好
			$scope.totalPrices = response.totalPrices;
			$scope.totalPriceCurrent = $scope.totalPrices[0];
			//类别偏好
			$scope.categorys = response.categorys;
			$scope.categoryCurrent = $scope.categorys[0];


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
	}

	//城市切换
	$scope.changeCity = function(city){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.cityCurrent = city;
	}


	//户型偏好切换
	$scope.changeLayout = function(layout){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.layoutCurrent = layout;
	}

	//面积偏好切换
	$scope.changeAcreage = function(acreage){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.acreageCurrent = acreage;
	}

	//产品偏好切换
	$scope.changeProduct = function(product){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.productCurrent = product;
	}

	//总价偏好切换
	$scope.changeTotalPrice = function(totalPrice){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.totalPriceCurrent = totalPrice;
	}

	//类别偏好切换
	$scope.changeCategory = function(category){
		if($scope.toStep2){
			return;//如果已经去到下一步，点击无效
		}
		$scope.categoryCurrent = category;
	}

	


	




	$scope.nextStep = function(){
		if($scope.areaCurrent.value == "-1" && $scope.layoutCurrent.value == "-1" && $scope.acreageCurrent.value == "-1" && $scope.productCurrent.value == "-1" && $scope.totalPriceCurrent.value == "-1" && $scope.categoryCurrent.value == "-1"){
			new w.Window().alert({
    			title: "温馨提示",
    			width: 300,
    			height: 160,
    			content: '请至少选择一个范围',
    			hasCloseBtn: true
    		});
			return;
		}
		if($scope.toStep2){
			//如果已经点了下一步，点击无效
			return;
		}
		$scope.getFetchData({
			area: $scope.areaCurrent,
			city: $scope.cityCurrent,
			layout: $scope.layoutCurrent,
			acreage: $scope.acreageCurrent,
			product: $scope.productCurrent,
			totalPrice: $scope.totalPriceCurrent,
			category: $scope.categoryCurrent
		});
		//$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");
		//$scope.toStep2 = true;
		//console.log($("#step2").offset().top);
	}



	//获取数据

	$scope.getFetchData = function(info){
		investmentCustomerServices.getFetchData(info, function(response, status){

			//默认全选提取项
			$scope.dataModalName = true;
			$scope.dataModalTel = true;
			$scope.dataModalEmail = true;
			$scope.dataModalAddress = true;


			$scope.fetchDataTotal = 200,
			$scope.fetchDataFilter = parseInt($scope.fetchDataTotal/10*3);

			$scope.persons = response.list;
			$scope.toStep2 = true;//表示已经进入了第二步
			$scope.toStep3 = true;//表示已经进入了第三步
			$("html,body").animate({"scrollTop": $("#step1").offset().top + $("#step1").outerHeight()/3}, "fast");

		}, function(response, status){
			toastr.warning('获取数据失败', '提示', {
				closeButton: true,
				timeOut: 5000
			});
		})
	}


	//监测fetchDataFilter，如果大于fetchDataTotal。则设置成等于
	$scope.$watch('fetchDataFilter', function(fetchDataFilter, oldValue){
		//console.log("y:" + y);
		if(/^(\d+)/.test(fetchDataFilter)){
			$scope.fetchDataFilter = RegExp.$1;
		}else if(/^(\D+)$/.test(fetchDataFilter)){
			$scope.fetchDataFilter = 0;
		}
		if(fetchDataFilter > $scope.fetchDataTotal){
			$scope.fetchDataFilter = $scope.fetchDataTotal;
		}
	})

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

