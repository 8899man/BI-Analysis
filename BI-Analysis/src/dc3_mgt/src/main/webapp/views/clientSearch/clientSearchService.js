define(['app', 'ajaxService'], function (app) {
	app.register.service('clientSearchService', ['ajaxService', function (ajaxService) {
		
		this.getClientDetail = function (reqdata, successFunction, errorFunction){
			ajaxService.AjaxFormPostNoBlock(reqdata, "customer/clientSearch", successFunction, errorFunction);
		};
		
	}]);
});