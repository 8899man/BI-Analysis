define(['app', 'ajaxService'], function (app) {

    app.register.service('projectShowServices', ['ajaxService', function (ajaxService) {
        
        //获取页面数据
        this.getData = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/projectShow/data.json", successFunction, errorFunction);
        };

        //获取成交分布下钻数据
        this.getDeal = function (info, successFunction, errorFunction) {
        	//console.log("is: " + (info.type=="area"?"City":"Project"));
        	//这边根据info.type是area还是city去模拟是区域下钻到城市列表，还是城市下钻到项目列表
        	//alert(info.type);
        	if(info.type=="area"){
        		ajaxService.AjaxFormPostNoBlock(info, "rptProjComplete/cityData", successFunction, errorFunction);
        	}else if(info.type=="city"){
        		ajaxService.AjaxFormPostNoBlock(info, "rptProjComplete/projectData", successFunction, errorFunction);
        	}  
        };
        
        this.projectShow = function (info, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(info, "rptProjComplete/projComplete", successFunction, errorFunction);
        };
        
        


    }]);
});