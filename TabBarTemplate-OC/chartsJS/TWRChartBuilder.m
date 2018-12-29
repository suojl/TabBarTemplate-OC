//
//  TWRChartBuilder.m
//  ChartJS
//
//  Created by Michelangelo Chasseur on 21/04/14.
//  Copyright (c) 2014 Touchware. All rights reserved.
//

#import "TWRChartBuilder.h"
#import "TWRLineChart.h"
#import "TWRBarChart.h"
#import "TWRCircularChart.h"
#import "TWRDataSet.h"
#import "TWRDataSet+Strings.h"
#import "UIColor+HexString.h"

@interface TWRChartBuilder ()

+ (NSString *)buildLineChartStringForElement:(TWRLineChart *)element;
+ (NSString *)buildBarChartStringForElement:(TWRBarChart *)element;
+ (NSString *)buildCircularChartStringForElement:(TWRCircularChart *)element;

@end

@implementation TWRChartBuilder

+ (NSString *)buildChartWithElement:(id)element {
    __block NSString *retString;
    if ([element isKindOfClass:[TWRLineChart class]]) {
        retString = [self buildLineChartStringForElement:element];
    } else if ([element isKindOfClass:[TWRBarChart class]]) {
        retString = [self buildBarChartStringForElement:element];
    } else if ([element isKindOfClass:[TWRCircularChart class]]) {
        retString = [self buildCircularChartStringForElement:element];
    }

    return retString;
}

#pragma mark - Private API

+ (NSString *)buildLineChartStringForElement:(TWRLineChart *)element {
    __block NSString *retString;
    retString = @"Chart.defaults.global.defaultFontColor = '#999999'; Chart.defaults.global.defaultFontSize = 12;var lineChartData = {labels : [\"11.11\",\"11.12\",\"11.13\",\"11.14\",\"11.15\",\"11.16\",\"昨天\"],";
//    TWRLineChart *lineChart = (TWRLineChart *)element;
//    [lineChart.labels enumerateObjectsUsingBlock:^(NSString *label, NSUInteger idx, BOOL *stop) {
//        retString = [retString stringByAppendingString:[NSString stringWithFormat:@"\"%@\"", label]];
//        if (idx != lineChart.labels.count - 1) {
//            retString = [retString stringByAppendingString:@","];
//        } else {
//            // close the array
//            retString = [retString stringByAppendingString:@"],"];
//        }
//    }];
    retString = [retString stringByAppendingString:[NSString stringWithFormat:@"datasets : [{ data : %@, backgroundColor: 'rgba(255,94,132,0.1)',borderColor: 'rgba(255,94,132,1)',pointBackgroundColor :'rgba(255,94,132,1)', borderWidth: 1,pointRadius: 2,}]};",@"[35,19,10,21,32,12,23]"]];

    retString = [retString stringByAppendingString:@"var options = {title:{display: false}, layout: { padding: { left: 0, right: 20, top: 30, bottom: 0 }}, scales: { fontColor:'red', xAxes: [{ display:true, gridLines:{display:false,tickMarkLength:0,lineWidth:1,zeroLineWidth:1},ticks: {  beginAtZero:true,callback: function(value, index, values) {return value;}}}],yAxes: [{ display:true,gridLines:{display:true,tickMarkLength:0,lineWidth:1,zeroLineWidth:1,color: 'rgba(238, 238, 238, 1)'},ticks: {beginAtZero:true,stepSize:20,callback:function(value, index, values) {return '';}}}]},  legend: {display:false,},  animation: {duration: 0,onComplete: function() {var chartInstance = this.chart,ctx = chartInstance.ctx;ctx.font = Chart.helpers.fontString(10, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);ctx.textAlign = 'center';ctx.textBaseline = 'bottom';this.data.datasets.forEach(function(dataset, i) {var meta = chartInstance.controller.getDatasetMeta(i);meta.data.forEach(function(bar, index) {var data = dataset.data[index];ctx.fillText(data+\"分钟\", bar._model.x, bar._model.y - 5);});});}}}; "];
    retString = [retString stringByAppendingString:@"var myLine = new Chart(document.getElementById(\"canvas\").getContext(\"2d\"),{type : 'line',data : lineChartData,options : options});"];
    return retString;
}

+ (NSString *)buildBarChartStringForElement:(TWRBarChart *)element {
    __block NSString *retString;
    retString = @"var context = document.getElementById(\"canvas\").getContext(\"2d\"); var barChartData = { labels:[";
    TWRBarChart *barChart = (TWRBarChart *)element;
    [barChart.labels enumerateObjectsUsingBlock:^(NSString *label, NSUInteger idx, BOOL *stop) {
        retString = [retString stringByAppendingString:[NSString stringWithFormat:@"\"%@\"", label]];
        if (idx != barChart.labels.count - 1) {
            retString = [retString stringByAppendingString:@","];
        } else {
            // close the array
            retString = [retString stringByAppendingString:@"], datasets:["];
        }
    }];
    
    [barChart.dataSets enumerateObjectsUsingBlock:^(TWRDataSet *dataset, NSUInteger idx, BOOL *stop) {
        NSString *fillColorString = [dataset fillColorString];
        NSString *strokeColorString = [dataset strokeColorString];
        NSString *pointColorString = [dataset pointColorString];
        NSString *pointStrokeColorString = [dataset pointStrokeColorString];
        NSString *dataString = [dataset dataString];
        retString = [retString stringByAppendingString:[NSString stringWithFormat:@"{fillColor:%@,strokeColor:%@,pointColor:%@,pointStrokeColor:%@,data:%@}", fillColorString, strokeColorString, pointColorString, pointStrokeColorString, dataString]];
        if (idx != barChart.dataSets.count - 1) {
            retString = [retString stringByAppendingString:@","];
        } else {
            retString = [retString stringByAppendingString:@"]};"];
        }
    }];
    
    retString = [retString stringByAppendingString:[NSString stringWithFormat:@"var options = {animation:%@};", barChart.animated ? @"true" : @"false"]];
    retString = [retString stringByAppendingString:@"var myLine = new Chart(context).Bar(barChartData,options);"];
    return retString;
}

+ (NSString *)buildCircularChartStringForElement:(TWRCircularChart *)element {
    __block NSString *retString;
    retString = @"var context = document.getElementById(\"canvas\").getContext(\"2d\"); var pieChartData = [";
    TWRCircularChart *pieChart = (TWRCircularChart *)element;
    [pieChart.values enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
        retString = [retString stringByAppendingString:[NSString stringWithFormat:@"{value:%@, color:\"%@\"}",number, [(UIColor *)pieChart.colors[idx] hexString]]];
        if (idx != pieChart.values.count - 1) {
            retString = [retString stringByAppendingString:@","];
        } else {
            retString = [retString stringByAppendingString:@"];"];
        }
    }];
    retString = [retString stringByAppendingString:@"function onFinish(){document.getElementById('callback').click();};"];
    retString = [retString stringByAppendingString:[NSString stringWithFormat:@"var options = {animation:%@, onAnimationComplete:%@};", pieChart.animated ? @"true" : @"false", @"onFinish"]];
    
    // Doughnut or Pie
    if (pieChart.type == TWRCircularChartTypePie) {
        retString = [retString stringByAppendingString:@"var myLine = new Chart(context).Pie(pieChartData, options);"];
    } else if (pieChart.type == TWRCircularChartTypeDoughnut) {
        retString = [retString stringByAppendingString:@"var myLine = new Chart(context).Doughnut(pieChartData,options);"];
    }
    
    return retString;
}

@end
