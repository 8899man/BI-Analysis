define(['app', 'ajaxService'], function (app) {

    app.register.service('dashboardPurchasServices', ['ajaxService', function (ajaxService) {
        

        
        //获取数据
        this.getData = function (info, successFunction, errorFunction) {
            //ajaxService.AjaxPost(info, "api/dashboard/dataPurchas.json", successFunction, errorFunction);
            ajaxService.AjaxFormPost(info, "dashboard/purchas", successFunction, errorFunction);
        };


        
        


    }]);
});