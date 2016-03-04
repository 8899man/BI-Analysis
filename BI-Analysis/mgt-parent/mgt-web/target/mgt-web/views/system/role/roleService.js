define(['app', 'ajaxService'], function (app) {

    app.register.service('roleService', ['ajaxService', function (ajaxService) {
		
		this.roleTypeList   = [ {
			"id":1,"name":"集团"
			},{
			"id":2,"name":"区域"
			},{
			"id":3,"name":"地市公司"
			}];
			
		
		
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
		
		this.listToMap   =  function(list){
			var obj = {}
			for(var i=0, len=list.length; i<len; i++){
				obj[list[i].id] = list[i].name
			}
			return obj;
		};
		
		this.roleTypeMap   =  this.listToMap(this.roleTypeList);
		
		this.setOrgMap= function(map){
			this.orgMap = map;
		};
		
        this.createRole = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/roleAdd", successFunction, errorFunction);
        };

        this.deleteRole = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/roleDelete", successFunction, errorFunction);
        };

        this.updateRole = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/roleEdit", successFunction, errorFunction);
        };
		
        this.updateRolePower = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/roleEditPower", successFunction, errorFunction);
        };
		

        this.getRoles = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/roleList", successFunction, errorFunction);
        };

		this.getRole = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/roleDetail", successFunction, errorFunction);
        };
		
		this.getOrgTree = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/orgTree", successFunction, errorFunction);
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