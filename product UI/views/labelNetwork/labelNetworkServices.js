define(['app', 'ajaxService'], function (app) {

    app.register.service('labelNetworkServices', ['ajaxService', function (ajaxService) {
        
        //获取标签列表
        this.getList = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/labelNetwork/labelNetworkList.json", successFunction, errorFunction);
        };

        //删除数据提取预览
        this.getDataModal = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/labelNetwork/getDataPersons.json", successFunction, errorFunction);
        };

    }]);
});