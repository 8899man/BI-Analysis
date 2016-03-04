define(['app', 'ajaxService'], function (app) {

    app.register.service('labelLocalServices', ['ajaxService', function (ajaxService) {
        
        //获取标签列表
        this.getList = function (salseQueryInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(salseQueryInfo, "api/labelLocal/labelLocalList.json", successFunction, errorFunction);
        };

        //保存标签
        this.saveLabel = function (labelInfo, successFunction, errorFunction) {
            ajaxService.AjaxPost(labelInfo, "api/labelLocal/saveLabelLocal.json", successFunction, errorFunction);
        };

        //获取特征
        this.getConditions = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/labelLocal/conditions.json", successFunction, errorFunction);
        };

        //删除所有标签
        this.deleteAllLabels = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/labelLocal/deleteAllLabels.json", successFunction, errorFunction);
        };


        //删除已选标签
        this.deleteAddedLabels = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/labelLocal/deleteAddedLabels.json", successFunction, errorFunction);
        };

        //删除数据提取预览
        this.getDataModal = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/labelLocal/getDataPersons.json", successFunction, errorFunction);
        };


    }]);
});