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
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    [titleLable setText:@"WORLD\nPOPULATION"];
    [titleLable setTextColor:[UIColor whiteColor]];
    [titleLable setTextAlignment:NSTextAlignmentCenter];
    [titleLable setFont:[UIFont fontWithName:@"ProximaNova-Bold" size:40]];
    [titleLable setNumberOfLines:2];
    [titleLable setBackgroundColor:[UIColor clearColor]];
    
    UILabel *subtitleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 50)];
    [subtitleLable setText:@"Top ten most populous countries (millions)"];
    [subtitleLable setTextColor:[UIColor whiteColor]];
    [subtitleLable setTextAlignment:NSTextAlignmentCenter];
    [subtitleLable setFont:[UIFont fontWithName:@"ProximaNova-Bold" size:12]];
    [subtitleLable setBackgroundColor:[UIColor clearColor]];
    
    _chartView = [[CDPopulationChartView alloc] initWithFrame:CGRectMake(9, 70, SCREEN_WIDTH, 150)];

    [self.view addSubview:titleLable];
    [self.view addSubview:subtitleLable];
    [self.view addSubview:_chartView];
    [self.view setBackgroundColor:[UIColor colorWithRed:26/255.f green:188/255.f blue:156/255.f alpha:1]];
    
    [titleLable release];
    [subtitleLable release];
    [_chartView release];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
