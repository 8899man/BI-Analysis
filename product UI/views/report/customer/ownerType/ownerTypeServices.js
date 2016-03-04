define(['app', 'ajaxService'], function (app) {

    app.register.service('ownerTypeServices', ['ajaxService', function (ajaxService) {
        
        //获取区域范围
        this.getCoverage = function (salseQueryInfo, successFunction, errorFunction) {
            return ajaxService.AjaxPost(salseQueryInfo, "api/report/customer/ownerType/coverage.json", successFunction, errorFunction);
        };


        //获取查询内容
        this.searchData = function (salseQueryInfo, successFunction, errorFunction) {
            return ajaxService.AjaxPost(salseQueryInfo, "api/report/customer/ownerType/searchData.json", successFunction, errorFunction);
        };


        
        


    }]);
});