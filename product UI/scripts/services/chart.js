define(['app', 'jquery'], function (app){
	app.register.factory("charts", function(){
		return {
			pie1: function(opts){
				var defaultOpts = {
					"options": {
						chart: {
				            plotBackgroundColor: null,
				            plotBorderWidth: null,
				            plotShadow: false
				        },
				        colors:['#f99506', '#f74c4c', '#26a9e3', '#2f7ed8', '#0d233a', '#8bbc21', '#910000', '#1aadce', 
		   '#492970', '#f28f43', '#77a1e5', '#c42525', '#a6c96a'],
				        title: {
				            text: null
				        },
						"credits": {
							"enabled": false
						},
				        tooltip: {
				    	    pointFormat: '{point.y}<br>{point.percentage:.1f}%'
				        },
				        plotOptions: {
				            pie: {
				                allowPointSelect: true,
				                cursor: 'pointer',
				                dataLabels: {
				                    enabled: false,
				                    distance: 2,
				                    //color: '#FF0000',
				                    //connectorColor: '#FF0000',
				                    formatter: function() {
				                        return '<b>'+ this.point.name +'</b>: '+ parseInt(this.percentage) +' %';
				                    }
				                }
				            }
				        }
					},
			        size: {
			        	"height": "160"
			        },
			        legend: {
			        	enabled: true
			        },
			        series: [
						{
							type: 'pie',
							data: []
						}
					]
				}
				defaultOpts.series[0].data = opts.data;
				//console.log(defaultOpts.series.data);
				//console.dir(defaultOpts);
				//angular.extend(defaultOpts.series.data, opts.data);
				return defaultOpts;
			},
			pie2: function(opts){
				
				var defaultOpts = {
					"options": {
						chart: {
				            plotBackgroundColor: null,
				            plotBorderWidth: null,
				            plotShadow: false
				        },
				        colors:['#ffff00', '#e1e1e1'],
				        title: {
				            text: null
				        },
				        "credits": {
							"enabled": false
						},
				        tooltip: {
				        	enabled: false,
				    	    pointFormat: '{point.y}<br>{point.percentage:.1f}%'
				        },
				        plotOptions: {
				            pie: {
				                allowPointSelect: false,
				                cursor: 'pointer',
				                dataLabels: {
				                    enabled: false,
				                    distance: 2,
				                    //color: '#FF0000',
				                    //connectorColor: '#FF0000',
				                    formatter: function() {
				                        return '<b>'+ this.point.name +'</b>: '+ parseInt(this.percentage) +' %';
				                    }
				                }
				            },
				            series: {
				                enableMouseTracking: false
				            }
				        }
					},
			        size: {
			        	"height": "160"
			        },
			        legend: {
			        	enabled: true
			        },
			        series: [
						{
							type: 'pie',
							innerSize: "85%",
							data: []
						}
					]
				}
				defaultOpts.series[0].data = opts.data;
				if(defaultOpts && defaultOpts.series && defaultOpts.series[0]){
					var num1 = defaultOpts.series[0].data[0][0];
					var num2 = defaultOpts.series[0].data[1][0];
					if(num1+num1==0){
						defaultOpts.series[0].data[1][0] = 1;
					}
					var total = num1 + num2;
					
					if(num1/total >= 0.2 && num1/total < 0.4){
						defaultOpts.options.colors = ['#28b778', '#e1e1e1']
					}else if(num1/total >= 0.4 && num1/total < 0.6){
						defaultOpts.options.colors = ['#f99506', '#e1e1e1']
					}else if(num1/total >= 0.6 && num1/total < 0.8){
						defaultOpts.options.colors = ['#2254a5', '#e1e1e1']
					}else if(num1/total >= 0.8){
						defaultOpts.options.colors = ['#f74c4c', '#e1e1e1']
					}else{
						defaultOpts.options.colors = ['#26a9e3', '#e1e1e1']
					}
				}
				return defaultOpts;
			},
			pie3: function(opts){
				var defaultOpts = {
					"options": {
						chart: {
				            plotBackgroundColor: null,
				            plotBorderWidth: null,
				            plotShadow: false
				        },
				        colors:['#26a9e3', '#28b778', '#e2c424', '#f99506', '#f74c4c', '#8356ab', '#910000', '#1aadce', 
		   '#492970', '#f28f43', '#77a1e5', '#c42525', '#a6c96a'],
				        title: {
				            text: null
				        },
				        "credits": {
							"enabled": false
						},
				        tooltip: {
				    	    pointFormat: '{point.y}<br>{point.percentage:.1f}%'
				        },
				        plotOptions: {
				            pie: {
				                allowPointSelect: true,
				                cursor: 'pointer',
				                dataLabels: {
				                    enabled: false,
				                    distance: 2,
				                    //color: '#FF0000',
				                    //connectorColor: '#FF0000',
				                    formatter: function() {
				                        return '<b>'+ this.point.name +'</b>: '+ parseInt(this.percentage) +' %';
				                    }
				                }
				            }
				        }
					},
			        size: {
			        	"height": "280"
			        },
			        legend: {
			        	enabled: true
			        },
			        series: [
						{
							type: 'pie',
							data: []
						}
					]
				}
				defaultOpts.series[0].data = opts.data;
				return defaultOpts;
			},
			column1: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							"type": opts.type || "column"
						},
						colors:opts.colors || ['#26a9e3'],
						"plotOptions": {
							"series": {
								"stacking": ""
							}
						},
						legend: {
				            enabled: false
				        },
				        xAxis: {
		                    categories: []
		                },
				        yAxis: {
				        	title: {
		                        text: null
		                    },
		                    min: 0
				        },
				        tooltip: {
		                    formatter: function() {
		                        return ''+
		                            this.x +': '+ this.y +' ';
		                    }
		                }
					},
					"series": [
						{
							"data": [],
							dataLabels: {
		                        enabled: true,
		                        rotation: 0,
		                        color: '#333',
		                        align: opts.align || 'center',
		                        x: 0,
		                        y: 0,
		                        style: {
		                            fontSize: '12px',
		                            fontFamily: 'Verdana, sans-serif',
		                            fontWeight: "normal"
		                        },
		                        allowOverlap: true
		                    }
						}
					],
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				defaultOpts.options.xAxis.categories = opts.categories;
				defaultOpts.series[0].data = opts.data;
				return defaultOpts;
			},
			column2: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							"type": "column"
						},
						colors:opts.colors || ['#26a9e3', '#28b778', '#e2c424', '#f74c4c'],
				        xAxis: {
		                    categories: opts.categories
		                },
				        yAxis: opts.yAxis || {
				        	title: {
		                        text: null
		                    },
		                    min: 0
				        }
					},
					"series": opts.series,
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				$.each(defaultOpts.series, function(index, item){
					item.dataLabels = {
                        enabled: true,
                        rotation: 0,
                        color: '#333',
                        align: 'center',
                        x: 0,
                        y: 0,
                        style: {
                            fontSize: '12px',
                            fontFamily: 'Verdana, sans-serif',
                            fontWeight: "normal"
                        },
                        allowOverlap: true
                    }
				})
				//defaultOpts.options.xAxis.categories = opts.categories;
				//defaultOpts.series[0].data = opts.data;
				return defaultOpts;
			},
			column3: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							"type": "column"
						},
						colors:['#28b778', '#f99506', '#54a9ea'],
				        xAxis: {
		                    categories: opts.categories
		                },
				        yAxis: {
				        	title: {
		                        text: null
		                    },
		                    min: 0
				        },
				        plotOptions: {
				            column: {
				                stacking: 'normal',
				                dataLabels: {
				                    enabled: true,
				                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
				                }
				            }
				        },
					},
					"series": opts.series,
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				//defaultOpts.options.xAxis.categories = opts.categories;
				//defaultOpts.series[0].data = opts.data;
				$.each(defaultOpts.series, function(index, item){
					item.dataLabels = {
                        enabled: false,
                        rotation: 0,
                        color: '#333',
                        align: 'center',
                        x: 0,
                        y: 0,
                        style: {
                            fontSize: '12px',
                            fontFamily: 'Verdana, sans-serif',
                            fontWeight: "normal"
                        },
                        allowOverlap: true
                    }
				})
				return defaultOpts;
			},
			column4: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							"type": "bar"
						},
						colors:['#fb6b22', '#f6c02c', '#70b94d', '#1aa4d5'],
				        xAxis: {
		                    categories: opts.categories
		                },
				        yAxis: {
				        	title: {
		                        text: null
		                    },
		                    min: 0
				        },
				        plotOptions: {
				            series: {
				                stacking: 'normal'
				            }
				        },
					},
					"series": opts.series,
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				//defaultOpts.options.xAxis.categories = opts.categories;
				//defaultOpts.series[0].data = opts.data;
				$.each(defaultOpts.series, function(index, item){
					item.dataLabels = {
                        enabled: false,
                        rotation: 0,
                        color: '#333',
                        align: 'center',
                        x: 0,
                        y: 0,
                        style: {
                            fontSize: '12px',
                            fontFamily: 'Verdana, sans-serif',
                            fontWeight: "normal"
                        },
                        allowOverlap: true
                    }
				})
				return defaultOpts;
			},
			column5: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							"type": opts.type || "column"
						},
						colors:['#26a9e3'],
						"plotOptions": {
							"series": {
								"stacking": ""
							}
						},
						legend: {
				            enabled: false
				        },
				        xAxis: {
		                    categories: opts.categories
		                },
				        yAxis: {
				        	title: {
		                        text: opts.yTitle || null
		                    },
		                    min: 0
				        },
				        tooltip: {
		                    formatter: function() {
		                        return ''+
		                            this.x +': '+ this.y +' ';
		                    }
		                }
					},
					"series": [
						{
							"data": [],
							dataLabels: {
		                        enabled: true,
		                        rotation: 0,
		                        color: '#333',
		                        align: opts.align || 'center',
		                        x: 0,
		                        y: 0,
		                        style: {
		                            fontSize: '12px',
		                            fontFamily: 'Verdana, sans-serif',
		                            fontWeight: "normal"
		                        },
		                        allowOverlap: true
		                    }
						}
					],
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				//defaultOpts.options.xAxis.categories = opts.categories;
				defaultOpts.series[0].data = opts.data;
				return defaultOpts;
			},
			area1: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							"type": "area"
						},
						colors:opts.colors || ['#f99506', '#28b778', '#26a9e3', '#5371c7'],
				        xAxis: {
		                    categories: opts.categories,
		                    labels:{
					        	style: {
									fontSize: "10px"
								}
					        }
		                },
				        yAxis: {
				        	title: {
		                        text: null
		                    }
				        },
				        plotOptions: {
				            series: {
				                stacking: 'normal'
				            }
				        },
					},
					"series": opts.series,
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				//defaultOpts.options.xAxis.categories = opts.categories;
				//defaultOpts.series[0].data = opts.data;
				$.each(defaultOpts.series, function(index, item){
					item.dataLabels = {
                        enabled: true,
                        rotation: 0,
                        color: '#333',
                        align: 'center',
                        x: 0,
                        y: 0,
                        style: {
                            fontSize: '12px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
				})
				return defaultOpts;
			},
			bar1: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							"type": "bar"
						},
						"plotOptions": {
							"series": {
								"stacking": ""
							}
						},
						legend: {
				            enabled: false
				        },
				        xAxis: {
		                    categories: []
		                },
				        yAxis: {
				        	min: 0,
		                    title: {
		                        text: '',
		                        align: 'high',
		                        style:{color:"#333",fontWeight:"normal"}
		                    },
		                    labels: {
		                        overflow: 'justify'
		                    },
		                    gridLineWidth:1,
		                    gridLineColor:"#E4E4E4",
		                    lineWidth:1,
		                    lineColor:"#E4E4E4"
				        },
				        tooltip: {
		                    formatter: function() {
		                        return ''+
		                            this.x +': '+ this.y +' ';
		                    }
		                }
					},
					"series": [
						{
							"data": [],
							dataLabels: {
		                        enabled: true,
		                        rotation: 0,
		                        color: '#333',
		                        x: 0,
		                        y: 0,
		                        style: {
		                            fontSize: '12px',
		                            fontFamily: 'Verdana, sans-serif'
		                        }
		                    }
						}
					],
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": "280"
					}

				};
				defaultOpts.options.xAxis.categories = opts.categories;
				defaultOpts.series[0].data = opts.data;
				return defaultOpts;
			},
			mix1: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							zoomType: 'xy'
						},
						colors:opts.colors || ['#26a9e3', '#28b778', '#e2c424', '#f74c4c', '#f99506', '#1a1d9d'],
				        xAxis: [{
				            categories: opts.categories
				        }],
				        yAxis: [{ // Secondary yAxis
				            title: {
				                text: (opts.yAxisTitle && opts.yAxisTitle[0]) || '',
				                rotation: 0
				                // style: {
				                //     color: '#4572A7'
				                // }
				            },
				            // labels: {
				            //     format: '{value} mm',
				            //     style: {
				            //         color: '#4572A7'
				            //     }
				            // },
				            opposite: true
				        },
				        { // Primary yAxis
				            // labels: {
				            //     format: '{value}'
				            // },
				            title: {
				                text: (opts.yAxisTitle && opts.yAxisTitle[1]) || '',
				                rotation: 0,
				            }
				        }],
					},
					"series": [],
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				$.each(opts.columnSeries, function(index, item){
					item.type = 'column';
					item.yAxis = 1;
					defaultOpts.series.push(item)
				});
				$.each(opts.splineSeries, function(index, item){
					item.type = 'spline';
					defaultOpts.series.push(item)
				});
				//defaultOpts.options.xAxis.categories = opts.categories;
				//defaultOpts.series[0].data = opts.data;
				return defaultOpts;
			},
			mix2: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							zoomType: 'xy'
						},
						colors:opts.colors || ['#26a9e3', '#28b778', '#e2c424', '#f74c4c', '#f99506', '#1a1d9d'],
				        xAxis: [{
				            categories: opts.categories
				        }],
				        yAxis: [{ // Secondary yAxis
				            title: {
				                text: null
				                // style: {
				                //     color: '#4572A7'
				                // }
				            },
				            // labels: {
				            //     format: '{value} mm',
				            //     style: {
				            //         color: '#4572A7'
				            //     }
				            // },
				            min: 0
				        },
				        { // Primary yAxis
				            // labels: {
				            //     format: '{value}'
				            // },
				            title: {
				                text: opts.yAxisTitle || null
				            },
				            min: 0
				        }],
					},
					"series": [],
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				$.each(opts.columnSeries, function(index, item){
					item.type = 'column';
					item.yAxis = 1;
					defaultOpts.series.push(item)
				});
				$.each(opts.splineSeries, function(index, item){
					//item.type = 'spline';
					item.yAxis = 1;
					defaultOpts.series.push(item)
				});
				//defaultOpts.options.xAxis.categories = opts.categories;
				//defaultOpts.series[0].data = opts.data;
				return defaultOpts;
			},
			mix3: function(opts){
				var defaultOpts = {
			
					"options": {
						"chart": {
							zoomType: 'xy'
						},
						colors:opts.colors || ['#26a9e3', '#28b778', '#e2c424', '#f74c4c', '#f99506', '#1a1d9d'],
				        xAxis: [{
				            categories: opts.categories
				        }],
				        yAxis: [{ // Secondary yAxis
				            title: {
				                text: (opts.yAxisTitle && opts.yAxisTitle[0]) || ''
				                // style: {
				                //     color: '#4572A7'
				                // }
				            },
				            // labels: {
				            //     format: '{value} mm',
				            //     style: {
				            //         color: '#4572A7'
				            //     }
				            // },
				            opposite: true
				        },
				        { // Primary yAxis
				            // labels: {
				            //     format: '{value}'
				            // },
				            title: {
				                text: (opts.yAxisTitle && opts.yAxisTitle[1]) || ''
				            }
				        }],
					},
					"series": [],
					"title": {
						"text": null
					},
					"credits": {
						"enabled": false
					},
					"size": {
						"height": opts.height || "280"
					}

				};
				$.each(opts.columnSeries, function(index, item){
					item.type = 'column';
					item.yAxis = 1;
					item.tooltip = {
						pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b>' + ((opts.units && opts.units[0]) || '') + '<br/>'
					}
					defaultOpts.series.push(item)
				});
				$.each(opts.splineSeries, function(index, item){
					//item.type = 'spline';
					item.tooltip = {
						pointFormat: '<span style="color:{point.color}">\u25CF</span> {series.name}: <b>{point.y}</b>' + ((opts.units && opts.units[1]) || '') + '<br/>'
					}
					defaultOpts.series.push(item)
				});
				//console.log(defaultOpts.series);
				//defaultOpts.options.xAxis.categories = opts.categories;
				//defaultOpts.series[0].data = opts.data;
				return defaultOpts;
			}
		}
	});



})