define(['app', 'ajaxService'], function (app) {

    app.register.service('investmentCustomerServices', ['ajaxService', function (ajaxService) {
        
        //获取区域范围
        this.getCoverage = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/marketing/investmentCustomer/coverage.json", successFunction, errorFunction);
        };


        //获取细分类型数据
        this.getSubTypeData = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/marketing/investmentCustomer/subTypeData.json", successFunction, errorFunction);
        };


        //获取数据提取
        this.getFetchData = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/marketing/investmentCustomer/fetchData.json", successFunction, errorFunction);
        };

        


    }]);
});