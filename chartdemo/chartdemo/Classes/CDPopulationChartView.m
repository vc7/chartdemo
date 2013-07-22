//
//  CDPopulationChartView.m
//  chartdemo
//
//  Created by ANS MI0002 Vincent on 2013/07/22.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "CDPopulationChartView.h"
@interface CDPopulationChartView () <CPTBarPlotDelegate, CPTBarPlotDataSource>

@end

@implementation CDPopulationChartView

#pragma mark - NSObject

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
          
        // Init host view 
        CPTGraphHostingView* hostView = [[CPTGraphHostingView alloc] initWithFrame:frame];
        [self addSubview: hostView];
        
        // Init Graph Area and add to the hostView
        graph = [(CPTXYGraph *)[CPTXYGraph alloc] initWithFrame:hostView.bounds];
        hostView.hostedGraph = graph;
        graph.paddingLeft    = 20.0;
        graph.paddingTop     = 20.0;
        graph.paddingRight   = 20.0;
        graph.paddingBottom  = 20.0;
        
        //
        
        CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
        
        plotSpace.allowsUserInteraction = YES;
        [plotSpace setYRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat( 0 ) length:CPTDecimalFromFloat( 16 )]];
        [plotSpace setXRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat( 0 ) length:CPTDecimalFromFloat( 9 )]];
        
        //
        // Axes Line Style
        
        
        // Styling
        CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
        
        CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
        lineStyle.lineColor            = [CPTColor grayColor];
        lineStyle.lineWidth            = 2.0f;
        
        CPTXYAxis *xAxis = axisSet.xAxis;
        CPTXYAxis *yAxis = axisSet.yAxis;
        
        xAxis.plotSpace                     = plotSpace;
        xAxis.labelingPolicy                = CPTAxisLabelingPolicyAutomatic;
        xAxis.orthogonalCoordinateDecimal   = CPTDecimalFromUnsignedInteger(0);
        xAxis.tickDirection                 = CPTSignNone;
        xAxis.majorTickLength               = 9.0f;
        xAxis.minorTickLength               = 5.0f;
        xAxis.minorTickLineStyle            = lineStyle;
        xAxis.majorTickLineStyle            = lineStyle;
        xAxis.axisLineStyle                 = lineStyle;
        
        yAxis.plotSpace                     = plotSpace;
        yAxis.labelingPolicy                = CPTAxisLabelingPolicyAutomatic;
        yAxis.orthogonalCoordinateDecimal   = CPTDecimalFromUnsignedInteger(0);
        yAxis.minorTicksPerInterval         = 4;
        yAxis.tickDirection                 = CPTSignNone;
        yAxis.majorTickLength               = 9.0f;
        yAxis.minorTickLength               = 5.0f;
        yAxis.majorTickLineStyle            = lineStyle;
        yAxis.minorTickLineStyle            = lineStyle;
        yAxis.axisLineStyle                 = lineStyle;
        

        // Basic setting of chart
        
        CPTBarPlot *barPlot = [[CPTBarPlot alloc] initWithFrame:graph.bounds];
        
        barPlot.dataSource = self;
        barPlot.baseValue = CPTDecimalFromString(@"0");
        barPlot.identifier = @"Bar";
        barPlot.fill = [CPTFill fillWithColor:[CPTColor brownColor]];
        
        [graph addPlot:barPlot toPlotSpace:plotSpace];        
    }
    return self;
}


#pragma mark - CPTBarPlotDataSource

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plotnumberOfRecords {
    return 6; 
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    int x = index;
    return [NSNumber numberWithInt: x];
    
}

@end
