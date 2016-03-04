define(['app', 'jquery', 'chart'], function (app){

	app.register.filter('addDataKey', [function(){
		return function(arr){
			return {
				data: arr
			}
		}
	}]);


	app.register.filter('toPie1', ['charts', function(charts){
		return function(dataObj){
			return charts.pie1(dataObj);
		}
	}]);


	app.register.filter('toPie2', ['charts', function(charts){
		return function(dataObj){
			return charts.pie2(dataObj);
		}
	}]);

})