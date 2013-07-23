//
//  CDPopulationChartView.m
//  chartdemo
//
//  Created by Vincent on 2013/07/22.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "CDPopulationChartView.h"
@interface CDPopulationChartView () <CPTBarPlotDelegate, CPTBarPlotDataSource>

@property (nonatomic, assign) CPTGraphHostingView   *hostView;
@property (nonatomic, assign) CPTXYGraph            *graph;
@property (nonatomic, assign) CPTXYPlotSpace        *plotSpace;
@property (nonatomic, assign) CPTBarPlot            *barPlot;

- (void)configHostViewWithFrame:(CGRect)frame;
- (void)configAxisStyleWithGraph:(CPTXYGraph *)graph inPlotSpace:(CPTXYPlotSpace *)plotSpace;

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
          
        // Config 
        [self configHostViewWithFrame:frame];
        [self configGraphWithHostView:_hostView];
        [self configPlotSpaceWithGraph:_graph];
        [self configAxisStyleWithGraph:_graph inPlotSpace:_plotSpace];
        
        // Data Config
        
        _population = [NSArray arrayWithObjects:
                        [NSDecimalNumber numberWithInt:1141],
                        [NSDecimalNumber numberWithInt:849],
                        [NSDecimalNumber numberWithInt:250],
                        [NSDecimalNumber numberWithInt:178],
                        [NSDecimalNumber numberWithInt:150],
                        [NSDecimalNumber numberWithInt:108],
                        [NSDecimalNumber numberWithInt:116],
                        [NSDecimalNumber numberWithInt:94],
                        [NSDecimalNumber numberWithInt:148],
                        [NSDecimalNumber numberWithInt:124], nil];
                
        // Basic setting of chart
        
        _barPlot = [[CPTBarPlot alloc] initWithFrame:_graph.bounds];
        
        _barPlot.delegate = self;
        _barPlot.dataSource = self;
        _barPlot.baseValue = CPTDecimalFromString(@"0");
        _barPlot.identifier = @"Bar";
        _barPlot.borderWidth = 0;
        _barPlot.barCornerRadius = 4;
                
        // Put all together.
        
        [_graph addPlot:_barPlot toPlotSpace:_plotSpace];
        
        //
    }
    return self;
}

#pragma mark - Config Style
- (void)configHostViewWithFrame:(CGRect)frame
{
    _hostView = [[CPTGraphHostingView alloc] initWithFrame:frame];
    [self addSubview: _hostView];
}
- (void)configGraphWithHostView:(CPTGraphHostingView *)hostView
{
    _graph = [(CPTXYGraph *)[CPTXYGraph alloc] initWithFrame:_hostView.bounds];
    _graph.paddingLeft    = 40;
    _graph.paddingTop     = 0;
    _graph.paddingRight   = 30;
    _graph.paddingBottom  = 0;
    _graph.plotAreaFrame.masksToBorder = NO;
    
    _hostView.hostedGraph = _graph;
}
- (void)configPlotSpaceWithGraph:(CPTXYGraph *)graph
{
    _plotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
    
    _plotSpace.allowsUserInteraction = YES;
    [_plotSpace setYRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat( 0 ) length:CPTDecimalFromFloat( 1500 )]];
    [_plotSpace setXRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat( 0 ) length:CPTDecimalFromFloat( 12 )]];
}

- (void)configAxisStyleWithGraph:(CPTXYGraph *)graph inPlotSpace:(CPTXYPlotSpace *)plotSpace
{
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)_graph.axisSet;
    
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineColor            = [CPTColor colorWithCGColor:[[UIColor colorWithRed:22/255.f green:160/255.f blue:133/255.f alpha:1] CGColor]];
    lineStyle.lineWidth            = 1.0f;
    lineStyle.dashPattern          = [NSArray arrayWithObjects:[NSDecimalNumber numberWithInt:5],[NSDecimalNumber numberWithInt:5],nil];
    lineStyle.patternPhase=0.0f;
    
    CPTMutableTextStyle *axisTextStyle = [CPTMutableTextStyle textStyle];
    axisTextStyle.fontName = @"ProximaNova-Bold";
    axisTextStyle.color    = [CPTColor whiteColor];
    
    CPTXYAxis *xAxis = axisSet.xAxis;
    CPTXYAxis *yAxis = axisSet.yAxis;
    
    xAxis.plotSpace                     = plotSpace;
    xAxis.labelingPolicy                = CPTAxisLabelingPolicyNone;
    xAxis.orthogonalCoordinateDecimal   = CPTDecimalFromUnsignedInteger(0);
    xAxis.tickDirection                 = CPTSignNegative;
    xAxis.majorTickLength               = 9.0f;
    xAxis.minorTickLength               = 5.0f;
    xAxis.minorTickLineStyle            = lineStyle;
    xAxis.majorTickLineStyle            = lineStyle;
    xAxis.axisLineStyle                 = lineStyle;
    xAxis.labelTextStyle                = axisTextStyle;
    
    yAxis.plotSpace                     = plotSpace;
    yAxis.labelingPolicy                = CPTAxisLabelingPolicyAutomatic;
    yAxis.orthogonalCoordinateDecimal   = CPTDecimalFromUnsignedInteger(0);
    yAxis.minorTicksPerInterval         = 4;
    yAxis.tickDirection                 = CPTSignNegative;
    yAxis.majorGridLineStyle            = lineStyle;
    yAxis.titleTextStyle                = axisTextStyle;
    yAxis.titleOffset                   = -5;
    yAxis.labelTextStyle                = axisTextStyle;
    
    // ====== //
    
    NSArray *customTickLocations = [NSArray arrayWithObjects:
                                    [NSDecimalNumber numberWithInt:1],
                                    [NSDecimalNumber numberWithInt:2],
                                    [NSDecimalNumber numberWithInt:3],
                                    [NSDecimalNumber numberWithInt:4],
                                    [NSDecimalNumber numberWithInt:5],
                                    [NSDecimalNumber numberWithInt:6],
                                    [NSDecimalNumber numberWithInt:7],
                                    [NSDecimalNumber numberWithInt:8],
                                    [NSDecimalNumber numberWithInt:9],
                                    [NSDecimalNumber numberWithInt:10], nil];
    
    NSArray *xAxisLabels = [NSArray arrayWithObjects:
                            @"China",
                            @"India",
                            @"United States",
                            @"Indonesia",
                            @"Brazil",
                            @"Pakistan",
                            @"Bangladesh",
                            @"Nigeria",
                            @"Russia",
                            @"Japan",
                            nil];
    NSUInteger labelLocation = 0;
    NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:[xAxisLabels count]];
    
    for (NSNumber *tickLocation in customTickLocations) {
        CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText: [xAxisLabels objectAtIndex:labelLocation++] textStyle:xAxis.labelTextStyle];
        newLabel.tickLocation = [tickLocation decimalValue];
        newLabel.offset = xAxis.labelOffset + xAxis.majorTickLength - 10;
        newLabel.rotation = M_PI/4;
        [customLabels addObject:newLabel];
        [newLabel release];
    }
    
    xAxis.axisLabels =  [NSSet setWithArray:customLabels];
}

#pragma mark - CPTBarPlotDataSource

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plotnumberOfRecords {
    return 10;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    int x = index;

    
    switch (fieldEnum) {
        case CPTScatterPlotFieldX:
            return [NSNumber numberWithInt: x+1];
            break;
            
        case CPTScatterPlotFieldY:
            return [_population objectAtIndex:index];
            break;
    }
    return [NSDecimalNumber zero];
}

-(CPTFill *)barFillForBarPlot:(CPTBarPlot *)barPlot recordIndex:(NSUInteger)index
{
    if ([[_population objectAtIndex:index] integerValue]>500) {
        return [CPTFill fillWithColor:[CPTColor colorWithCGColor:[[UIColor colorWithRed:230/255.f
                                                                                  green:76/255.f
                                                                                   blue:60/255.f
                                                                                  alpha:1] CGColor]]];
    }
    return [CPTFill fillWithColor:[CPTColor colorWithCGColor:[[UIColor colorWithRed:230/255.f green:126/255.f blue:34/255.f alpha:1] CGColor]]];
}

-(CPTLineStyle *)barLineStyleForBarPlot:(CPTBarPlot *)barPlot recordIndex:(NSUInteger)index
{
    CPTMutableLineStyle *style = [CPTMutableLineStyle lineStyle];
    style.lineWidth = 0;
    return style;
}

#pragma mark - CPTBarPlotDelegate

- (void)barPlot:(CPTBarPlot *)plot barWasSelectedAtRecordIndex:(NSUInteger)index
{
    NSLog(@"%d",index);
}

#pragma mark - Data

- (void)setPopulation:(NSArray *)newPopulation
{
    _population = [newPopulation retain];
    [_barPlot reloadData];
}

@end
