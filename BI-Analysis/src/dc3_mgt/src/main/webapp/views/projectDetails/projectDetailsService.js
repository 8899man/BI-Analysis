define(['app', 'ajaxService'], function (app) {
    //console.dir(app);
    app.register.service('projectDetailsService', ['ajaxService', function (ajaxService) {
    	//console.dir(id);
    	this.getProjectDetails = function (proj_guid, successFunction, errorFunction) {
    		ajaxService.AjaxFormPost(proj_guid, "pmp/indexBaseDetail", successFunction, errorFunction);
    	}
  }]);
});

