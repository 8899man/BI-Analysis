define(['app', 'jquery', 'filters'], function (app){
	app.register.factory("dataToChartConfig", ['$filter', function($filter){
		return {
			dataToPie1Con: function(arr){
				 return $filter("toPie1")($filter("addDataKey")(arr));
			},
			dataToPie2Con: function(arr){
				angular.forEach(arr, function(item, index){
					//console.log(index + " : " + item);
					var charData = [[item.finished],[item.noFinished]]
					var chartConfig = $filter("toPie2")($filter("addDataKey")(charData));
					arr[index] = {
						title: item.title,
						finished: item.finished,
						total: item.finished + item.noFinished,
						percent: ((item.finished + item.noFinished)!=0?parseInt(item.finished/(item.finished + item.noFinished)*100):0) + '%',
						chartConfig: chartConfig
					}
				});
			}
		}
	}])
})