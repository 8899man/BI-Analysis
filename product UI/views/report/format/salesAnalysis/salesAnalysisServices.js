define(['app', 'ajaxService'], function (app) {

    app.register.service('salesAnalysisServices', ['ajaxService', function (ajaxService) {
        
        
        //获取最早统计时间
        this.getCoverage = function (salseQueryInfo, successFunction, errorFunction) {
            return ajaxService.AjaxPost(salseQueryInfo, "api/report/format/salesAnalysis/coverage.json", successFunction, errorFunction);
        };


        //获取查询内容
        this.searchData = function (salseQueryInfo, successFunction, errorFunction) {
            //模拟请求数据不同，有根据单位类型去加载不同请求.
            return ajaxService.AjaxPost(salseQueryInfo, "api/report/format/salesAnalysis/searchData.json", successFunction, errorFunction);
        };


        
        


    }]);
});