define(['app', 'window', 'jquery', 'clientSearchService'], function (app, w, $) {
    //console.dir(app);
    app.register.controller('ClientSearchController', ['$location', '$modal', '$filter', '$scope', '$rootScope', '$state', 'clientSearchService', '$interval', function ($location, $modal, $filter, $scope, $rootScope, $state, clientSearchService, $interval) {

      $scope.initializeController = function () {
        $rootScope.layout.hasSubs = false;
        
        $scope.btnTitle = "查看画像";
        $scope.btnDisabled = false;
      }
      
      
      var searchInterval;
      $scope.checkDetails = function(){
    	  
    	//如果为空则直接提示错误
          if($.trim($scope.keyword) === ''){
            new w.Window().alert({
                title: "提示",
                content: "请输入客户手机号或证件号码可查看客户画像",
                width: 400,
                height: 180,
                hasCloseBtn: true,
                dragHandle: ".window_header",
                //text4AlertBtn: "OK",
                handler4AlertBtn: function(){
                    $("#keyword").focus();
                },
                handler4CloseBtn: function(){
                    $("#keyword").focus();
                }
            });
            return;
          }
          
          
          
          $scope.btnTitle = "查看中..."
          searchInterval && $interval.cancel(searchInterval);
          $scope.btnDisabled = true;
          searchInterval = $interval(function(){
            if($scope.btnTitle == "查看中..."){
              $scope.btnTitle = "查看中"
            }else if($scope.btnTitle == "查看中"){
              $scope.btnTitle = "查看中."
            }else if($scope.btnTitle == "查看中."){
              $scope.btnTitle = "查看中.."
            }else{
              $scope.btnTitle = "查看中..."
            }
          },300)
          
    	  
    	  
    	  
    	  
    	  var str = $scope.keyword;
          //alert(1111);
          //console.dir(clientSearchService);
    	  clientSearchService.getClientDetail(
				  {'reqData' : str},
				  function(response){
					  //验证关键词是否有效
					  if(response.header.code == 0){
						  var cstGUID = response.data;
						  $state.go('app.client.details', {"cstGUID": cstGUID});
						  
						  searchInterval && $interval.cancel(searchInterval);
						  $scope.btnTitle = "查看画像";
						  $scope.btnDisabled = false;
						  
					  }else{
						  $scope.btnDisabled = false;
						  new w.Window().alert({
				                title: "提示",
				                content: response.header.message,
				                width: 400,
				                height: 180,
				                hasCloseBtn: true,
				                dragHandle: ".window_header",
				                //text4AlertBtn: "OK",
				                handler4AlertBtn: function(){
				                    $("#keyword").focus();
				                },
				                handler4CloseBtn: function(){
				                    $("#keyword").focus();
				                }
				            });
						  searchInterval && $interval.cancel(searchInterval);
						  $scope.btnTitle = "查看画像";
						  $scope.btnDisabled = false;
					  }
				  },
				  function(){
					  
				  }
		  );
    	  
    	  
      }

  }]);
});

