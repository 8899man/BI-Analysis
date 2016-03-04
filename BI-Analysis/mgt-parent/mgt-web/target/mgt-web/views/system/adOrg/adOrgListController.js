"use strict";

define(['app', 'window', 'jquery', 'adOrgService', 'toastr'], function (app, w, $) {

	app.register.controller('adOrgListController', [
			'$location',
			'$modal',
			'$log',
			'$filter',
			'$scope',
			'$rootScope',
			'$document',
			'adOrgService',
			'toastr',
			function($location, $modal, $log, $filter, $scope, $rootScope,
					 $document, adOrgService, toastr) {
				$scope.initializeController = function() {
					$scope.searchTxt = "";
					$scope.pageSize = 20;
					$scope.stateMap = adOrgService.stateMap;
					$scope.checkMap = adOrgService.checkMap;
					$scope.currentPage = 1;
					$scope.TotalRows = 0;
					
					$scope.getOrgTree();
					
					$scope.AdOrgs = [];
					$scope.getAdOrgs(null);
					$scope.FileUpload;
				}

				$scope.getOrgTree = function() {
					adOrgService.getOrgTree(null, $scope.getOrgTreeCompleted,
							function(){});
				}
				
				$scope.getOrgTreeCompleted=function(response, status){
					if (status == 200) {
						var orgList= adOrgService.treeToList(response);
						adOrgService.setOrgList(orgList);
						$scope.orgMap = adOrgService.orgMap;
					}
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

				$scope.getAdOrgs = function(pageNumber) {
					var adOrg = $scope.createSearchObject(pageNumber);
					adOrgService.getAdOrgs(adOrg, $scope.getAdOrgsCompleted,
							$scope.getAdOrgsError);
				}

				$scope.enter = function(ev) { 
					if (ev.keyCode !== 13) {
					  return; 
					}
					$scope.getAdOrgs('search');
				}

				$scope.getAdOrgsCompleted = function(response, status) {

					if (response.header.code == 0) {
						$scope.AdOrgs = response.data;
	
					}
				}

				$scope.getAdOrgsError = function(response, status) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}


				$scope.pageChanged = function() {
					$scope.getAdOrgs(null);
				}



				var addModalInstanceCtrl = function($scope, $modalInstance) {
					$scope.HeaderText = "新增";
					$scope.adOrgModal = {};
					$scope.adOrgModal.adOrgType = 1;
					$scope.adOrgTypeList = adOrgService.adOrgTypeList;

					$scope.ok = function() {
						$modalInstance.close($scope.adOrgModal);
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

					modalInstance.result.then(function(adOrg) {
						adOrgService.createAdOrg(adOrg, $scope.editAdOrgCompleted,
								$scope.editAdOrgError);
					}, function() {
						// $log.info('Modal dismissed at: ' + new Date());
					});
				};

				var editModalInstanceCtrl = function($scope, $modalInstance,
						adOrg) {

					$scope.HeaderText = "修改";

					$scope.stateList = adOrgService.stateList;
					$scope.checkList = adOrgService.checkList;
$scope.orgList = adOrgService.orgList;
					$scope.adOrgModal = adOrg;

					$scope.ok = function() {
						var adOrg = new Object();
						$modalInstance.close($scope.adOrgModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};

				$scope.editModal = function(id) {
					adOrgService.getAdOrg({
						"adGuid" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'editModal.html',
								controller : editModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									adOrg : function() {
										return response.data;
									}
								}
							});
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(adOrg) {
							adOrgService.updateAdOrg(adOrg,
									$scope.editAdOrgCompleted,
									$scope.editAdOrgError);
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					})
				};
				
				
				

				$scope.editAdOrgCompleted = function(response) {
					if (response.header.code == 0) {
						$scope.getAdOrgs(null);
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

				$scope.editAdOrgError = function(response) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}



		   	   var checkModalInstanceCtrl = function($scope, $modalInstance,
						adOrg) {

					$scope.HeaderText = "审批";


					$scope.orgList = adOrgService.orgList;

					$scope.adOrgModal = adOrg;

					$scope.ok = function() {
						var adOrg = new Object();
						$modalInstance.close($scope.adOrgModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};

				$scope.checkModal = function(id) {
					adOrgService.getAdOrg({
						"adGuid" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'checkModal.html',
								controller : checkModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									adOrg : function() {
										return response.data;
									}
								}
							});
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(adOrg) {
							adOrgService.checkAdOrg(adOrg,
									$scope.checkAdOrgCompleted,
									$scope.checkAdOrgError);
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					})
				};
				
				$scope.checkAdOrgCompleted = function(response) {
					if (response.header.code == 0) {
						$scope.getAdOrgs(null);
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

				$scope.checkAdOrgError = function(response) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}


				$scope.deleteOne = function(adGuid) {
					if (confirm("确定要删除?")) {
						adOrgService.deleteAdOrg({
							"adGuid" : adGuid
						}, $scope.editAdOrgCompleted, $scope.editAdOrgError);
					}
				}

				$scope.exportExcel = function() {
					var searchvo = $scope.createSearchObject(null);
					adOrgService.exportAdOrg(searchvo);
				}

			} ]);
});
