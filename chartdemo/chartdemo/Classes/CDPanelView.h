//
//  CDPanelView.h
//  chartdemo
//
//  Created by Vincent on 2013/07/23.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CDPanelView;

@protocol CDPanelViewDelegate <NSObject>

- (void)panelView:(CDPanelView *)panelView didSelectWithTag:(NSInteger)tag;

@end


@interface CDPanelView : UIView

@property (nonatomic, strong) id <CDPanelViewDelegate> delegate;

@end
