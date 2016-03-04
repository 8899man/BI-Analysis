define(['app', 'ajaxService'], function (app) {

    app.register.service('clientBatchSearchServices', ['ajaxService', function (ajaxService) {

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
            ajaxService.AjaxPost(info, "api/clientBatchSearch/group.json", successFunction, errorFunction);
        };
        
        

        //获取查询客户画像client
        this.getClient = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/clientBatchSearch/client.json", successFunction, errorFunction);
        };

        //获取查询明细
        this.getDetails = function (info, successFunction, errorFunction) {
            ajaxService.AjaxPost(info, "api/clientBatchSearch/details.json", successFunction, errorFunction);
        };



        


    }]);
});