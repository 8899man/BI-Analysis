define(['app', 'ajaxService'], function (app) {

    app.register.service('bOrgService', ['ajaxService', function (ajaxService) {

	this.typeList   = [ {
			"id":1,"name":"代理公司"
			},{
			"id":2,"name":"中介公司"
			},{
			"id":3,"name":"区域公司/事业部"
			},{
			"id":4,"name":"商场"
			},{
			"id":5,"name":"商铺"
			},{
			"id":6,"name":"门店"
			}];
			
			
	this.subTypeList   = [ {
			"id":1,"name":"集团公司"
			},{
			"id":5,"name":"业态公司"
			},{
			"id":2,"name":"区域公司"
			},{
			"id":3,"name":"地市公司"
			},{
			"id":4,"name":"部门"
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
			
			
		this.subTypeMap   =  this.listToMap(this.subTypeList);
		
		this.typeMap   =  this.listToMap(this.typeList);
		
		
        this.createBOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/bOrgAdd", successFunction, errorFunction);
        };

        this.deleteBOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/bOrgDelete", successFunction, errorFunction);
        };

        this.updateBOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/bOrgEdit", successFunction, errorFunction);
        };

        this.getBOrgs = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/bOrgList", successFunction, errorFunction);
        };

	this.getBOrg = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/bOrgDetail", successFunction, errorFunction);
        };

	this.exportBOrg = function (reqdata) {
            ajaxService.AjaxDownload(reqdata, "system/bOrgExport");
        };
		
		
			this.setOrgList= function(list){
			this.orgList = list;
		};
		
	this.setOrgList= function(list){
			this.orgList = list;
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
