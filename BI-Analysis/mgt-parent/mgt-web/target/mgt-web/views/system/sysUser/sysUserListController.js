"use strict";

define(['app', 'window', 'jquery', 'sysUserService','jstree', 'toastr'], function (app, w, $) {

	app.register.controller('sysUserListController', [
			'$location',
			'$modal',
			'$log',
			'$filter',
			'$scope',
			'$rootScope',
			'$document',
			'sysUserService',
			'toastr',
			function($location, $modal, $log, $filter, $scope, $rootScope,
					 $document, sysUserService, toastr) {

				$scope.initializeController = function() {
					$scope.searchTxt = "";
					$scope.pageSize = 20;
					$scope.sysUserTypeMap = sysUserService.sysUserTypeMap;
					$scope.sysUserStateMap = sysUserService.sysUserStateMap;
					$scope.currentPage = 1;
					$scope.TotalRows = 0;

 					$scope.getOrgTree();
					$scope.getSysRoleList();
					$scope.getSysUserTypeList();
  
					$scope.SysUsers = [];
					//$scope.getSysUsers(null);
					$scope.FileUpload;
					
					$('#ajax').jstree({
							  "core" : {
								"animation" : 0,
								"check_callback" : true,
								"themes" : { "stripes" : true },
								'data' : {
									"url" : "system/orgTree",
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
						
							$scope.orgId=data.selected[0];
							$scope.searchTxt="";
							$scope.getSysUsers(null);
					        console.log(data.selected[0]);
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
					searchVo.orgId=$scope.orgId;
					return searchVo;
				}

				$scope.getSysUsers = function(pageNumber) {
					var sysUser = $scope.createSearchObject(pageNumber);
					sysUserService.getSysUsers(sysUser, $scope.getSysUsersCompleted,
							$scope.getSysUsersError);
				}
				
				$scope.enter = function(ev) { 
					if (ev.keyCode !== 13) {
					  return; 
					}
					$scope.getSysUsers('search');
				}

				$scope.getSysUsersCompleted = function(response, status) {
			

					if (response.header.code == 0) {
						$scope.SysUsers = response.data.list;
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
				}

				$scope.getSysUsersError = function(response, status) {
					toastr.error("获取数据失败", '提示', {
							closeButton : true,
							timeOut : 3000
					});
				}

				$scope.getOrgTree = function() {
					sysUserService.getOrgTree(null, $scope.getOrgTreeCompleted,
							function(){});
				}
				
				$scope.getOrgTreeCompleted=function(response, status){
					if (status == 200) {
						var orgList= sysUserService.treeToList(response);
						sysUserService.setOrgList(orgList);
			 			
					}
				}
				
				$scope.getSysRoleList = function() {
					sysUserService.getSysRoleList(null, $scope.getSysRoleListCompleted,
							function(){});
				}
				
				$scope.getSysRoleListCompleted=function(response, status){
					
					if (status == 200) {
						sysUserService.setSysRoleList(response.data);
					}
				}
				
				$scope.getSysUserTypeList = function() {
					sysUserService.getSysUserTypeList(null, $scope.getSysUserTypeListCompleted,
							function(){});
				}
				
				$scope.getSysUserTypeListCompleted=function(response, status){
					
					if (status == 200) {
						sysUserService.setSysUserTypeList(response.data);
					}
				}

				$scope.pageChanged = function() {
					$scope.getSysUsers(null);
				}
				
				$scope.exportExcel = function() {
					var searchvo = $scope.createSearchObject(null);
					sysUserService.exportSysUser(searchvo);
				}
				
				var addModalInstanceCtrl = function($scope, $modalInstance,orgId) {
					console.log("orgId");
					console.log(orgId);
					$scope.HeaderText = "新增";
					$scope.sysUserModal = {};
					$scope.sysUserModal.userType = 4;
					$scope.sysUserModal.state = 1;
					$scope.sysUserModal.orgId = orgId;
					$scope.sysUserModal.roleList = sysUserService.sysRoleList;
					$scope.sysUserTypeList = sysUserService.sysUserTypeList;
					$scope.sysUserStateList = sysUserService.sysUserStateList;
					$scope.orgList = sysUserService.orgList;
					console.log($scope.depList);
					$scope.ok = function() {
						$modalInstance.close($scope.sysUserModal);
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

					modalInstance.result.then(function(sysUser) {
						sysUserService.createSysUser(sysUser, $scope.editSysUserCompleted,
								$scope.editSysUserError);
					}, function() {
						// $log.info('Modal dismissed at: ' + new Date());
					});
				};

				var editModalInstanceCtrl = function($scope, $modalInstance,
						sysUser) {

					$scope.HeaderText = "修改";

					$scope.sysUserTypeList = sysUserService.sysUserTypeList;
					$scope.sysUserStateList = sysUserService.sysUserStateList;
					$scope.sysRoleList = sysUserService.sysRoleList;

					$scope.orgList = sysUserService.orgList;

					$scope.sysUserModal = sysUser;

					$scope.ok = function() {
						var sysUser = new Object();
						$modalInstance.close($scope.sysUserModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};

				$scope.editModal = function(id) {
					sysUserService.getSysUser({
						"userId" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'editModal.html',
								controller : editModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									sysUser : function() {
										return response.data;
									}
								}
							});
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(sysUser) {
							sysUserService.updateSysUser(sysUser,
									$scope.editSysUserCompleted,
									$scope.editSysUserError);
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					})
				};
				

				$scope.editSysUserCompleted = function(response) {
					if (response.header.code == 0) {
						$scope.getSysUsers(null);
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

				$scope.editSysUserError = function(response) {
					toastr.warning("操作失败", '提示', {
						closeButton : true,
						timeOut : 5000
					});
				}

				$scope.deleteOne = function(userId) {
					if (confirm("确定要删除?")) {
						sysUserService.deleteSysUser({
							"userId" : userId
						}, $scope.editSysUserCompleted, $scope.editSysUserError);
					}
				}
				
				var powerModalInstanceCtrl = function($scope, $modalInstance,
						sysUser) {
		

					$scope.sysUserModal = sysUser;
					
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
							
							$("#powerTree").jstree("check_node",sysUser.projGuidList);

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
						$scope.sysUserModal.projGuidList = idList;
						$modalInstance.close($scope.sysUserModal);
					};

					$scope.cancel = function() {
						$modalInstance.dismiss('cancel');
					};
				};
				
				$scope.powerModal = function(id) {
					sysUserService.getSysUser({
						"userId" : id
					}, function(response) {
						if (response.header.code == 0) {
							var modalInstance = $modal.open({
								templateUrl : 'powerModal.html',
								controller : powerModalInstanceCtrl,
								windowClass : 'app-modal-window',
								resolve : {
									sysUser : function() {
										return response.data;
									}
								}
							});
							
						} else {
							alert(response.header.message);
						}

						modalInstance.result.then(function(sysUser) {
							sysUserService.updateDataPower(sysUser,
									$scope.editSysUserCompleted,
									$scope.editSysUserError);
									
						}, function() {
							// $log.info('Modal dismissed at: ' + new Date());
						});
					}, function() {

					});
					
				};

			} ]);
});
