define(['app', 'ajaxService'], function (app) {

    app.register.service('adOrgService', ['ajaxService', function (ajaxService) {

		
	this.stateList   = [ {
			"id":1,"name":"正常"
			},{
			"id":2,"name":"冻结"
			}];

	this.checkList   = [ {
			"id":0,"name":"待批"
			},{
			"id":1,"name":"已批"
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
			
	this.stateMap   =  this.listToMap(this.stateList);
	
	this.checkMap   =  this.listToMap(this.checkList);
		
        this.createAdOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/adOrgAdd", successFunction, errorFunction);
        };

        this.deleteAdOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/adOrgDelete", successFunction, errorFunction);
        };

        this.updateAdOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/adOrgEdit", successFunction, errorFunction);
        };
		
		this.checkAdOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/adOrgCheck", successFunction, errorFunction);
        };

        this.getAdOrgs = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/adOrgList", successFunction, errorFunction);
        };

		this.getAdOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/adOrgDetail", successFunction, errorFunction);
        };

		this.exportAdOrg = function (reqdata) {
            ajaxService.AjaxDownload(reqdata, "system/adOrgExport");
        };
		
 		this.getOrgTree = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/orgTree", successFunction, errorFunction);
        };
		
		this.setOrgList= function(list){
			this.orgList = list;
			this.orgMap = this.listToMap(list);
		};
		
		this.getTab= function(level){
				var str ="";
				for(var i=0, len=level-1; i<len; i++){
					str= str+"　";
				}
				str= str+"┣ ";
				return str;
		};
			
		this.treeToList= function(tree, level){
				
					if(tree==null || tree.length==0)
					{
						return null;
					}
	
					
					var arr = [], obj = null, level = level || 1;
					
					for(var i=0; i<tree.length; i++){
						obj = {};
	
						for(var k in tree[i]){
							if(k !== "children"){
								obj[k] = tree[i][k]
							}
						};
						obj.level = level;
						obj.name =this.getTab(level) + obj.text;
						obj.childrenSize = tree[i].children.length;
						arr.push(obj);
						
						if(tree[i].children && tree[i].children.length > 0){
							var list = this.treeToList(tree[i].children, level+1);
							for(var j=0, len=list.length; j<len; j++)
							{
								arr.push(list[j]);
							}
						}
					}
					
					return arr;
				}
		}]);
});
