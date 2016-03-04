define(['app', 'ajaxService'], function (app) {

    app.register.service('menuService', ['ajaxService', function (ajaxService) {

		
	this.menuTargetList   = [ {
			"id":1,"name":"本地"
			},{
			"id":2,"name":"嵌入"
			},{
			"id":3,"name":"外链"
			}];

	this.listToMap   =  function(list){
			var obj = {}
			for(var i=0, len=list.length; i<len; i++){
				obj[list[i].id] = list[i].name
			}
			return obj;
		};
			
		this.menuTargetMap   =  this.listToMap(this.menuTargetList);
		
        this.createMenu = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/menuAdd", successFunction, errorFunction);
        };

        this.deleteMenu = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/menuDelete", successFunction, errorFunction);
        };

        this.updateMenu = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/menuEdit", successFunction, errorFunction);
        };

        this.getMenus = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/menuList", successFunction, errorFunction);
        };

		this.getMenu = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/menuDetail", successFunction, errorFunction);
        };

		this.exportMenu = function (reqdata) {
            ajaxService.AjaxDownload(reqdata, "system/menuExport");
        };
		
    }]);
});
