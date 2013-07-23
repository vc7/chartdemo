//
//  CDRootView.h
//  chartdemo
//
//  Created by ANS MI0002 Vincent on 2013/07/23.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CDPopulationChartView;

@interface CDRootView : UIView

@property (nonatomic, assign) id data;
@property (nonatomic, assign) CDPopulationChartView *chartView;

@end
