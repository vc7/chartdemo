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

@property (nonatomic, assign) CDRootView    *rootView;
@property (nonatomic, assign) UILabel       *offLineLabel;
@property (nonatomic, assign) UILabel       *fakeHUDLabel;

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
    [_rootView setHidden:TRUE];
    
    _offLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_offLineLabel setText:@"Somebody just ate the cable!!!\nPlease try again."];
    [_offLineLabel setTextColor:[UIColor whiteColor]];
    [_offLineLabel setBackgroundColor:[UIColor clearColor]];
    [_offLineLabel setTextAlignment:NSTextAlignmentCenter];
    [_offLineLabel setNumberOfLines:2];
    [_offLineLabel setFont:[UIFont fontWithName:@"ProximaNova-Bold" size:20]];
    [_offLineLabel setHidden:TRUE];
    
    _fakeHUDLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_fakeHUDLabel setText:@"LOADING"];
    [_fakeHUDLabel setTextColor:[UIColor whiteColor]];
    [_fakeHUDLabel setBackgroundColor:[UIColor clearColor]];
    [_fakeHUDLabel setTextAlignment:NSTextAlignmentCenter];
    [_fakeHUDLabel setNumberOfLines:1];
    [_fakeHUDLabel setFont:[UIFont fontWithName:@"ProximaNova-Bold" size:30]];
    
    [self.view addSubview:_rootView];
    [self.view addSubview:_offLineLabel];
    [self.view addSubview:_fakeHUDLabel];
    
    [_rootView release];
    [_offLineLabel release];
    [_fakeHUDLabel release];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:26/255.f green:188/255.f blue:156/255.f alpha:1]];    
}

- (void)viewDidAppear:(BOOL)animated
{
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://google.com"]];
    [client setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        if (status == AFNetworkReachabilityStatusNotReachable) {
            [_rootView setHidden:TRUE];
            [_offLineLabel setHidden:FALSE];
            [_fakeHUDLabel setHidden:TRUE];
        }
        else
        {
            [_rootView setHidden:FALSE];
            [_offLineLabel setHidden:TRUE];
            [_fakeHUDLabel setHidden:TRUE];
        }
    
    }];
    
    NSURL *url = [NSURL URLWithString:@"http://demovc.host56.com/population.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
        [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                            if (response.statusCode >= 200) {
                                                                //NSLog(@"IP Address: %@", [[JSON objectAtIndex:0] objectForKey:@"data"]);
                                                                [_rootView setData:JSON];
                                                            }
                                                        }
                                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                            NSLog(@"Failed");
                                                        }];
    
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
