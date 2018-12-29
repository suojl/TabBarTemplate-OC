//
//  TWRViewController.m
//  ChartJS
//
//  Created by Michelangelo Chasseur on 21/04/14.
//  Copyright (c) 2014 Touchware. All rights reserved.
//

#import "TWRViewController.h"
#import "TWRChart.h"

@interface TWRViewController ()

@property(strong, nonatomic) TWRChartView *chartView;

@end

@implementation TWRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Charts";

    // Chart View
    _chartView = [[TWRChartView alloc] initWithFrame:CGRectMake(0, 200, 320, 300)];
    _chartView.backgroundColor = [UIColor clearColor];

    [self.view addSubview:_chartView];
    [self loadLineChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
*  Loads a line chart using native code
*/
- (void)loadLineChart {
    // Build chart data
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:@[@10, @15, @5, @15, @5]];
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:@[@5, @10, @5, @15, @10]];

    NSArray *labels = @[@"A", @"B", @"C", @"D", @"E"];

    TWRLineChart *line = [[TWRLineChart alloc] initWithLabels:labels
                                                     dataSets:@[dataSet1, dataSet2]
                                                     animated:NO];
    // Load data
    [_chartView loadLineChart:line];
}


@end
