define(['app', 'ajaxService'], function (app) {
	app.register.service('projectListService', ['ajaxService', function (ajaxService) {
		
		this.getProjectList = function (successFunction, errorFunction){
			ajaxService.AjaxFormPost("pmp/projectList", successFunction, errorFunction);
		};
		
	}]);
});