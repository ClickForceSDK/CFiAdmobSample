//
//  ViewController.m
//  CFiAdmobSample
//
//  Created by Charles on 2017/7/20.
//  Copyright © 2017年 clickforce. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Mediation
    GADBannerView  *bannerView = [[GADBannerView alloc]
                                  initWithAdSize:GADAdSizeFromCGSize(CGSizeMake(320, 50))
                                  origin:CGPointMake((self.view.frame.size.width-320)/2, self.view.frame.size.height-50)];
    
    
    [self.view addSubview:bannerView];
    
    bannerView.adUnitID = @"ca-app-pub-7236340530869760/5572068733";
    bannerView.rootViewController = self;
    bannerView.delegate = self;
    [bannerView loadRequest:[self createRequest]];
    
    
}

#pragma mark GADRequest generation

// Here we're creating a simple GADRequest and whitelisting the application
// for test ads. You should request test ads during development to avoid
// generating invalid impressions and clicks.
- (GADRequest *)createRequest {
    
    GADRequest *request = [GADRequest request];
    
    // Make the request for a test ad. Put in an identifier for the simulator as
    // well as any devices you want to receive test ads.
    
    
    request.testDevices = [NSArray arrayWithObjects:@"1ecb9a7ec3266aac8f4fc707fdd9e322",
     // TODO: Add your device/simulator test identifiers here. They are
     // printed to the console when the app is launched.
     kGADSimulatorID,
     nil];
    
    return request;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
