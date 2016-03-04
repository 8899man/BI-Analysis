define(['app', 'window', 'jquery', 'WdatePicker', 'clientBatchSearchServices', 'toastr', 'upload'], function (app, w, $) {
	//console.dir(app);
	app.register.controller('ClientBatchSearchController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', '$interval', '$timeout', 'util', 'clientBatchSearchServices', 'toastr', function ($location, $modal, $filter, $scope, $rootScope, $state, $interval, $timeout, util, clientBatchSearchServices, toastr) {

		$scope.initializeController = function () {

			$scope.keyword = "";

			$scope.clientSearchType = 1;  //默认显示"按组织架构查询"

			$scope.PageSize = 10;//默认显示一页页码数
			$scope.currentPage = 1;
			$scope.TotalRows = 0;

			$scope.detailsLoaded = false;//初始时候不显示搜索明细列表

			//所属业态
			$scope.belongsFormat = [
				{
					"title": "住宅客户",
					"value": 1
				},
				{
					"title": "商业客户",
					"value": 2
				},
				{
					"title": "置业客户",
					"value": 3
				},
				{
					"title": "住宅&置业",
					"value": 4
				},
				{
					"title": "住宅&商业",
					"value": 5
				},
				{
					"title": "置业&商业",
					"value": 6
				},
				{
					"title": "住宅&置业&商业",
					"value": 7
				}
			]
			$scope.formatChecked = "";

			//客户类别
			$scope.customerType = [
				{
					"title": "业主/会员",
					"value": 1
				},
				{
					"title": "企业客户",
					"value": 2
				},
				{
					"title": "租客",
					"value": 3
				},
				{
					"title": "二次购买&置业",
					"value": 4
				}
			]
			$scope.customerTypeChecked = "";


			//默认初始区域
			$scope.area = "";
			$scope.city = "";
			$scope.project = "";
			
			//获取界面数据
			$scope.getGroup();
		}


		//切换搜索方式
		$scope.changeType = function(){
			$scope.detailsLoaded = false;
		};

		//获取组织架构
		$scope.getGroup = function(){
			clientBatchSearchServices.getGroup({}, function(response, status){
				
				//console.log(response)

				$scope.areas = response;

				$scope.city = "";
				$scope.project = "";

				//$scope.search();

			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})
		}

		$scope.showFile = function(){
			console.log($scope.file);
		}

		$scope.selectFile = function(){
			console.log("haha");
		}

		//改变选择文件
		$scope.fileChange = function(){
			console.log("file");
			console.log($scope.file);
			console.log($scope.fileInfo)
			if($scope.file != null){
				$scope.fileInfo = $scope.file;
				$scope.imported = false;
			}
		}

		$scope.importFile = function(){
			console.log(111);
			if(!$scope.fileInfo){
				return;
			}
			//利用ng-file-upload导入文件$scope.fileInfo,在成功回调后面设置已经导入 
			$scope.imported = true;

		}


$scope.test = function(){
	console.log("is test");
	console.log($scope.file);
	if($scope.file != null){
		$scope.fileInfo = $scope.file;
	}
	//console.log("is test2");
}

		//区域改变
		$scope.changeArea = function(){
			//console.log($scope.area);
			$scope.city = "";
			$scope.project = "";
		}

		//城市改变
		$scope.changeCity = function(){
			$scope.project = "";
		}



		

		$scope.search = function(){
			
			//如果有输入关键词，则进入查询画像，当没有输入关键词，则进入查询明细
			if($scope.keyword !== ''){
				var keyword = $.trim($scope.keyword);
				//console.log(/^(\d{18,18}|\d{15,15}|\d{17,17}x)$/.test(keyword));
				if(!(/^(\d{18,18}|\d{15,15}|\d{17,17}x)$/.test(keyword)) && !(/^\d{11}$/.test(keyword))){
					//如果不能匹配身份证号码跟手机号码，则提示输入正确的身份证号或手机号码
					new w.Window().alert({
		    			title: "错误提示",
		    			width: 300,
		    			height: 160,
		    			content: '你好，请输入正确的身份证号或手机号码',
		    			hasCloseBtn: true
		    		});
		    		return false;
				}

				//进入查询画像
				$scope.getClient();
			}else{
				//赋值查询的数据对象
				$scope.areaSeach = $scope.area;//区域
				$scope.citySearch = $scope.city;//城市
				$scope.projectSearch = $scope.project;//项目
				$scope.formatCheckedSearch = $scope.formatChecked;//所属业态
				$scope.customerTypeCheckedSearch = $scope.customerTypeChecked;//客户类别
				$scope.startDate = $scope.startDate;//创建时间起始
				$scope.endDate = $scope.endDate;//创建时间结束
				//进入查询明细
				$scope.getDetails();
			}
		};

		$scope.getClient = function(){
			
			clientBatchSearchServices.getClient({
				keyword: $scope.keyword
			}, function(response, status){
				//这里只模拟查找到了有这个客户，如果查找到没有这个客户，则弹出提示没有找到对应的客户，请重新输入关键词
				/*
				new w.Window().alert({
	    			title: "错误提示",
	    			width: 300,
	    			height: 160,
	    			content: '你好，没有找到符合你输入关键词的客户',
	    			hasCloseBtn: true
	    		});
				*/
				//获取的客户，根据id，去存储到clientBatchSearchServices这个服务的clientFromId对象里，然后进行调整
				clientBatchSearchServices.setClientFromId(response.clientId, response);
				$state.go("app.client.details", {"clientId": response.clientId});

			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			});
		};

		

		//查询明细页码切换
		$scope.pageChanged = function () {
			$scope.getDetails(null);
		}


		//获取查询明细
		$scope.getDetails = function (search) {


			//请求时候记得区分是“组织架构”还是“导入号码”查询

			var searchInfo = $scope.createSearchInfo(search);
			clientBatchSearchServices.getDetails(searchInfo, function(response, status){

				//性别
				$scope.sexList = response.sexList;

				//婚姻状况
				$scope.marryState = response.marryState;
				
				

				//客户类型
				$scope.customerType = response.customerType;

				//年龄分布
				$scope.ageList = response.ageList;

				//默认导出属性
				$scope.nameChecked = true;
				$scope.sexChecked = true;
				$scope.telChecked = true;
				$scope.certificatesNumberChecked = true;
				$scope.ageGroupChecked = true;
				$scope.createTimeChecked = true;
				$scope.visitingTimeChecked = true;
				$scope.subscriptionTimeChecked = true;
				$scope.signingTimeChecked = true;


				//填充内容
				$scope.customerList = response.customerList;



				$scope.TotalRows = response.TotalRows;
				$scope.detailsLoaded = true;

				//alert(111);

				if($scope.clientSearchType == 1){
					$scope.loadedByFile = false;//通过组织架构查询
				}else{
					$scope.loadedByFile = true;//通过导入号码查询
				}



			}, function(response, status){
				toastr.warning('获取数据失败', '提示', {
					closeButton: true,
					timeOut: 5000
				});
			})
			//projectHouseListService.getProjectHouseList(searchInfo, $scope.projectHouseListCompleted, $scope.projectHouseListError);
		}


		//生成传给后台的查询对象
		$scope.createSearchInfo = function (search) {

			var searchInfo = {};

			if (search != null){
				searchInfo.currentPage = 1;
				$scope.currentPage = 1;
			}
			else{
				searchInfo.currentPage = $scope.currentPage;
			}

			searchInfo.areaSeach = $scope.areaSeach;//区域
			searchInfo.citySearch = $scope.citySearch;//城市
			searchInfo.projectSearch = $scope.projectSearch;//项目
			searchInfo.formatCheckedSearch = $scope.formatCheckedSearch;//所属业态
			searchInfo.customerTypeCheckedSearch = $scope.customerTypeCheckedSearch;//客户类别
			searchInfo.startDate = $scope.startDate;//创建时间起始
			searchInfo.endDate = $scope.endDate;//创建时间结束

			return searchInfo;
		}



		
	}]);
});

