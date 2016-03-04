define(['app', 'ajaxService'], function (app) {

    app.register.service('dashboardSalesServices', ['ajaxService', function (ajaxService) {
        

        
        //获取数据
        this.getData = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/dashboard/dataSales.json", successFunction, errorFunction);
        };


        
        


    }]);
});