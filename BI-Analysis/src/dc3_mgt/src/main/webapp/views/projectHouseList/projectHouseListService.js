define(['app', 'ajaxService'], function (app) {

    app.register.service('projectHouseListService', ['ajaxService', function (ajaxService) {
    	
        this.getProjectHouseList = function (projectInfo, successFunction, errorFunction) {
        	switch(projectInfo.houseType)
        	{
        	case "selling": //在售
        	  //console.log(projectInfo.houseType);
        	  ajaxService.AjaxFormPost(projectInfo, "pmp/projectHouseOnList", successFunction, errorFunction);
        	  break;
        	case "selled":
        	  //console.log(projectInfo.houseType);
        	  ajaxService.AjaxFormPost(projectInfo, "pmp/projectHouseEndList", successFunction, errorFunction);
        	  break;
        	default:
        	  ajaxService.AjaxFormPost(projectInfo, "pmp/projectHouseList", successFunction, errorFunction);
        	}
        };
        //获取区域
        this.getProjectHouseArea = function (success,successFunction, errorFunction) {
        	ajaxService.AjaxPost(success,"pmp/projectHouseQueryList", successFunction, errorFunction);
        };
        //获取区域下公司
        this.getCompany = function (areaCode, successFunction, errorFunction) {
            return ajaxService.AjaxFormPost(areaCode, "pmp/getCompany", successFunction, errorFunction);
        };
        
        //查询区域，公司
        this.getProjectHouseData = function (info, successFunction, errorFunction) {
            return ajaxService.AjaxFormPost(info, "pmp/Search", successFunction, errorFunction);
        };
    }]);
});