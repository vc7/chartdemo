//
//  CDRootViewController.m
//  chartdemo
//
//  Created by Vincent on 2013/07/22.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "CDRootViewController.h"
#import "CDRootView.h"

@interface CDRootViewController ()

@property (nonatomic, assign) CDRootView *rootView;

@end

@implementation CDRootViewController

#pragma mark - NSObject

- (void)dealloc
{
    [_rootView release];
    [super dealloc];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    _rootView = [[CDRootView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_rootView];
    [_rootView release];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:26/255.f green:188/255.f blue:156/255.f alpha:1]];    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    NSURL *url = [NSURL URLWithString:@"http://demovc.host56.com/population.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
        [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                            if (response.statusCode >= 200) {
                                                                //NSLog(@"IP Address: %@", [[JSON objectAtIndex:0] objectForKey:@"data"]);
                                                                [_rootView setData:JSON];
                                                            }
                                                        } failure:nil];
    
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
