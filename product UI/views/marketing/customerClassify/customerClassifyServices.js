define(['app', 'ajaxService'], function (app) {

    app.register.service('customerClassifyServices', ['ajaxService', function (ajaxService) {
        
        //获取区域范围
        this.getAreaCoverage = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/marketing/customerClassify/areaCoverage.json", successFunction, errorFunction);
        };


        //获取细分类型数据
        this.getSubTypeData = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/marketing/customerClassify/subTypeData.json", successFunction, errorFunction);
        };


        //获取数据提取
        this.getFetchData = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/marketing/customerClassify/fetchData.json", successFunction, errorFunction);
        };

        


    }]);
});