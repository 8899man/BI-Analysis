define(['app', 'window', 'jquery', 'labelNetworkServices', 'toastr'], function (app, w, $) {
  //console.dir(app);
  app.register.controller('LabelNetworkController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'labelNetworkServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, labelNetworkServices, toastr) {
//alert(222);
    $scope.initializeController = function () {
      //console.log(1111);
      //console.log(labelNetworkServices);

      $scope.hasGetConditions = false;//初始化默认没有加载属性列表

      $scope.getList();
    }





    //获取列表数据
	$scope.getList = function(){
		labelNetworkServices.getList({}, $scope.getListSuccess, $scope.getListError);
	};


	$scope.getListSuccess = function(response, status){
		$scope.categroyList = response.categroyList;
	};

	$scope.getListError = function(response, status){
		toastr.warning('获取数据失败', '提示', {
			closeButton: true,
			timeOut: 5000
		});
	};



    //显示提取数据模态
    var dataModalOpened = {};//已经打开过的模态关联到这个对象上
    $scope.getDataModal = function (label) {
        //console.dir(label);
        if(typeof dataModalOpened[label.id] != "object"){
            labelNetworkServices.getDataModal(label, function(response, status){
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






	

  }]);
});

