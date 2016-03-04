define(['app', 'ajaxService'], function (app) {

    app.register.service('industryService', ['ajaxService', function (ajaxService) {

		
	this.industryTypeList   = [ {
			"id":1,"name":"系统角色"
			},{
			"id":2,"name":"案场角色"
			}];

	this.listToMap   =  function(list){
			var obj = {}
			for(var i=0, len=list.length; i<len; i++){
				obj[list[i].id] = list[i].name
			}
			return obj;
		};

	this.mapToList   =  function(map){
		    var list=[];
			for(var key in map){
				var obj = {};
				obj.id = parseInt(key);
				obj.name=map[key];
				list.push(obj);
			}
			return list;
	};
			
	this.industryTypeMap   =  this.listToMap(this.industryTypeList);
		
        this.createIndustry = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/industryAdd", successFunction, errorFunction);
        };

        this.deleteIndustry = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/industryDelete", successFunction, errorFunction);
        };

        this.updateIndustry = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/industryEdit", successFunction, errorFunction);
        };

        this.getIndustrys = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/industryList", successFunction, errorFunction);
        };

	    this.getIndustry = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/industryDetail", successFunction, errorFunction);
        };
		
		this.updateIndustryOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/industryUpdateOrg", successFunction, errorFunction);
        };

	    this.exportIndustry = function (reqdata) {
            ajaxService.AjaxDownload(reqdata, "system/industryExport");
        };
		
    }]);
});
