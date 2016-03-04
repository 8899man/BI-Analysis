
define(['app'], function (app) {

    app.register.service('ajaxService', ['$http', '$q', 'blockUI', function ($http, $q, blockUI) {

        // setting timeout of 1 second to simulate a busy server.

        this.AjaxPost = function (data, route, successFunction, errorFunction) {
        	var deferred = $q.defer();
            blockUI.start();
            setTimeout(function () {
                $http.post(route, data).success(function (response, status, headers, config) {
                    blockUI.stop();
                    successFunction(response, status);
                    deferred.resolve(response);
                }).error(function (response) {
                    blockUI.stop();
                    if (response.IsAuthenicated == false) { window.location = "/index.html"; }
                    errorFunction(response);
                    deferred.reject(response);
                });
            }, 300);
            return deferred.promise;
        }
        
        this.AjaxFormPost = function (data, route, successFunction, errorFunction) {
			var deferred = $q.defer();
            blockUI.start();
	
			var transform = function(data){
			   return $.param(data);
		  	}
					
			var header = {
					headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
					transformRequest: transform
   			};
				
            setTimeout(function () {
                $http.post(route,data,header).success(function (response, status, headers, config) {
                	
                	blockUI.stop();
                    successFunction(response, status);
                    deferred.resolve(response);
                }).error(function (response) {
                    blockUI.stop();
                    if (response.header.code == 3) { window.location = "/index.html"; }
                    errorFunction(response);
                    deferred.reject(response);
                });
            }, 300);
            return deferred.promise;
        }
        
        this.AjaxFormPostNoBlock = function (data, route, successFunction, errorFunction) {
			var deferred = $q.defer();
			var transform = function(data){
			   return $.param(data);
		  	}
			
			var header = {
					headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
					transformRequest: transform
   			};
				
            setTimeout(function () {
                $http.post(route,data,header).success(function (response, status, headers, config) {
                	
                	blockUI.stop();
                	successFunction(response, status);
                	deferred.resolve(response);
                }).error(function (response) {
                    if (response.header.code == 3) { window.location = "/index.html"; }
                    errorFunction(response);
                    deferred.reject(response);
                });
            }, 300);
            return deferred.promise;
        }

        this.AjaxPostNoBlock = function (data, route, successFunction, errorFunction) {
			var deferred = $q.defer();
            setTimeout(function () {
                $http.post(route, data).success(function (response, status, headers, config) {
                	
                	blockUI.stop();
                	successFunction(response, status);
                	deferred.resolve(response);
                }).error(function (response) {
                    if (response.IsAuthenicated == false) { window.location = "/index.html"; }
                    errorFunction(response);
                    deferred.reject(response);
                });
            }, 300);
            return deferred.promise;
        }

        this.AjaxPostWithNoAuthenication = function (data, route, successFunction, errorFunction) {
			var deferred = $q.defer();
            blockUI.start();
            setTimeout(function () {
                $http.post(route, data).success(function (response, status, headers, config) {
                	
                	blockUI.stop();
                    successFunction(response, status);
                    deferred.resolve(response);
                }).error(function (response) {
                    blockUI.stop();
                    errorFunction(response);
                    deferred.reject(response);
                });
            }, 300);
            return deferred.promise;
        }

        this.AjaxGet = function (route, successFunction, errorFunction) {
			var deferred = $q.defer();
            blockUI.start();
            setTimeout(function () {
                $http({ method: 'GET', url: route }).success(function (response, status, headers, config) {
                	
                	blockUI.stop();
                    successFunction(response, status);
                    deferred.resolve(response);
                }).error(function (response) {
                    blockUI.stop();
                    if (response.IsAuthenicated == false) { window.location = "/index.html"; }
                    errorFunction(response);
                    deferred.reject(response);
                });
            }, 300);
            return deferred.promise;
        }

        this.AjaxGetWithData = function (data, route, successFunction, errorFunction) {
			var deferred = $q.defer();
            blockUI.start("加载中...");
            //data += "&random=" + Math.random() * 100;
            setTimeout(function () {
                $http({ method: 'GET', url: route, params: data }).success(function (response, status, headers, config) {
                	
                	blockUI.stop();
                    if (response.ReturnStatus == true){
                        successFunction(response, status);
                        deferred.resolve(response);
                    }else {
                        //if (response.IsAuthenicated == false) { window.location = "/index.html"; }
                        errorFunction(response);
                        deferred.reject(response);
                    }
                }).error(function (response) {
                    blockUI.stop();
                    if (response.IsAuthenicated == false) { window.location = "/index.html"; }
                    errorFunction(response);
                });
            }, 300);
            return deferred.promise;
        }


        this.AjaxGetWithNoBlock = function (data, route, successFunction, errorFunction) {
			var deferred = $q.defer();
            setTimeout(function () {
                $http({ method: 'GET', url: route, params: data }).success(function (response, status, headers, config) {
                	
                	blockUI.stop();
                	successFunction(response, status);
                	deferred.resolve(response);
                }).error(function (response) {
                    ;
                    if (response.IsAuthenicated == false) { window.location = "/index.html"; }
                    errorFunction(response);
                    deferred.reject(response);
                });
            }, 0);
            return deferred.promise;
        }


    } ]);
});