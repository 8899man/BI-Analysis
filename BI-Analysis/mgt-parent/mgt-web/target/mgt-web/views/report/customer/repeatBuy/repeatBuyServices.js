define(['app', 'ajaxService'], function (app) {

    app.register.service('repeatBuyServices', ['ajaxService', function (ajaxService) {

        //获取查询内容
        this.searchData = function (salseQueryInfo, successFunction, errorFunction) {
            //模拟请求数据不同，有根据单位类型去加载不同请求.
//        	return ajaxService.AjaxPost(salseQueryInfo, "api/report/customer/repeatBuy/searchData" + (salseQueryInfo.unitType=='group'?'1':salseQueryInfo.unitType=='area'?'2':'3') + ".json", successFunction, errorFunction);
            return ajaxService.AjaxFormPost(salseQueryInfo, "reports/getRepeatBuyTiems", successFunction, errorFunction);
        };

    }]);
});