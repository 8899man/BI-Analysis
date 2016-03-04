define(['app', 'ajaxService'], function (app) {

    app.register.service('salesQuery', ['ajaxService', function (ajaxService) {
        

        this.getSalesQuery = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/salesQuery/salesQuery.json", successFunction, errorFunction);
        };


    }]);
});