"use strict";

define(['app', 'window', 'jquery', 'bOrgService', 'toastr'], function (app, w, $) {

	app.register.controller('bOrgListController', [
			'$location',
			'$modal',
			'$log',
			'$filter',
			'$scope',
			'$rootScope',
			'$document',
			'bOrgService',
			'toastr',
			function($location, $modal, $log, $filter, $scope, $rootScope,
					 $document, bOrgService, toastr) {
				$scope.initializeController = function() {
					$scope.searchTxt = "";
					$scope.pageSize = 20;
					$scope.subTypeMap = bOrgService.subTypeMap;
					$scope.typeMap = bOrgService.typeMap;
					
					$scope.currentPage = 1;
					$scope.TotalRows = 0;
					$scope.BOrgs = [];
					$scope.getBOrgs(null);
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

				$scope.getBOrgs = function(pageNumber) {
					var bOrg = $scope.createSearchObject(pageNumber);
					bOrgService.getBOrgs(bOrg, $scope.getBOrgsCompleted,
							$scope.getBOrgsError);
				}

				$scope.enter = function(ev) { 
					if (ev.keyCode !== 13) {
					  return; 
					}
					$scope.getBOrgs('search');
				}

				$scope.getBOrgsCompleted = function(response, status) {
					if (response.header.code == 0) {
						$scope.BOrgs =  bOrgService.treeToList(response.data);
						bOrgService.setOrgList($scope.BOrgs);
					}
				}

				$scope.getBOrgsError = function(response, status) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}


				$scope.pageChanged = function() {
					$scope.getBOrgs(null);
				}



				var addModalInstanceCtrl = function($scope, $modalInstance,orgid,subType) {
					$scope.HeaderText = "新增";
					$scope.bOrgModal = {};
					$scope.bOrgModal.parentguid =orgid;
					$scope.bOrgModal.orgtype = 3;
					
					if(subType==1)
					{
						$scope.bOrgModal.subtype = 5;
					}else if(subType=4){
						$scope.bOrgModal.subtype = 4;
					}else if(subType=5){
						$scope.bOrgModal.subtype = 2;
					}else{
						$scope.bOrgModal.subtype = subType+1;
					}
					
					
					$scope.typeList = bOrgService.typeList;
					
					$scope.subTypeList = bOrgService.subTypeList;

					$scope.orgList = bOrgService.orgList;

					

					$scope.ok = function() {
						$modalInstance.close($scope.bOrgModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};
				
				$scope.addModal = function(id,subType) {

					var modalInstance = $modal.open({
						templateUrl : 'addModal.html',
						controller : addModalInstanceCtrl,
						windowClass : 'app-modal-window',
						resolve : {
									orgid: function() {
										return id;
									},
									subType: function() {
										return subType;
									}
						}
					});

					modalInstance.result.then(function(bOrg) {
						bOrgService.createBOrg(bOrg, $scope.editBOrgCompleted,
								$scope.editBOrgError);
					}, function() {
						// $log.info('Modal dismissed at: ' + new Date());
					});
				};

				var editModalInstanceCtrl = function($scope, $modalInstance,
						bOrg) {

					$scope.HeaderText = "修改";

					$scope.typeList = bOrgService.typeList;
					
					$scope.subTypeList = bOrgService.subTypeList;

					$scope.orgList = bOrgService.orgList;

					$scope.bOrgModal = bOrg;

					$scope.ok = function() {
						var bOrg = new Object();
						$modalInstance.close($scope.bOrgModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};

				$scope.editModal = function(id) {
					bOrgService.getBOrg({
						"orgguid" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'editModal.html',
								controller : editModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									bOrg : function() {
										return response.data;
									}
								}
							});
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(bOrg) {
							bOrgService.updateBOrg(bOrg,
									$scope.editBOrgCompleted,
									$scope.editBOrgError);
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					})
				};

				$scope.editBOrgCompleted = function(response) {
					if (response.header.code == 0) {
						$scope.getBOrgs(null);
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

				$scope.editBOrgError = function(response) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}

				$scope.deleteOne = function(orgguid) {
					if (confirm("确定要删除?")) {
						bOrgService.deleteBOrg({
							"orgguid" : orgguid
						}, $scope.editBOrgCompleted, $scope.editBOrgError);
					}
				}

				$scope.exportExcel = function() {
					var searchvo = $scope.createSearchObject(null);
					bOrgService.exportBOrg(searchvo);
				}

			} ]);
});
