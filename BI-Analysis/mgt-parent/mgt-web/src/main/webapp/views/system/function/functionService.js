define(['app', 'ajaxService'], function (app) {

    app.register.service('functionService', ['ajaxService', function (ajaxService) {

		
	this.functionStateList   = [ {
			"id":1,"name":"正常"
			},{
			"id":2,"name":"冻结"
			}];

	this.listToMap   =  function(list){
			var obj = {}
			for(var i=0, len=list.length; i<len; i++){
				obj[list[i].id] = list[i].name
			}
			return obj;
		};
			
	this.functionStateMap   =  this.listToMap(this.functionStateList);
		
        this.createFunction = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/functionAdd", successFunction, errorFunction);
        };

        this.deleteFunction = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/functionDelete", successFunction, errorFunction);
        };

        this.updateFunction = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/functionEdit", successFunction, errorFunction);
        };

        this.getFunctions = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/functionList", successFunction, errorFunction);
        };

	this.getFunction = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/functionDetail", successFunction, errorFunction);
        };

	this.exportfunction = function (reqdata) {
            ajaxService.AjaxDownload(reqdata, "system/functionExport");
        };
		
    }]);
});
