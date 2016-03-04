define(['app', 'ajaxService'], function (app) {

    app.register.service('ownerTypeServices', ['ajaxService', function (ajaxService) {
        
        //获取区域范围
        this.getCoverage = function (salseQueryInfo, successFunction, errorFunction) {
//        	return ajaxService.AjaxFormPost(salseQueryInfo, "api/report/customer/ownerType/coverage.json", successFunction, errorFunction);
        	return ajaxService.AjaxFormPost(salseQueryInfo, "report/product/turnoverProduct", successFunction, errorFunction);
        };
        
        //根据区域代码加载公司
        this.getCompanys = function(params, successFunction, errorFunction) {
        	return ajaxService.AjaxFormPost(params, "report/product/getCompany", successFunction, errorFunction);
        }

        //获取查询内容
        this.searchData = function (salseQueryInfo, successFunction, errorFunction) {
//        	return ajaxService.AjaxFormPost(salseQueryInfo, "reports/searchData.json", successFunction, errorFunction);
        	return ajaxService.AjaxFormPost(salseQueryInfo, "reports/ownerTypeData", successFunction, errorFunction);
        };

        //获取购买次数图形数据
        this.getBuyTimesData = function(params, successFunction, errorFunction) {
        	return ajaxService.AjaxFormPost(params, "reports/getBuyTimesData", successFunction, errorFunction);
        }
        


    }]);
});