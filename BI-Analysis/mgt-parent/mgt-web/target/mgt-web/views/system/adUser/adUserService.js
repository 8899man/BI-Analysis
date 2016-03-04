define(['app', 'ajaxService'], function (app) {

    app.register.service('adUserService', ['ajaxService', function (ajaxService) {
		
		this.adUserStateList   = [ {
			"id":1,"name":"正常"
			},{
			"id":2,"name":"冻结"
			},{
			"id":3,"name":"删除"
			}];
		
		this.adUserTypeList   = [ {
			"id":1,"name":"集团管理员"
			},{
			"id":2,"name":"区域管理员"
			},{
			"id":3,"name":"地市公司管理员"
			},{
			"id":4,"name":"员工"
			}];
					
					
	   	this.listToMap   =  function(list){
			var obj = {}
			for(var i=0, len=list.length; i<len; i++){
				obj[list[i].id] = list[i].name
			}
			return obj;
		};
		
		this.adUserStateMap   = this.listToMap(this.adUserStateList); 
			
		this.adUserTypeMap   = this.listToMap(this.adUserTypeList);  
		

		
        this.createAdUser = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/adUserAdd", successFunction, errorFunction);
        };

        this.deleteAdUser = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/adUserDelete", successFunction, errorFunction);
        };

        this.updateAdUser = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/adUserEdit", successFunction, errorFunction);
        };
		
		
		this.updateDataPower = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/adUserDataPowerEdit", successFunction, errorFunction);
        };
		
        this.getAdUsers = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/adUserList", successFunction, errorFunction);
        };

		this.getAdUser = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/adUserDetail", successFunction, errorFunction);
        };
		
		this.getAdOrgTree = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/adOrgTree", successFunction, errorFunction);
        };
		
		this.getSysRoleList = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/sysRoleList", successFunction, errorFunction);
        };
		
		
		this.getAdUserTypeList = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/adUserTypeList", successFunction, errorFunction);
        };
		
		this.checkAllOK = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxPost(reqdata, "system/checkAllOK", successFunction, errorFunction);
        };
		
		this.checkOneOK = function (reqdata, successFunction, errorFunction) {
            ajaxService.AjaxFormPost(reqdata, "system/checkOneOK", successFunction, errorFunction);
        };
		
		
		this.setAdUserTypeList= function(list){
			this.adUserTypeList = list;
			this.adUserTypeMap   = this.listToMap(this.adUserTypeList); 
		};
		
		this.setSysRoleList= function(list){
			this.sysRoleList = list;
		};
		
        this.exportAdUser = function (reqdata) {
            ajaxService.AjaxDownload(reqdata, "system/adUserExport");
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
