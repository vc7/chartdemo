//
//  CDPanelView.m
//  chartdemo
//
//  Created by ANS MI0002 Vincent on 2013/07/23.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "CDPanelView.h"

@implementation CDPanelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor colorWithRed:44/255.f green:62/255.f blue:80/255.f alpha:1]]; // midnight blue rgb(44, 62, 80)
        
        UIColor *titleColor = [UIColor colorWithRed:22/255.f green:160/255.f blue:133/255.f alpha:1]; // green sea rgb(22, 160, 133)
        UIColor *titlehHighlightColor = [UIColor colorWithRed:26/255.f green:188/255.f blue:156/255.f alpha:1]; // green sea rgb(26, 188, 156)
        UIFont *font = [UIFont fontWithName:@"ProximaNova-Bold" size:20];
        
        UIButton *year1990Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [year1990Button setFrame:CGRectMake(0, 0, self.frame.size.width/3, 80)];
        [year1990Button setTitle:@"1990" forState:UIControlStateNormal];
        [year1990Button setTitleColor:titleColor forState:UIControlStateNormal];
        [year1990Button setTitleColor:titlehHighlightColor forState:UIControlStateHighlighted];
        [year1990Button setTag:0];
        [year1990Button.titleLabel setFont:font];
        [year1990Button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

        UIButton *year2008Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [year2008Button setFrame:CGRectMake(self.frame.size.width/3, 0, self.frame.size.width/3, 80)];
        [year2008Button setTitle:@"2008" forState:UIControlStateNormal];
        [year2008Button setTitleColor:titleColor forState:UIControlStateNormal];
        [year2008Button setTitleColor:titlehHighlightColor forState:UIControlStateHighlighted];
        [year2008Button setTag:1];
        [year2008Button.titleLabel setFont:font];
        [year2008Button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *year2025Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [year2025Button setFrame:CGRectMake(self.frame.size.width*2/3, 0, self.frame.size.width/3, 80)];
        [year2025Button setTitle:@"2025" forState:UIControlStateNormal];
        [year2025Button setTitleColor:titleColor forState:UIControlStateNormal];
        [year2025Button setTitleColor:titlehHighlightColor forState:UIControlStateHighlighted];
        [year2025Button setTag:2];
        [year2025Button.titleLabel setFont:font];
        [year2025Button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:year1990Button];
        [self addSubview:year2008Button];
        [self addSubview:year2025Button];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)click:(id)sender
{
    if ([_delegate respondsToSelector:@selector(panelView:didSelectWithTag:)])
    {
        [_delegate panelView:self didSelectWithTag:((UIButton *)sender).tag];
    }
}

@end
