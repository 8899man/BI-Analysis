define(['app', 'window', 'jquery', 'functionService', 'toastr'], function (app, w, $) {

	app.register.controller('functionListController', [
			'$location',
			'$modal',
			'$log',
			'$filter',
			'$scope',
			'$rootScope',
			'$document',
			'functionService',
			'toastr',
			function($location, $modal, $log, $filter, $scope, $rootScope,
					 $document, functionService, toastr) {
				$scope.initializeController = function() {
					$scope.searchTxt = "";
					$scope.pageSize = 20;
					$scope.functionStateMap = functionService.functionStateMap;
					$scope.currentPage = 1;
					$scope.TotalRows = 0;
					

					$scope.functions = [];
					$scope.getFunctions(null);
					$scope.FileUpload;
				}

				$scope.createSearchObject = function(search) {
					var searchVo = new Object();
					if (search != null)
						searchVo.currentPage = 1;
					else
						searchVo.currentPage = $scope.currentPage;
						
					searchVo.pageSize = $scope.pageSize;
					searchVo.searchTxt = $scope.searchTxt;
					
					return searchVo;
				}

				$scope.getFunctions = function(pageNumber) {
					var sysFunction = $scope.createSearchObject(pageNumber);
					functionService.getFunctions(sysFunction, $scope.getFunctionsCompleted,
							$scope.getFunctionsError);
				}

				$scope.enter = function(ev) { 
					if (ev.keyCode !== 13) {
					  return; 
					}
					$scope.getFunctions('search');
				}

				$scope.getFunctionsCompleted = function(response, status) {

					if (response.header.code == 0) {
						$scope.functions = response.data;

					}
				}

				$scope.getFunctionsError = function(response, status) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}


				$scope.pageChanged = function() {
					$scope.getFunctions(null);
				}



				var addModalInstanceCtrl = function($scope, $modalInstance) {
					$scope.HeaderText = "新增";
					$scope.sysFunctionModal = {};
					$scope.sysFunctionModal.functionState = 1;
					$scope.functionStateList = functionService.functionStateList;

					$scope.ok = function() {
						$modalInstance.close($scope.sysFunctionModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};
				
				$scope.addModal = function() {

					var modalInstance = $modal.open({
						templateUrl : 'addModal.html',
						controller : addModalInstanceCtrl,
						windowClass : 'app-modal-window'
					});

					modalInstance.result.then(function(sysFunction) {
						functionService.createFunction(sysFunction, $scope.editFunctionCompleted,
								$scope.editFunctionError);
					}, function() {
						// $log.info('Modal dismissed at: ' + new Date());
					});
				};

				var editModalInstanceCtrl = function($scope, $modalInstance,
						sysFunction) {

					$scope.HeaderText = "修改";

					$scope.functionStateList = functionService.functionStateList;

					

					$scope.sysFunctionModal = sysFunction;

					$scope.ok = function() {
						var sysFunction = new Object();
						$modalInstance.close($scope.sysFunctionModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};

				$scope.editModal = function(id) {
					functionService.getFunction({
						"functionId" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'editModal.html',
								controller : editModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									sysFunction : function() {
										return response.data;
									}
								}
							});
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(sysFunction) {
							functionService.updateFunction(sysFunction,
									$scope.editFunctionCompleted,
									$scope.editFunctionError);
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					})
				};

				$scope.editFunctionCompleted = function(response) {
					if (response.header.code == 0) {
						$scope.getFunctions(null);
						toastr.success(response.header.message, '提示', {
							closeButton : true,
							timeOut : 2000
						});
					} else {
						toastr.warning(response.header.message, '提示', {
							closeButton : true,
							timeOut : 3000
						});
					}
				}

				$scope.editFunctionError = function(response) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}

				$scope.deleteOne = function(functionId) {
					if (confirm("确定要删除?")) {
						functionService.deleteFunction({
							"functionId" : functionId
						}, $scope.editFunctionCompleted, $scope.editFunctionError);
					}
				}

				$scope.exportExcel = function() {
					var searchvo = $scope.createSearchObject(null);
					functionService.exportFunction(searchvo);
				}

			} ]);
});
