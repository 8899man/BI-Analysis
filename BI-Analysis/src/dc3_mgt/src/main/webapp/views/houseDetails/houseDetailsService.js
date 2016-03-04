define(['app', 'ajaxService'], function (app) {
	app.register.service('houseDetailService', ['ajaxService', function (ajaxService) {
		this.houseDetail = function (reqdata, successFunction, errorFunction){
			ajaxService.AjaxFormPostNoBlock(reqdata, "house/houseDetail", successFunction, errorFunction);
		};
	}]);
});