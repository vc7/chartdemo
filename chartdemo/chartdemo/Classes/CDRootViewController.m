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
    
    _chartView = [[CDPopulationChartView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    
    [self.view addSubview:_chartView];
    
    
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
