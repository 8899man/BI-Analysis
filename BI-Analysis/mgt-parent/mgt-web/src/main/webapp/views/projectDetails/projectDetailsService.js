define(['app', 'ajaxService'], function (app) {
    //console.dir(app);
    app.register.service('projectDetailsService', ['ajaxService', function (ajaxService) {
    	//console.dir(id);
    	this.getProjectDetails = function (proj_guid, successFunction, errorFunction) {
    		ajaxService.AjaxFormPost(proj_guid, "pmp/indexBaseDetail", successFunction, errorFunction);
    	}
    	
    	this.getCustomerData = function (proj_guid, successFunction, errorFunction) {
    		ajaxService.AjaxFormPost(proj_guid, "pmp/indexCSBaseDetail", successFunction, errorFunction);
    	}
    	
    	this.getHousePurchData = function (proj_guid, successFunction, errorFunction) {
    		ajaxService.AjaxFormPost(proj_guid, "pmp/indexZYBaseDetail", successFunction, errorFunction);
    	}
    	
    	this.getProjectIndex = function (projectInfo, successFunction, errorFunction) {
    		//console.log(projectInfo.projType);
        	switch(projectInfo.projType)
        	{
        	case "week": //在售
        	  ajaxService.AjaxFormPost(projectInfo, "pmp/indexWeekDetail", successFunction, errorFunction);
        	  break;
        	case "month":
        	  ajaxService.AjaxFormPost(projectInfo, "pmp/indexMonthDetail", successFunction, errorFunction);
        	  break;
        	default:
        	  ajaxService.AjaxFormPost(projectInfo, "pmp/indexBaseDetail", successFunction, errorFunction);
        	}
        };
    	
    	
  }]);
});

