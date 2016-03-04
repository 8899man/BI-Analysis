define(['app', 'ajaxService'], function (app) {
	app.register.service('clientDetailsService', ['ajaxService', function (ajaxService) {
		
		this.getClientDetail = function (reqdata, successFunction, errorFunction){
			ajaxService.AjaxFormPost(reqdata, "customer/cstCustomerDetail", successFunction, errorFunction);
		};
		
	}]);
});