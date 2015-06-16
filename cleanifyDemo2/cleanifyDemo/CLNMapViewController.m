//
//  CLNMapViewController.m
//  cleanifyDemo
//
//  Created by Dvid Silva on 6/16/15.
//  Copyright © 2015 Cleanify. All rights reserved.
//

#import "CLNMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "CLNPurchaseOrder.h"

@interface CLNMapViewController ()

@end

@implementation CLNMapViewController {
    GMSMapView* theMapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[_purchaseOrder.lat floatValue]
                                                            longitude:[_purchaseOrder.lon floatValue]
                                                                 zoom:13];
    theMapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    theMapView.myLocationEnabled = YES;
    self.view = theMapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake([_purchaseOrder.lat floatValue], [_purchaseOrder.lon floatValue]);
    marker.title = _purchaseOrder.customerName;
    marker.snippet = _purchaseOrder.address;
    marker.map = theMapView;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
