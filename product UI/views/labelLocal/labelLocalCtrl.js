define(['app', 'window', 'jquery', 'labelLocalServices', 'toastr'], function (app, w, $) {
  //console.dir(app);
  app.register.controller('LabelLocalController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'labelLocalServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, labelLocalServices, toastr) {
    $scope.initializeController = function () {
      //console.log(1111);
      //console.log(labelLocalServices);

      $scope.hasGetConditions = false;//初始化默认没有加载属性列表

      $scope.getList();
    }





    //获取列表数据
	$scope.getList = function(){
		labelLocalServices.getList({}, $scope.getListSuccess, $scope.getListError);
	};


	$scope.getListSuccess = function(response, status){
		
        //我的标签
		$scope.labelList = response.myLabelList;

        //他人标签
        $scope.othersLabelList = response.othersLabelList;


	};

	$scope.getListError = function(response, status){
		toastr.warning('获取数据失败', '提示', {
			closeButton: true,
			timeOut: 5000
		});
	};


	//显示已选条件
	$scope.shoSelectedModal = function (label) {
		var modalInstance = $modal.open({
			templateUrl: 'showSelectedModal.html',
			controller: showSelectedInstanceCtrl,
			windowClass: 'app-modal-window',
			//size: 'lg',
			resolve: {
				label: function () {
					return label;
				}
			}
		});

		modalInstance.result.then(function () {
				//meetingService.updateMeetInfo(meetInfo, $scope.editMeetInfoLineItemCompleted, $scope.editMeetInfoLineItemError);
			}, function () {
				//$log.info('Modal dismissed at: ' + new Date());
		});
	};


	var showSelectedInstanceCtrl = function ($scope, $modalInstance, label) {
		$scope.labelsSelected = label.conditionSelected;
		$scope.labelTitle = label.title;
		$scope.ok = function () {
		};

		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	};


    //显示提取数据模态
    var dataModalOpened = {};//已经打开过的模态关联到这个对象上
    $scope.getDataModal = function (label) {
        //console.dir(label);
        if(typeof dataModalOpened[label.id] != "object"){
            labelLocalServices.getDataModal(label, function(response, status){
                dataModalOpened[label.id] = {
                    label: label,
                    persons: response
                };
                $scope.getDataModalOpen(dataModalOpened[label.id])
            }, function(response, status){
                toastr.warning('获取数据失败', '提示', {
                    closeButton: true,
                    timeOut: 5000
                });
            });
            return;
        }
        $scope.getDataModalOpen(dataModalOpened[label.id])
        //dataModalOpened[label.id] = {};
    };


    $scope.getDataModalOpen = function(data){
        var modalInstance = $modal.open({
            templateUrl: 'getDataModal.html',
            controller: getDataInstanceCtrl,
            windowClass: 'app-modal-window',
            size: 'lg',
            resolve: {
                data: function () {
                    return data;
                }
            }
        });

        modalInstance.result.then(function () {
                //meetingService.updateMeetInfo(meetInfo, $scope.editMeetInfoLineItemCompleted, $scope.editMeetInfoLineItemError);
            }, function () {
                //$log.info('Modal dismissed at: ' + new Date());
        });
    }


    var getDataInstanceCtrl = function ($scope, $modalInstance, data) {
        //console.log("label");
        //console.log(data);
        $scope.labelTitle = data.label.title;
        $scope.labelId = data.label.id;
        $scope.persons = data.persons;
        $scope.dataModalName = true;
        $scope.dataModalTel = true;
        $scope.dataModalEmail = true;
        $scope.dataModalAddress = true;
        $scope.ok = function (labelId, dataModalName, dataModalTel, dataModalEmail, dataModalAddress) {
            //console.log(labelId)
            //$modalInstance.close();
            //提取代码开发
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
            input2.attr('value', dataModalName);
            var input3 = $('<input>');
            input3.attr('type', 'hidden');
            input3.attr('name', 'dataModalTel');
            input3.attr('value', dataModalTel);
            var input4 = $('<input>');
            input4.attr('type', 'hidden');
            input4.attr('name', 'dataModalEmail');
            input4.attr('value', dataModalEmail);
            var input5 = $('<input>');
            input5.attr('type', 'hidden');
            input5.attr('name', 'dataModalAddress');
            input5.attr('value', dataModalAddress);
            $('body').append(form);  //将表单放置在web中
            form.append(input1);   //将查询参数控件提交到表单上
            form.submit();   //表单提交
            */

        };

        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        };
    };


    //默认显示列表  list显示列表   create显示创建
    $scope.stateShow = "list";

    //显示创建按钮
    $scope.changeShow = function(state){
    	if($scope.stateShow == state){
    		return;
    	}

        $scope.deleteNow = false;

    	$scope.stateShow = state;

    	if(state == "create" && !$scope.hasGetConditions){
    		//ajax请求获取属性列表
    		//console.log(labelLocalServices.getConditions);
    		labelLocalServices.getConditions({}, $scope.getConditionsSuccess, $scope.getConditionsError)
    	}else{
            //重置
            $scope.reset();
        }
    }


    //选择删除
    $scope.selectDelete = function(){
        $scope.deleteNow = !$scope.deleteNow;

        //清空上次的选择项
        angular.forEach($scope.labelList, function(label, index){
            if(label.hasAddDelete){
                delete label.hasAddDelete;
            }
        })
        $scope.hasAddedLabel = false;

    }

    //添加标签到要删除的篮子里
    $scope.addLabelDelete = function(label){
        label.hasAddDelete = !label.hasAddDelete;

        //检查篮子里是否有添加到标签
        var hasAddedLabel = false;
        angular.forEach($scope.labelList, function(label, index){
            if(label.hasAddDelete){
                hasAddedLabel = true;
            }
        })

        $scope.hasAddedLabel = hasAddedLabel;

        //console.log($scope.labelList)
    }

    //删除全部标签按钮方法
    $scope.deleteAll = function(){
        new w.Window().confirm({
            title: "提示",
            hasCloseBtn: true,
            text4ConfirmBtn: "确定删除",
            text4CancelBtn: "取消删除",
            width: 300,
            height: 160,
            content: '您确定删除所有标签?',
            handler4ConfirmBtn: function(){
                //ajax请求删除所有标签
                labelLocalServices.deleteAllLabels({}, function(response){
                    //删除所有成功回调事件
                    $scope.labelList = [];

                }, function(response, status){
                    toastr.warning('获取数据失败', '提示', {
                        closeButton: true,
                        timeOut: 5000
                    });
                })
            },
            handler4CancelBtn: function(){
                //
            }
        });
    }

    //删除所选标签按钮方法
    $scope.deleteAdded = function(){
        var deleteIds = [];
        //把当前选中的id添加到数组deleteIds里
        angular.forEach($scope.labelList, function(label, index){
            if(label.hasAddDelete){
                deleteIds.push(label.id);
            }
        });
        //console.log(deleteIds);
        new w.Window().confirm({
            title: "提示",
            hasCloseBtn: true,
            text4ConfirmBtn: "确定删除",
            text4CancelBtn: "取消删除",
            width: 300,
            height: 160,
            content: '您确定删除所选标签?',
            handler4ConfirmBtn: function(){
                //ajax请求删除所有标签
                labelLocalServices.deleteAddedLabels({"ids": deleteIds}, function(response){
                    //删除所有成功回调事件
                    //$scope.labelList = [];
                    for(var i=$scope.labelList.length-1; i>=0; i--){
                        for(var j=0, len=deleteIds.length; j<len; j++){
                            if($scope.labelList[i] && $scope.labelList[i]['id'] === deleteIds[j]){
                                $scope.labelList.splice(i, 1);
                            }
                        }
                    }
                    $scope.hasAddedLabel = false;
                }, function(response, status){
                    toastr.warning('获取数据失败', '提示', {
                        closeButton: true,
                        timeOut: 5000
                    });
                })
            },
            handler4CancelBtn: function(){
                //
            }
        });
    }

    //$scope.changeShow("create");
    /*$timeout(function(){
    	$("#btnCreate").trigger("click");
    },500)*/

    //获取条件成功回调
    $scope.getConditionsSuccess = function(response, status){
        //console.log(2222)
		$scope.hasGetConditions = true;//表示已经获取了条件列表
		//$scope.labelList = response.list;
		$scope.conditionCommon = response.conditionCommon;
		$scope.intentClient = response.intentClient;
		$scope.investClient = response.investClient;
		$scope.selfLiveClient = response.selfLiveClient;
		$scope.toLiveClient = response.toLiveClient;
		$scope.loseClient = response.loseClient;
		

	};
	//获取条件失败回调
	$scope.getConditionsError = function(response, status){
		toastr.warning('获取数据失败', '提示', {
			closeButton: true,
			timeOut: 5000
		});
	};


	//通过字符串获取$scope上的属性值
	$scope.getScope = function(key){
		return $scope[key];
	}



	


    //创建过程中保存已选条件
    $scope.conditionSelected = [];




    //添加选择条件[一级选择]
    $scope.setSelected = function(conditionCategory, c, option){

        //如果选择的是"不限"
        if(option.value == "-1"){
            angular.forEach(c.options, function(item, index){
                if(item.value == "-1"){
                    item.checked = true;
                }else{
                    item.checked = false;
                    //如果里面有子集，则重置子集选项
                    if(angular.isArray(item.subs) && item.subs.length>0){
                        angular.forEach(item.subs, function(sub, index){
                            if(sub.value == "-1"){
                                sub.checked = true;
                            }else{
                                sub.checked = false;
                            }
                        })
                    }
                }
            })
            //如果有子集，则清空子集
            if(c.hasSubs){
                $scope[c.model + "Subs"] = [];
            }
        }else{
            option.checked = !option.checked;

            

            //如果是有二级的
            if(c.hasSubs){
                angular.forEach(c.options, function(item, index){
                    if(item != option){
                        //console.log(1111111);
                        item.checked = false;
                        angular.forEach(item.subs, function(sub, index){
                            if(sub.value == "-1"){
                                sub.checked = true;
                            }else{
                                sub.checked = false;
                            }
                        })
                    }else{
                        //console.log(222222222);
                    }
                });
            }

            //当已经没有任何选择的时候，则设置成不限
            var arrChecked = [];
            angular.forEach(c.options, function(item, index){
                if(item.checked){
                    arrChecked.push(item);
                }
            });


            angular.forEach(c.options, function(item, index){
                if(item.value == "-1"){
                    if(arrChecked.length == 0){
                        item.checked = true;
                        //清空当前model的二级选项
                        if(c.hasSubs){
                            $scope[c.model + "Subs"] = [];
                            //console.log(222222222222222333);
                            //console.dir(c);
                            angular.forEach(c.options, function(option, index){
                                if(angular.isArray(option.subs)){
                                    angular.forEach(option.subs, function(sub, index){
                                        if(sub.value == "-1"){
                                            sub.checked = true;
                                        }else{
                                            sub.checked = false;
                                        }
                                    })
                                }
                            })
                        }
                    }else{
                        item.checked = false;
                    }
                }
            });
        }


        //如果有子集需要设置子集
        if(option.subs && option.subs.length > 0 && option.checked){
            $scope[c.model + "Subs"] = option.subs;
        }

        //设置已修改条件
        $scope.updateSelected({
            rootTitle: conditionCategory.rootTitle,
            supTitle: conditionCategory.supTitle,
            showSupTitle: conditionCategory.showSupTitle,
            model: c.model,
            condition:c
        });
    	
    };

    //添加选择条件[二级选择]
    $scope.setSelectedSub = function(conditionCategory, c, option){
        option.checked = !option.checked;
        /*console.dir(conditionCategory);
        console.dir(c);
        console.dir(option);
        console.dir($scope[c.model + "Subs"]);*/

        /*//是否选择了不限
        var hasSelectedUnlimited = false;
        angular.forEach($scope[c.model + "Subs"], function(item, index){
            if(item.value == "-1"){
                if(item.checked){
                    hasSelectedUnlimited = true;
                }
            }
        });
        if(hasSelectedUnlimited){
            angular.forEach($scope[c.model + "Subs"], function(item, index){
                if(item.value != "-1"){
                    item.checked = false;
                }
            });
        }*/
        if(option.value == "-1"){
            angular.forEach($scope[c.model + "Subs"], function(item, index){
                if(item.value == "-1"){
                    item.checked = true;
                }else{
                    item.checked = false;
                }
            });
        }else{
            var selectedChecked = [];
            angular.forEach($scope[c.model + "Subs"], function(item, index){
                if(item.value == "-1"){
                    item.checked = false;
                }else{
                    if(item.checked){
                        selectedChecked.push(item)
                    }
                }
            });
            if(selectedChecked.length==0){
                angular.forEach($scope[c.model + "Subs"], function(item, index){
                    if(item.value == "-1"){
                        item.checked = true;
                    }
                });
            }
        }
    }


    $scope.updateSelected = function(option){
        //$scope.conditionSelected
        //console.log($scope.conditionSelected);

        //首先检验option的condition的不限是否选中
        var hasSelectedUnlimited = false;
        angular.forEach(option.condition.options, function(o, index){
            if(o.value === "-1"){
                hasSelectedUnlimited = o.checked;
            }
        });

        if(hasSelectedUnlimited){
            angular.forEach($scope.conditionSelected, function(item, index){
                if(option.model === item.model){
                    $scope.conditionSelected.splice(index, 1);
                }
            });
        }else{
            var hasAdded = false;//是否已经存在
            angular.forEach($scope.conditionSelected, function(item, index){
                if(option.model === item.model){
                    hasAdded = true;
                }
            });
            if(!hasAdded){
                $scope.conditionSelected.push(option);
            }
        }

        //console.dir(option);

        
    }



    //获取已选条件的内容
    $scope.getSelectedMessage = function(c){
        //console.dir(c);
        //return "1111";
        var arr = [];
        var str = "";
        for(var i=0, len=c.condition.options.length; i<len; i++){
            if(c.condition.options[i].checked){
                arr.push(c.condition.options[i].name)
            }
            //arr.push(c.subTitle?(c.condition.options[i].name + ' + ' + c.subTitle):c.condition.options[i].name)
        }
        if(angular.isArray($scope[c.model + "Subs"])){

            var selected = [];
            angular.forEach($scope[c.model + "Subs"], function(sub, index){
                if(sub.value != "-1"){
                    if(sub.checked){
                        selected.push(sub.name);
                    }
                }
            })
            if(selected.length > 0){
                str = selected.join("，")
            }else{
                str = arr.join("，")
            }
            
        }else{
            str = arr.join("，");
        }
        return str;
    }






    //切换客户特征tab
    $scope.changeClientTab = function(event){
    	var $ele = $(event.target);
    	if($ele.closest("li").hasClass("active")){
    		return;
    	}
    	//在已选条件里过滤掉客户特征
    	//console.log($scope.conditionSelected);
    	/*angular.forEach($scope.conditionSelected, function(c, index){
    		if(c.rootTitle == "客户特征"){
    			//console.log("dele")
    			$scope.conditionSelected.splice(index, 1);
    			//恢复到默认值
    			$scope[c.model] = "-1";
    		}
    	});*/

		for(var i=$scope.conditionSelected.length-1; i>=0; i--){
			if($scope.conditionSelected[i].rootTitle == "客户特征"){
				//$scope[$scope.conditionSelected[i].model] = "-1";
				if($.isArray($scope[$scope.conditionSelected[i].model + "Subs"]) && $scope[$scope.conditionSelected[i].model + "Subs"].length > 0){
    				$scope[$scope.conditionSelected[i].model + "Subs"] = [];
    			}
				$scope.conditionSelected.splice(i, 1);
				//恢复到默认值
				//$scope[$scope.conditionSelected[i].model] = "-1";
			}
		}

        //置回客户特征所有选择
        $scope.setBack($scope.intentClient.list);
        $scope.setBack($scope.investClient.list);
        $scope.setBack($scope.selfLiveClient.list);
        $scope.setBack($scope.toLiveClient.list);
        $scope.setBack($scope.loseClient.list);


    }

    //置回选项
    $scope.setBack = function(list){
        angular.forEach(list, function(item, index){
            angular.forEach(item.options, function(option, index){
                if(option.value == "-1"){
                    option.checked = true;
                }else{
                    option.checked = false;
                    if(angular.isArray(option.subs)){
                        angular.forEach(option.subs, function(sub, index){
                            if(sub.value == "-1"){
                                sub.checked = true;
                            }else{
                                sub.checked = false;
                            }
                        })
                    }
                }
            })
        })
    }


    //删除选择条件
    $scope.deleteSelected = function(c){
    	//{model: model,title: title,optionName: option.name,optionValue: option.value}
    	/*if(c.title === "标签属性"){
    		new w.Window().alert({
    			title: "温馨提示",
    			width: 300,
    			height: 160,
    			content: '你好，已选条件"标签属性"不能删除',
    			hasCloseBtn: true
    		});
    		return;
    	}*/

    	//删除本身
    	angular.forEach($scope.conditionSelected, function(cs, index){
    		if(cs.condition.model === c.model){
                angular.forEach(cs.condition.options, function(option, index){
                    if(option.value === "-1"){
                        option.checked = true;
                    }else{
                        option.checked = false;
                    }
                })

    			$scope.conditionSelected.splice(index, 1);
    			if($.isArray($scope[c.model + "Subs"]) && $scope[c.model + "Subs"].length > 0){
    				$scope[c.model + "Subs"] = [];
    			}
    		}
    	});

    	//重置属性为不限制
    	//$scope[c.model] = "-1";

    }


    //重置按钮点击事件
    $scope.reset = function(){
    	angular.forEach($scope.conditionSelected, function(condition, index){
    	
            if(condition.showSupTitle){
                //如果有子集，则清空子集
                $scope[condition['model'] + "Subs"] = [];
            }
    		//console.log(22222222);
    	});
    	//console.log(111);
    	$scope.conditionSelected = [];
    	$scope.labelTitle = "";
    	$scope.labelInfo = "";

        //置回客户特征所有选择
        $scope.setBack($scope.conditionCommon.list);
        $scope.setBack($scope.intentClient.list);
        $scope.setBack($scope.investClient.list);
        $scope.setBack($scope.selfLiveClient.list);
        $scope.setBack($scope.toLiveClient.list);
        $scope.setBack($scope.loseClient.list);
    }


    //提交按钮事件
    $scope.save = function(){
    	//点击前判断 标签标题 和 标签描述 不能为空
    	if($.trim($scope.labelTitle) === ''){
    		$("#labelTitle").focus();
			$("html,body").animate({"scrollTop": $("#labelTitle").offset().top - 80 + "px"});
    		return;
    	}

    	if($.trim($scope.labelInfo) === ''){
    		$("#labelInfo").focus();
			$("html,body").animate({"scrollTop": $("#labelInfo").offset().top - 80 + "px"});
    		return;
    	}

        //如果选择条件为空，则提示先选择条件
        if($scope.conditionSelected.length === 0){
            new w.Window().alert({
                title: "温馨提示",
                width: 300,
                height: 160,
                content: '你好，请先选择条件',
                hasCloseBtn: true
            });
            return;
        }

    	/*console.dir({
    		title: $scope.labelTitle,
    		info: $scope.labelInfo,
    		conditionSelected: $scope.conditionSelected
    	})*/
    	labelLocalServices.saveLabel({
    		title: $scope.labelTitle,
    		info: $scope.labelInfo,
    		conditionSelected: $scope.conditionSelected
    	}, $scope.saveLabelSuccess, $scope.saveLabelError);
    }



	$scope.saveLabelSuccess = function(response, status){
		

		//$scope.labelList = response.list;
		//提示继续参建，还是返回列表
		new w.Window().confirm({
			title: "提示",
			text4ConfirmBtn: "继续创建",
			text4CancelBtn: "返回列表",
			width: 300,
			height: 160,
			content: '成功创建标签，是否继续创建新的标签',
			handler4ConfirmBtn: function(){
				$scope.$apply(function(){
					//重置表单
					$scope.reset();
					$scope.labelList.unshift(response);
					$("#labelTitle").focus();
    				$("html,body").animate({"scrollTop": $("#labelTitle").offset().top - 80 + "px"});
				});
			},
			handler4CancelBtn: function(){
				$scope.$apply(function(){
					//重置表单
					$scope.reset();
					$scope.labelList.unshift(response);
					//console.log($scope.labelList.length);
					$scope.stateShow = "list";//显示出列表页
				});
			}
		});

	};

	$scope.saveLabelError = function(response, status){
		toastr.warning('获取数据失败', '提示', {
			closeButton: true,
			timeOut: 5000
		});
	};



	

  }]);
});

