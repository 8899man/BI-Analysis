define(['app', 'ajaxService'], function (app) {

    app.register.service('salesAnalysisServices', ['ajaxService', function (ajaxService) {

        //获取查询内容
        this.searchData = function (salseQueryInfo, successFunction, errorFunction) {
            return ajaxService.AjaxFormPost(salseQueryInfo, "report/product/getYeTaiZhuanShuData", successFunction, errorFunction);
        };
        

    }]);
});