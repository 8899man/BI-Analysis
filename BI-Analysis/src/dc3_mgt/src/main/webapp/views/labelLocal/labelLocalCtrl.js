define(['app', 'window', 'jquery', 'labelLocalServices', 'toastr'], function (app, w, $) {
  //console.dir(app);
  app.register.controller('LabelLocalController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'labelLocalServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, labelLocalServices, toastr) {
    $scope.initializeController = function () {

      $scope.hasGetConditions = false;//初始化默认没有加载属性列表

      $scope.getList();
    }

    //获取列表数据
	$scope.getList = function(){
		labelLocalServices.getList({"lableKey":"1"}, $scope.getListSuccess, $scope.getListError);
	};

	$scope.getListSuccess = function(response){
		
		$scope.initShow = true;
		$scope.lableList = response.data;
	};

	$scope.getListError = function(response, status){
		toastr.warning('获取数据失败', '提示', {
			closeButton: true,
			timeOut: 5000
		});
	};


	//显示已选条件
	$scope.shoSelectedModal = function (id) {
		labelLocalServices.getStorageConditions({
			"id":id, "lableKey":"1"
		},function(response){
			if(response.header.code == 0){
				var modalInstance = $modal.open({
					templateUrl: 'showSelectedModal.html',
					controller: showSelectedInstanceCtrl,
					windowClass: 'app-modal-window',
					resolve: {
						label: function () {
							return response.data;
						}
					}
				});
			} else{
				alert(response.header.message);
			}
		}, function(){
			
		});
	};


	var showSelectedInstanceCtrl = function ($scope, $modalInstance, label) {
		$scope.labelsSelected = label;
		if(label != null && label.length > 0){
			$scope.labelAttr = label[0].labelAttr;
		}
		
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
		};
	};


    //显示提取数据模态
    var dataModalOpened = {};//已经打开过的模态关联到这个对象上
    $scope.getDataModal = function (label) {
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
        $scope.labelAttr = data.label.title;
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
    		labelLocalServices.getConditions({"info": "1"}, $scope.getConditionsSuccess, $scope.getConditionsError)
    	}
    }


    //选择删除
    $scope.selectDelete = function(){
        $scope.deleteNow = !$scope.deleteNow;

        //清空上次的选择项
        angular.forEach($scope.lableList, function(label, index){
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
        angular.forEach($scope.lableList, function(label, index){
            if(label.hasAddDelete){
                hasAddedLabel = true;
            }
        })
        $scope.hasAddedLabel = hasAddedLabel;

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
                labelLocalServices.deleteAllLabels({"ids":"","lableKey":1}, function(response){
                    //删除所有成功回调事件
                	$scope.getList();
                	toastr.success('删除全部成功', '提示', {
                        closeButton: true,
                        timeOut: 5000
                    });
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
        angular.forEach($scope.lableList, function(label, index){
            if(label.hasAddDelete){
                deleteIds.push(label.id);
            }
        });
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
            	var ids = "";
            	for(var i = 0;i < deleteIds.length;i++){
            		ids += deleteIds[i] + ",";
            	}
            	ids = ids.substring(0, ids.length - 1);
                labelLocalServices.deleteAddedLabels({"ids": ids,"lableKey":1}, function(response){
                    //删除所有成功回调事件
                	/*
                    for(var i=$scope.lableList.length-1; i>=0; i--){
                        for(var j=0, len=deleteIds.length; j<len; j++){
                            if($scope.lableList[i] && $scope.lableList[i]['id'] === deleteIds[j]){
                                $scope.lableList.splice(i, 1);
                            }
                        }
                    }
                    */
                	$scope.getList();
                	toastr.success('删除数据成功', '提示', {
                        closeButton: true,
                        timeOut: 5000
                    });
                    $scope.hasAddedLabel = false;
                    
                }, function(response, status){
                    toastr.warning('获取数据失败', '提示', {
                        closeButton: true,
                        timeOut: 5000
                    });
                    $scope.hasAddedLabel = false;
                    $scope.getList();
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
		$scope.hasGetConditions = true;//表示已经获取了条件列表
		//$scope.labelList = response.list;
		//$scope.labelNumber = response.TotalRows
		$scope.conditionCommon = response.data.conditionCommon.children[0].children[0];
		$scope.intentClient = response.data.intentClient.children[0].children[0];
		$scope.investClient = response.data.investClient.children[0].children[0];
		$scope.selfLiveClient = response.data.selfLiveClient.children[0].children[0];
		$scope.toLiveClient = response.data.toLiveClient.children[0].children[0];
		$scope.loseClient = response.data.loseClient.children[0].children[0];
		//console.log($scope.conditionCommon);

		//设置初始默认值
		angular.forEach([$scope.conditionCommon, $scope.intentClient, $scope.investClient, $scope.selfLiveClient, $scope.toLiveClient, $scope.loseClient], function(sort, index){
			angular.forEach(sort.children, function(c, indexOption){
				//console.dir(c);
				//console.log(c["options"][0]);
				if(c.children && c.children.length>0){
					$scope[c.value.model] = c.children[0].value.optionsvalue;
				}
				
				//console.log("cccccccccc");
				//console.dir(c);
				if(c.hasSubs){
					//如果当前属性值有二级菜单，则设置默认二级为不限
					//console.log(111111);
					$scope[c.value.model + "SubModel"] = "-1";
				}
				
				/*
				if(index == 0 && indexOption == sort.children.length-1){
					//直接把标签属性设置到已选条件中
					$scope.conditionSelected.push({
						rootTitle: sort.value.rootTitle,
			    		supTitle: sort.value.supTitle,
			    		showSupTitle: sort.value.showSupTitle,
			    		model: c.value.model,
			    		title: c.value.title,
			    		optionName: c.children[0].value.optionsname,
			    		optionValue: c.children[0].value.optionsvalue
			    	})
				}*/
			});

		})

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




    //添加选择条件
    $scope.setSelected = function(event, model, title, option, rootTitle, supTitle, showSupTitle, sub){

    	var $ele = $(event.target);

    	if($ele.hasClass("active")){
    		//如果是选中状态直接返回
    		return;
    	}


    	if(sub){
    		//如果点击的是二级选择
    		//console.dir(sub);
    		$scope[model + "SubModel"] = sub.value.subsname;
    		if(sub.value.subsvalue != "-1"){
    			//如果不是不限，则需要修改已选条件中名字
    			angular.forEach($scope.conditionSelected, function(c, index){
    				if(c.model == model){
    					c.subTitle = sub.value.subsname;
    				}
    			});
    		}else{
    			//如果不是不限，则需要修改已选条件中名字
    			angular.forEach($scope.conditionSelected, function(c, index){
    				if(c.model == model){
    					delete c.subTitle
    				}
    			});
    		}
    		return;
    	}


    	

    	var obj = {
    		rootTitle: rootTitle,
    		supTitle: supTitle,
    		showSupTitle: showSupTitle,
    		model: model,
    		title: title,
    		optionName: option.value.optionsname,
    		optionValue: option.value.optionsvalue
    	}

    	$scope[model] = option.value.optionsvalue;

    	//如果有子集需要设置子集
		if(option.children && option.children.length > 0){
			$scope[model + "Subs"] = option.children;
			//重置子集为不限
			$scope[model + "SubModel"] = "-1";
		}else if(showSupTitle){
			$scope[model + "Subs"] = [];
		}

    	//遍历是否已经有了当前选择
    	var hasAdded = false;//默认未添加
    	angular.forEach($scope.conditionSelected, function(c, index){
    		if(c.model === obj.model){
    			if(option.value.optionsvalue == "-1"){
    				$scope.conditionSelected.splice(index, 1);
    			}else{
    				$scope.conditionSelected.splice(index, 1);
    				$scope.conditionSelected.splice(index, 0, obj);
    			}
    			hasAdded = true;
    		}
    	})
    	if(!hasAdded){
    		$scope.conditionSelected.push(obj);
    		//console.log(option)
    	}
    	
    };






    //切换客户特征tab
    $scope.changeClientTab = function(event){
    	var $ele = $(event.target);
    	if($ele.hasClass("active")){
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
				$scope[$scope.conditionSelected[i].model] = "-1";
				if($.isArray($scope[$scope.conditionSelected[i].model + "Subs"]) && $scope[$scope.conditionSelected[i].model + "Subs"].length > 0){
    				$scope[$scope.conditionSelected[i].model + "Subs"] = [];
    			}
				$scope.conditionSelected.splice(i, 1);
				//恢复到默认值
				//$scope[$scope.conditionSelected[i].model] = "-1";
			}
		}


    }


    //删除选择条件
    $scope.deleteSelected = function(c){
    	/*
    	//{model: model,title: title,optionName: option.name,optionValue: option.value}
    	if(c.title === "标签属性"){
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
    	angular.forEach($scope.conditionSelected, function(condition, index){
    		if(condition === c){
    			$scope.conditionSelected.splice(index, 1);
    			if($.isArray($scope[c.model + "Subs"]) && $scope[c.model + "Subs"].length > 0){
    				$scope[c.model + "Subs"] = [];
    			}
    		}
    	});

    	//重置属性为不限制
    	$scope[c.model] = "-1";

    }


    //重置按钮点击事件
    $scope.reset = function(){
    	angular.forEach($scope.conditionSelected, function(condition, index){
    		if(index !== 0){
    			$scope[condition['model']] = "-1";
    		}else{
    			$scope[condition['model']] = "1";
    			condition.optionName = "时效";
    			condition.optionValue = "1";
    		}
    		//console.log(22222222);
    	});
    	//console.log(111);
    	$scope.conditionSelected = $scope.conditionSelected.slice(0,1);
    	$scope.labelAttr = "";
    	$scope.labelInfo = "";
    }


    //提交按钮事件
    $scope.save = function(){
    	//点击前判断 标签标题 和 标签描述 不能为空
    	if($.trim($scope.labelAttr) === ''){
    		$("#labelAttr").focus();
			$("html,body").animate({"scrollTop": $("#labelAttr").offset().top - 80 + "px"});
    		return;
    	}

    	if($.trim($scope.labelInfo) === ''){
    		$("#labelInfo").focus();
			$("html,body").animate({"scrollTop": $("#labelInfo").offset().top - 80 + "px"});
    		return;
    	}

    	/*console.dir({
    		title: $scope.labelAttr,
    		info: $scope.labelInfo,
    		conditionSelected: $scope.conditionSelected
    	})*/
    	labelLocalServices.saveLabel({"info": JSON.stringify({
    		labelAttr: $scope.labelAttr,
    		info: $scope.labelInfo,
    		lableKey: 1,
    		sys_user_id: 1,
    		conditionSelected: $scope.conditionSelected
    	})}, $scope.saveLabelSuccess, $scope.saveLabelError);
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
//					$scope.lableList.unshift(response);
//					$scope.labelNumber ++;
					
					$scope.getList();
					
					$("#labelAttr").focus();
    				$("html,body").animate({"scrollTop": $("#labelAttr").offset().top - 80 + "px"});
				});
			},
			handler4CancelBtn: function(){
				$scope.$apply(function(){
					//重置表单
					$scope.reset();
//					$scope.lableList.unshift(response);
//					$scope.labelNumber ++;
					
					$scope.getList();
					
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

