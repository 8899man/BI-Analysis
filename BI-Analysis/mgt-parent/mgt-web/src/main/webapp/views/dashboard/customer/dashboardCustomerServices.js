define(['app', 'ajaxService'], function (app) {

    app.register.service('dashboardCustomerServices', ['ajaxService', function (ajaxService) {
        

        
        
        //获取数据
        this.getData = function (info, successFunction, errorFunction) {
            //ajaxService.AjaxPost(info, "api/dashboard/dataCustomer.json", successFunction, errorFunction);
            
            ajaxService.AjaxFormPost(info, "dashboard/customer", successFunction, errorFunction);
        };


        
        


    }]);
});