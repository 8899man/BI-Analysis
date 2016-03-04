"use strict";

define(['app', 'window', 'jquery', 'adUserService','jstree', 'toastr'], function (app, w, $) {

	app.register.controller('adUserListController', [
			'$location',
			'$modal',
			'$log',
			'$filter',
			'$scope',
			'$rootScope',
			'$document',
			'adUserService',
			'toastr',
			function($location, $modal, $log, $filter, $scope, $rootScope,
					 $document, adUserService, toastr) {

				$scope.initializeController = function() {
					$scope.searchTxt = "";
					$scope.pageSize = 20;
					$scope.adUserTypeMap = adUserService.adUserTypeMap;
					$scope.adUserStateMap = adUserService.adUserStateMap;
					$scope.currentPage = 1;
					$scope.TotalRows = 0;

 					$scope.getAdOrgTree();
					$scope.getSysRoleList();
					$scope.getAdUserTypeList();
  
					$scope.AdUsers = [];
					//$scope.getAdUsers(null);
					$scope.FileUpload;
					
					
					
					$('#ajax').jstree({
							  "core" : {
								"animation" : 0,
								"check_callback" : true,
								"themes" : { "stripes" : true },
								'data' : {
									"url" : "system/adOrgTree",
									"dataType" : "json" // needed only if you do not supply JSON headers
								}
							  },
							  "types" : {
								"#" : {
								  "max_children" : 1, 
								  "max_depth" : 4, 
								  "valid_children" : ["root"]
								},
								"root" : {
								  "icon" : "/st_mgt/jstree/dist/images/tree_icon.png",
								  "valid_children" : ["default"]
								},
								"default" : {
								  "valid_children" : ["default","file"]
								},
								"file" : {
								  "icon" : "glyphicon glyphicon-file",
								  "valid_children" : []
								}
							  },
							  "plugins" : [
								 "dnd", "search",
								"state", "types", "wholerow"
							  ]
							});
							
						$('#ajax').on("select_node.jstree", function (e, data) {
						
							$scope.adOrgId=data.selected[0];
							$scope.searchTxt="";
							$scope.getAdUsers(null);
					       
					});
				}

				$scope.createSearchObject = function(search) {
					var searchVo = new Object();
					if (search != null)
						searchVo.currentPage = 1;
					else
						searchVo.currentPage = $scope.currentPage;
						
					searchVo.pageSize = $scope.pageSize;
					searchVo.searchTxt = $scope.searchTxt;
					searchVo.adOrgId=$scope.adOrgId;
					return searchVo;
				}

				$scope.getAdUsers = function(pageNumber) {
					var adUser = $scope.createSearchObject(pageNumber);
					adUserService.getAdUsers(adUser, $scope.getAdUsersCompleted,
							$scope.getAdUsersError);
				}
				
				$scope.enter = function(ev) { 
					if (ev.keyCode !== 13) {
					  return; 
					}
					$scope.getAdUsers('search');
				}

				$scope.getAdUsersCompleted = function(response, status) {
			

					if (response.header.code == 0) {
						$scope.AdUsers = response.data.list;
						$scope.pageSize = response.data.page.pageSize;
						$scope.currentPage = response.data.page.currentPage;
						$scope.TotalPages = response.data.page.pageCount;
						$scope.TotalRows = response.data.page.recordCount;
					}else{
					
						toastr.error(response.header.message, '提示', {
								closeButton : true,
								timeOut : 3000
						});	
					}
					$scope.checkAll = false;
				}

				$scope.getAdUsersError = function(response, status) {
					toastr.error("获取数据失败", '提示', {
							closeButton : true,
							timeOut : 3000
					});
				}

				$scope.getAdOrgTree = function() {
					adUserService.getAdOrgTree(null, $scope.getAdOrgTreeCompleted,
							function(){});
				}
				
				$scope.getAdOrgTreeCompleted=function(response, status){
					if (status == 200) {
						var orgList= adUserService.treeToList(response);
						adUserService.setOrgList(orgList);
			 			
					}
				}
				
				$scope.getSysRoleList = function() {
					adUserService.getSysRoleList(null, $scope.getSysRoleListCompleted,
							function(){});
				}
				
				$scope.getSysRoleListCompleted=function(response, status){
					
					if (status == 200) {
						adUserService.setSysRoleList(response.data);
					}
				}
				
				$scope.getAdUserTypeList = function() {
					adUserService.getAdUserTypeList(null, $scope.getAdUserTypeListCompleted,
							function(){});
				}
				
				$scope.getAdUserTypeListCompleted=function(response, status){
					
					if (status == 200) {
						adUserService.setAdUserTypeList(response.data);
					}
				}

				$scope.pageChanged = function() {
					$scope.getAdUsers(null);
				}
				
				$scope.exportExcel = function() {
					var searchvo = $scope.createSearchObject(null);
					adUserService.exportAdUser(searchvo);
				}
				$scope.checkUserAll = function() {
					//$scope.checkAll=false;
					$scope.checkAll=!$scope.checkAll;
					for(var i=0; i<$scope.AdUsers.length; i++){
						$scope.AdUsers[i].checked=$scope.checkAll;
					}
					
				}
				
				$scope.checkAllOK = function() {
					
					var ids = [];
					for(var i=0; i<$scope.AdUsers.length; i++){
						
						
						if($scope.AdUsers[i].checked && $scope.AdUsers[i].orgId==null)
						{
							ids.push($scope.AdUsers[i].userId);
						}
					}
					
					if(ids.length>0)
					{
						adUserService.checkAllOK({
								"userIds" : ids
						}, $scope.editAdUserCompleted, $scope.editAdUserError);
					}

				}
				
				$scope.checkOneOK = function(userId) {
					adUserService.checkOneOK({
							"userId" : userId
						}, $scope.editAdUserCompleted, $scope.editAdUserError);
				}
				
				
				
				
				
				
				var addModalInstanceCtrl = function($scope, $modalInstance,orgId) {
					console.log("orgId");
					console.log(orgId);
					$scope.HeaderText = "新增";
					$scope.adUserModal = {};
					$scope.adUserModal.userType = 4;
					$scope.adUserModal.state = 1;
					$scope.adUserModal.orgId = orgId;
					$scope.adUserModal.roleList = adUserService.sysRoleList;
					$scope.adUserTypeList = adUserService.adUserTypeList;
					$scope.adUserStateList = adUserService.adUserStateList;
					$scope.orgList = adUserService.orgList;
					console.log($scope.depList);
					$scope.ok = function() {
						$modalInstance.close($scope.adUserModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};
				
				$scope.addModal = function(id) {
					var modalInstance = $modal.open({
						templateUrl : 'addModal.html',
						controller : addModalInstanceCtrl,
						windowClass : 'app-modal-window',
						resolve : {
									orgId : function() {
									return id+"";
								  }
						}
					});

					modalInstance.result.then(function(adUser) {
						adUserService.createAdUser(adUser, $scope.editAdUserCompleted,
								$scope.editAdUserError);
					}, function() {
						// $log.info('Modal dismissed at: ' + new Date());
					});
				};

				var editModalInstanceCtrl = function($scope, $modalInstance,
						adUser) {

					$scope.HeaderText = "查看";

					$scope.adUserTypeList = adUserService.adUserTypeList;
					$scope.adUserStateList = adUserService.adUserStateList;
					
					$scope.adUserStateMap = adUserService.adUserStateMap;
					$scope.sysRoleList = adUserService.sysRoleList;

					$scope.orgList = adUserService.orgList;

					$scope.adUserModal = adUser;

					$scope.ok = function() {
						var adUser = new Object();
						$modalInstance.close($scope.adUserModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};

				$scope.editModal = function(id) {
					adUserService.getAdUser({
						"userId" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'editModal.html',
								controller : editModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									adUser : function() {
										return response.data;
									}
								}
							});
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(adUser) {
							adUserService.updateAdUser(adUser,
									$scope.editAdUserCompleted,
									$scope.editAdUserError);
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					})
				};
				

				$scope.editAdUserCompleted = function(response) {
					if (response.header.code == 0) {
						$scope.getAdUsers(null);
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

				$scope.editAdUserError = function(response) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}

				$scope.deleteOne = function(userId) {
					if (confirm("确定要删除?")) {
						adUserService.deleteAdUser({
							"userId" : userId
						}, $scope.editAdUserCompleted, $scope.editAdUserError);
					}
				}
				
				var powerModalInstanceCtrl = function($scope, $modalInstance,
						adUser) {
		

					$scope.adUserModal = adUser;
					
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
									"url" : "system/dataTree",
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
							
							$("#powerTree").jstree("check_node",adUser.projGuidList);

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
						$scope.adUserModal.projGuidList = idList;
						$modalInstance.close($scope.adUserModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};
				
				$scope.powerModal = function(id) {
					adUserService.getAdUser({
						"userId" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'powerModal.html',
								controller : powerModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									adUser : function() {
										return response.data;
									}
								}
							});
							
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(adUser) {
							adUserService.updateDataPower(adUser,
									$scope.editAdUserCompleted,
									$scope.editAdUserError);
									
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					});
					
				};

			} ]);
});
