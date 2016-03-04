define(['app', 'ajaxService'], function (app) {

    app.register.service('clientSearchServices', ['ajaxService', function (ajaxService) {

        //用来通过id保存已经加载的客户数据
        this.clientFromId = {};

        //通过id来设置client
        this.setClientFromId = function(id, client){
            this.clientFromId[id] = client;
        }

        this.getClientFromId = function(id){
            return this.clientFromId[id];
        }

        //获取组织架构
        this.getGroup = function (info, successFunction, errorFunction) {
        	ajaxService.AjaxPost(info, "customer/clientSearchInit", successFunction, errorFunction);
        	//ajaxService.AjaxPost(info, "api/clientSearch/group.json", successFunction, errorFunction);
        };
        
        
        //获取查询客户画像client
        this.getClient = function (info, successFunction, errorFunction) {
            //ajaxService.AjaxPost(info, "api/clientSearch/client.json", successFunction, errorFunction);
        	ajaxService.AjaxFormPostNoBlock(info, "customer/clientSearch", successFunction, errorFunction);
        };

        //获取查询明细
        this.getList = function (info, successFunction, errorFunction) {
            //ajaxService.AjaxFormPost(info, "api/clientSearch/details.json", successFunction, errorFunction);
        	ajaxService.AjaxFormPost(info, "customer/clientList", successFunction, errorFunction);
        };
        
        //导出Execl
        this.customerExport = function (info, successFunction, errorFunction) {
        	ajaxService.AjaxDownload(info, "customer/customerExport", successFunction, errorFunction);
        }



        


    }]);
});