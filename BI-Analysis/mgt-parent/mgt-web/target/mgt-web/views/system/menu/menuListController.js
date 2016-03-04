define(['app', 'window', 'jquery', 'menuService', 'toastr'], function (app, w, $) {

	app.register.controller('menuListController', [
			'$location',
			'$modal',
			'$log',
			'$filter',
			'$scope',
			'$rootScope',
			'$document',
			'menuService',
			'toastr',
			function($location, $modal, $log, $filter, $scope, $rootScope,
					 $document, menuService, toastr) {
				$scope.initializeController = function() {
					$scope.searchTxt = "";
					$scope.pageSize = 20;
					$scope.menuStateMap = menuService.menuStateMap;
					$scope.currentPage = 1;
					$scope.TotalRows = 0;
					

					$scope.menus = [];
					$scope.getMenus(null);
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

				$scope.getMenus = function(pageNumber) {
					var sysMenu = $scope.createSearchObject(pageNumber);
					menuService.getMenus(sysMenu, $scope.getMenusCompleted,
							$scope.getMenusError);
				}

				$scope.enter = function(ev) { 
					if (ev.keyCode !== 13) {
					  return; 
					}
					$scope.getMenus('search');
				}

				$scope.getMenusCompleted = function(response, status) {

					if (response.header.code == 0) {
						$scope.menus = response.data;

					}
				}

				$scope.getMenusError = function(response, status) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}


				$scope.pageChanged = function() {
					$scope.getMenus(null);
				}



				var addModalInstanceCtrl = function($scope, $modalInstance,id,levlel) {
					$scope.HeaderText = "新增";
					$scope.sysMenuModal = {};
					$scope.sysMenuModal.menuState = 1;
					$scope.sysMenuModal.parentId = id;
					$scope.sysMenuModal.menuLevel = levlel+1;
					
					$scope.menuTargetList = menuService.menuTargetList;

					$scope.ok = function() {
						$modalInstance.close($scope.sysMenuModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};
				
				$scope.addModal = function(id,levlel) {

					var modalInstance = $modal.open({
						templateUrl : 'addModal.html',
						controller : addModalInstanceCtrl,
						windowClass : 'app-modal-window',
						resolve : {
									id : function() {
										return id;
									},
									levlel : function() {
										return levlel;
									}
								}
					});

					modalInstance.result.then(function(sysMenu) {
						menuService.createMenu(sysMenu, $scope.editMenuCompleted,
								$scope.editMenuError);
					}, function() {
						// $log.info('Modal dismissed at: ' + new Date());
					});
				};

				var editModalInstanceCtrl = function($scope, $modalInstance,
						sysMenu) {

					$scope.HeaderText = "修改";

					$scope.menuTargetList = menuService.menuTargetList;

					$scope.sysMenuModal = sysMenu;

					$scope.ok = function() {
						var sysMenu = new Object();
						$modalInstance.close($scope.sysMenuModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};

				$scope.editModal = function(id) {
					menuService.getMenu({
						"menuId" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'editModal.html',
								controller : editModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									sysMenu : function() {
										return response.data;
									}
								}
							});
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(sysMenu) {
							menuService.updateMenu(sysMenu,
									$scope.editMenuCompleted,
									$scope.editMenuError);
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					})
				};

				$scope.editMenuCompleted = function(response) {
					if (response.header.code == 0) {
						$scope.getMenus(null);
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

				$scope.editMenuError = function(response) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}

				$scope.deleteOne = function(menuId) {
					if (confirm("确定要删除?")) {
						menuService.deleteMenu({
							"menuId" : menuId
						}, $scope.editMenuCompleted, $scope.editMenuError);
					}
				}

				$scope.exportExcel = function() {
					var searchvo = $scope.createSearchObject(null);
					menuService.exportMenu(searchvo);
				}

			} ]);
});
