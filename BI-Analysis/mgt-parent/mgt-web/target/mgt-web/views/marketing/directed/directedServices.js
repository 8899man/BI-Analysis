define(['app', 'ajaxService'], function (app) {

    app.register.service('directedServices', ['ajaxService', function (ajaxService) {
        
        //获取区域范围
        this.getCoverage = function (salseQueryInfo, successFunction, errorFunction) {
//            ajaxService.AjaxPost(salseQueryInfo, "api/marketing/directed/getCoverage.json", successFunction, errorFunction);
            ajaxService.AjaxFormPost(salseQueryInfo, "marketing/directed/getCoverage", successFunction, errorFunction);
        };

        //获取数据提取
        this.getFetchData = function (salseQueryInfo, successFunction, errorFunction) {
//        	ajaxService.AjaxPost(salseQueryInfo, "api/marketing/directed/fetchData.json", successFunction, errorFunction);
        	ajaxService.AjaxFormPost(salseQueryInfo, "marketing/directed/getFetchData", successFunction, errorFunction);
        };
        
      //提取数据
        this.exportData = function (salseQueryInfo) {
        	ajaxService.AjaxDownload(salseQueryInfo, "marketing/directed/exportData");
        };
    }]);
});