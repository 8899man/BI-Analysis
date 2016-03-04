require.config({
    baseUrl: "",
    urlArgs: 'ver=' + (+new Date()),
    waitSeconds: 0,
    paths: {
        'app': 'scripts/app',
        'util': 'scripts/util',
        'config': 'scripts/config',
        'angular': 'vender/angular-1.2.28/angular.min',
        'angular-ui-router': 'scripts/angular-ui-router',
        'angularAMD': 'scripts/angularAMD',
        'ngAnimate': 'vender/angular-1.2.28/angular-animate.min',
        'jquery': 'vender/jquery/jquery-1.9.1.min',
        'ui-bootstrap': 'scripts/ui-bootstrap-tpls-0.11.0',
        'angular-sanitize': 'vender/angular-1.2.28/angular-sanitize',
        'blockUI': 'scripts/angular-block-ui.min',
        'highstock': 'scripts/highstock.src',
        'highcharts-ng': 'scripts/highcharts-ng',
        'chart': 'scripts/services/chart',
        'directives': 'scripts/directives/directives',
        'filters': 'scripts/filter/filters',
        'dataToChartConfig': 'scripts/services/dataToChartConfig',
        'ajaxService': 'scripts/services/ajaxServices',
        
        'tableToExcel': 'scripts/services/tableToExcel',
        'htmltoexcel': 'scripts/services/htmltoexcel',
        
        'tableExport': 'vender/jquery-tableexport/tableExport',
        'mybase64': 'vender/jquery-tableexport/mybase64',
        
        'toastr': 'scripts/angular-toastr.min',
        'salesQuery': 'scripts/services/salesQuery',
        'widget': 'scripts/widget',
        'window': 'scripts/window',
        'slider': 'vender/angular-1.2.28/slider',
        'WdatePicker': 'vender/My97DatePicker/WdatePicker',


        'labelNetworkServices': 'views/labelNetwork/labelNetworkServices',
        'labelLocalServices': 'views/labelLocal/labelLocalServices',
        
        	
        'clientSearchService':'views/clientSearch/clientSearchService',
        'clientDetailsService':'views/clientDetails/clientDetailsService',
        
        'projectHouseListService': 'views/projectHouseList/projectHouseListService',
        'projectDetailsService':'views/projectDetails/projectDetailsService',
        
        "houseDetailService": "views/houseDetails/houseDetailsService",
        "salesQueryService": "views/salesQuery/salesQueryService",
        
        'customerClassifyServices': 'views/marketing/customerClassify/customerClassifyServices',
        'investmentCustomerServices': 'views/marketing/investmentCustomer/investmentCustomerServices',
        'directedServices': 'views/marketing/directed/directedServices',
        
        'ownerTypeServices': 'views/report/customer/ownerType/ownerTypeServices',
        'turnoverCustomerServices': 'views/report/customer/turnoverCustomer/turnoverCustomerServices',
        'repeatBuyServices': 'views/report/customer/repeatBuy/repeatBuyServices',
        'turnoverProductServices': 'views/report/product/turnoverProduct/turnoverProductServices',
        'salesAnalysisServices': 'views/report/format/salesAnalysis/salesAnalysisServices'

    },
    shim: {
        'angular-ui-router': ['angular'],
        'slider': ['angular', 'jquery'],
        'angular': ['jquery'],
        'util': ['angular'],
        'angularAMD': ['angular'],
        'ngAnimate': ['angular'],
        'ui-bootstrap': ['angular'],
        'angular-sanitize': ['angular'],
        'blockUI': ['angular'],
        'highcharts-ng': ['highstock'],
        'chart': ['angular'],
        'directives': ['angular'],
        'filters': ['angular'],
        'dataToChartConfig': ['angular'],
        'highstock': ['jquery'],
        'highcharts-ng': ['highstock']
    },
    deps: ['app']
});