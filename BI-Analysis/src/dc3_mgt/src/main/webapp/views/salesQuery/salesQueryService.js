define(['app', 'ajaxService'], function (app) {
	app.register.service('salesQueryService', ['ajaxService', function (ajaxService) {
		this.getHouses = function (reqdata, successFunction, errorFunction){
			ajaxService.AjaxFormPostNoBlock(reqdata, "sale/houseQuery", successFunction, errorFunction);
		};
	}]);
});