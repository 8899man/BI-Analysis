define(['app', 'ajaxService'], function (app) {

    app.register.service('signinServices', ['ajaxService', function (ajaxService) {
        
        
        //登录
        this.login = function (info, successFunction, errorFunction) {
            return ajaxService.AjaxPostNoBlock(info, "api/signin/login.json", successFunction, errorFunction);
        };


    }]);
});