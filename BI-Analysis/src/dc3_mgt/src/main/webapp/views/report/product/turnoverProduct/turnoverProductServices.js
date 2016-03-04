define(['app', 'ajaxService'], function (app) {

    app.register.service('turnoverProductServices', ['ajaxService', function (ajaxService) {
        
        //获取区域范围
        this.getCoverage = function (salseQueryInfo, successFunction, errorFunction) {
            return ajaxService.AjaxPost(salseQueryInfo, "report/product/turnoverProduct", successFunction, errorFunction);
        };
        
      //获取区域下公司
        this.getCompany = function (salseQueryInfo, successFunction, errorFunction) {
            return ajaxService.AjaxFormPost(salseQueryInfo, "report/product/getCompany", successFunction, errorFunction);
        };


        //获取查询内容
        this.searchData = function (salseQueryInfo, successFunction, errorFunction) {
            return ajaxService.AjaxFormPost(salseQueryInfo, "report/product/getProductProjectData", successFunction, errorFunction);
        };


    }]);
});