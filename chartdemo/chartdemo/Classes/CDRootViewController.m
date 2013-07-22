//
//  CDRootViewController.m
//  chartdemo
//
//  Created by ANS MI0002 Vincent on 2013/07/22.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "CDRootViewController.h"
#import "CDPopulationChartView.h"

@interface CDRootViewController ()

@property (nonatomic, assign) CDPopulationChartView *chartView;

@end

@implementation CDRootViewController

#pragma mark - NSObject

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    //
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    [titleLable setText:@"WORLD\nPOPULATION"];
    [titleLable setTextAlignment:NSTextAlignmentCenter];
    [titleLable setFont:[UIFont fontWithName:@"ProximaNova-Bold" size:25]];
    [titleLable setNumberOfLines:2];
    
    _chartView = [[CDPopulationChartView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 100)];
    
    [self.view addSubview:titleLable];
    [self.view addSubview:_chartView];
    
    [titleLable release];
    [_chartView release];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
