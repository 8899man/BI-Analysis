define(['app', 'ajaxService'], function (app) {

    app.register.service('signinServices', ['ajaxService', function (ajaxService) {
        
        
        //登录
        this.login = function (info, successFunction, errorFunction) {
        	return ajaxService.AjaxFormPostNoBlock(info, "auth/login", successFunction, errorFunction);
        	
            //return ajaxService.AjaxPost(info, "api/signin/login.json", successFunction, errorFunction);
        };


    }]);
});