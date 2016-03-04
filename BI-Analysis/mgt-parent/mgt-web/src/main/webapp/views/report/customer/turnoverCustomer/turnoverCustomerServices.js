define(['app', 'ajaxService'], function (app) {

    app.register.service('turnoverCustomerServices', ['ajaxService', function (ajaxService) {
        
//        //获取区域范围
//        this.getCoverage = function (salseQueryInfo, successFunction, errorFunction) {
//            return ajaxService.AjaxPost(salseQueryInfo, "api/report/customer/turnoverCustomer/coverage.json", successFunction, errorFunction);
//        };

        //获取查询内容
        this.searchData = function (salseQueryInfo, successFunction, errorFunction) {
            //模拟请求数据不同，有根据单位类型去加载不同请求.
//        	return ajaxService.AjaxPost(salseQueryInfo, "api/report/customer/turnoverCustomer/searchData" + (salseQueryInfo.unitType=='group'?'1':salseQueryInfo.unitType=='area'?'2':'3') + ".json", successFunction, errorFunction);
            return ajaxService.AjaxFormPost(salseQueryInfo, "reports/turnoverCustomerData", successFunction, errorFunction);
        };


        
        


    }]);
});