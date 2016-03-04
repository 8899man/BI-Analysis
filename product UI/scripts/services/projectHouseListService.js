define(['app', 'ajaxService'], function (app) {

    app.register.service('projectHouseListService', ['ajaxService', function (ajaxService) {
        

        this.getProjectHouseList = function (projectInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(projectInfo, "api/projectHouseList/projectHouseList.json", successFunction, errorFunction);
        };


    }]);
});