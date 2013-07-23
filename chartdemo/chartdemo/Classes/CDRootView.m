//
//  CDRootView.m
//  chartdemo
//
//  Created by ANS MI0002 Vincent on 2013/07/23.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "CDRootView.h"
#import "CDPopulationChartView.h"
#import "CDPanelView.h"

@interface CDRootView () <CDPanelViewDelegate>

@property (nonatomic, assign) UILabel       *titleLable;
@property (nonatomic, assign) UILabel       *subtitleLable;
@property (nonatomic, assign) CDPanelView   *panelView;

@end

@implementation CDRootView

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 120)];
        [_titleLable setText:@"WORLD\nPOPULATION"];
        [_titleLable setTextColor:[UIColor whiteColor]];
        [_titleLable setTextAlignment:NSTextAlignmentCenter];
        [_titleLable setFont:[UIFont fontWithName:@"ProximaNova-Bold" size:40]];
        [_titleLable setNumberOfLines:2];
        [_titleLable setBackgroundColor:[UIColor clearColor]];
        
        _subtitleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, frame.size.width, 50)];
        [_subtitleLable setText:@"Top ten most populous countries (millions)"];
        [_subtitleLable setTextColor:[UIColor whiteColor]];
        [_subtitleLable setTextAlignment:NSTextAlignmentCenter];
        [_subtitleLable setFont:[UIFont fontWithName:@"ProximaNova-Bold" size:12]];
        [_subtitleLable setBackgroundColor:[UIColor clearColor]];
        
        _chartView = [[CDPopulationChartView alloc] initWithFrame:CGRectMake(9, 75, frame.size.width, 150)];
        
        _panelView = [[CDPanelView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-100, self.frame.size.width, 80)];
        _panelView.delegate = self;
        
        [self addSubview:_titleLable];
        [self addSubview:_subtitleLable];
        [self addSubview:_chartView];
        [self addSubview:_panelView];
        
        [_titleLable release];
        [_subtitleLable release];
        [_chartView release];
        
    }
    return self;
}

#pragma mark - CDRootView
- (void)setData:(id)newData
{
    _data = [newData retain];
    //NSLog(@"%@",_data);
}

#pragma mark - CDPanelViewDelegate
- (void)panelView:(CDPanelView *)panelView didSelectWithTag:(NSInteger)tag
{
    [_chartView setPopulation:[[self.data objectAtIndex:tag] objectForKey:@"data"]];
}

@end
