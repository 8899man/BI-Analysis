define(['app', 'ajaxService'], function (app) {

    app.register.service('clientShowServices', ['ajaxService', function (ajaxService) {
        
        //获取页面数据
        this.getData = function (info, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(info, "customer/clientShow", successFunction, errorFunction);
        };

    }]);
});