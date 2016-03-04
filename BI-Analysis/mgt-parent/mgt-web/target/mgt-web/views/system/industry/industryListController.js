"use strict";

define(['app', 'window', 'jquery', 'industryService','jstree', 'toastr'], function (app, w, $) {

	app.register.controller('industryListController', [
			'$location',
			'$modal',
			'$log',
			'$filter',
			'$scope',
			'$rootScope',
			'$document',
			'industryService',
			'toastr',
			function($location, $modal, $log, $filter, $scope, $rootScope,
					 $document, industryService, toastr) {
				$scope.initializeController = function() {
					$scope.searchTxt = "";
					$scope.pageSize = 20;
					$scope.industryTypeMap = industryService.industryTypeMap;
					$scope.currentPage = 1;
					$scope.TotalRows = 0;
					

					$scope.Industrys = [];
					$scope.getIndustrys(null);
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

				$scope.getIndustrys = function(pageNumber) {
					var industry = $scope.createSearchObject(pageNumber);
					industryService.getIndustrys(industry, $scope.getIndustrysCompleted,
							$scope.getIndustrysError);
				}

				$scope.enter = function(ev) { 
					if (ev.keyCode !== 13) {
					  return; 
					}
					$scope.getIndustrys('search');
				}

				$scope.getIndustrysCompleted = function(response, status) {

					if (response.header.code == 0) {
						$scope.Industrys = response.data.list;
						$scope.pageSize = response.data.page.pageSize;
						$scope.currentPage = response.data.page.currentPage;
						$scope.TotalPages = response.data.page.pageCount;
						$scope.TotalRows = response.data.page.recordCount;
					}
				}

				$scope.getIndustrysError = function(response, status) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}


				$scope.pageChanged = function() {
					$scope.getIndustrys(null);
				}



				var addModalInstanceCtrl = function($scope, $modalInstance) {
					$scope.HeaderText = "新增";
					$scope.industryModal = {};
					$scope.industryModal.industryType = 1;
					$scope.industryTypeList = industryService.industryTypeList;

					$scope.ok = function() {
						$modalInstance.close($scope.industryModal);
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

					modalInstance.result.then(function(industry) {
						industryService.createIndustry(industry, $scope.editIndustryCompleted,
								$scope.editIndustryError);
					}, function() {
						// $log.info('Modal dismissed at: ' + new Date());
					});
				};

				var editModalInstanceCtrl = function($scope, $modalInstance,
						industry) {

					$scope.HeaderText = "修改";

					$scope.industryTypeList = industryService.industryTypeList;

					

					$scope.industryModal = industry;

					$scope.ok = function() {
						var industry = new Object();
						$modalInstance.close($scope.industryModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};

				$scope.editModal = function(id) {
					industryService.getIndustry({
						"industryid" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'editModal.html',
								controller : editModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									industry : function() {
										return response.data;
									}
								}
							});
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(industry) {
							industryService.updateIndustry(industry,
									$scope.editIndustryCompleted,
									$scope.editIndustryError);
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					})
				};

				$scope.editIndustryCompleted = function(response) {
					if (response.header.code == 0) {
						$scope.getIndustrys(null);
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

				$scope.editIndustryError = function(response) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}

				$scope.deleteOne = function(industryid) {
					if (confirm("确定要删除?")) {
						industryService.deleteIndustry({
							"industryid" : industryid
						}, $scope.editIndustryCompleted, $scope.editIndustryError);
					}
				}

				$scope.exportExcel = function() {
					var searchvo = $scope.createSearchObject(null);
					industryService.exportIndustry(searchvo);
				}
				
				
				var orgModalInstanceCtrl = function($scope, $modalInstance,
						industry) {
		

					$scope.industryModal = industry;
					
					$scope.initTree=function(){
						
							$('#powerTree').jstree({
							  "core" : {
								"animation" : 0,
								"check_callback" : true,
								"themes" : { "stripes" : true },
								"checkbox" : {
								  "keep_selected_style" : false
								},
								'data' : {
									"url" : "system/orgIndustryTree",
									"dataType" : "json" // needed only if you do not supply JSON headers
								}
							  },
							  "types" : {
								  "default" : {
									"icon" : "scripts/jstree/images/tree_icon.png"
								  },
								  "org" : {
									"icon" : "scripts/jstree/images/org.png"
								  },
								  "project" : {
									"icon" : "scripts/jstree/images/proj.png"
								  }
								},
							  "plugins" : ["checkbox","types"]
							}).bind("loaded.jstree",function(){

							$("#powerTree").jstree("open_all");
							
							$("#powerTree").jstree("check_node",industry.orgGuidList);

							});
					}
					
					$scope.ok = function() {
						var ids = $("#powerTree").jstree("get_checked");
						var idList = [];
						for(var id in ids)
						{
							var obj = {};
							
							idList.push(ids[id]);
						}
						console.log(idList);
						$scope.industryModal.orgGuidList = idList;
						$modalInstance.close($scope.industryModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};
				
				$scope.orgModal = function(id) {
					industryService.getIndustry({
						"industryid" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'orgModal.html',
								controller : orgModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									industry : function() {
										return response.data;
									}
								}
							});
							
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(industry) {
							industryService.updateIndustryOrg(industry,
									$scope.editIndustryCompleted,
									$scope.editIndustryError);
									
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					});
					
				};

			} ]);
});
