define(['app', 'ajaxService'], function (app) {

    app.register.service('labelLocalServices', ['ajaxService', function (ajaxService) {
        
        //获取标签列表
        this.getList = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "labelLocal/labelLocalList", successFunction, errorFunction);
        };
        
         //保存标签
        this.saveLabel = function (labelInfo, successFunction, errorFunction) {
            ajaxService.AjaxFormPostNoBlock(labelInfo, "label/saveLabel", successFunction, errorFunction);
        };

        //获取特征
        this.getConditions = function (info, successFunction, errorFunction) {
            ajaxService.AjaxFormPostNoBlock(info, "label/queryTemplate", successFunction, errorFunction);
        };
        
        //获取标签详情
        this.getStorageConditions = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "labelLocal/labelDetail", successFunction, errorFunction);
        };
        
        //删除所有标签
        this.deleteAllLabels = function (info, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(info, "labelLocal/labelDelete", successFunction, errorFunction);
        };

        //删除已选标签
        this.deleteAddedLabels = function (info, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(info, "labelLocal/labelDelete", successFunction, errorFunction);
        };

        //数据提取预览
//        this.getDataModal = function (info, successFunction, errorFunction) {
//            ajaxService.AjaxFormPost(info, "api/labelLocal/getDataPersons.json", successFunction, errorFunction);
//        };
        
        
        
        this.getDataModal = function (info, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(info, "label/getCustomerByLabel", successFunction, errorFunction);
        };
        
        
        //导出Execl
        this.customerExport = function (info, successFunction, errorFunction) {
        	ajaxService.AjaxDownload(info, "label/labelExport", successFunction, errorFunction);
        }
    }]);
});