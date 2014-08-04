//
//  SeventhViewController.m
//  HelloWorld
//
//  Created by Default on 7/25/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import "SeventhViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <UIKit/UIGraphics.h>


@interface SeventhViewController ()

@end

@implementation SeventhViewController{
    GMSMapView *mapView_;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    NSString * s = [defaults1 objectForKey:@"infoString"];
    
//    @try {
//        // Create a GMSCameraPosition that tells the map to display the
//        // coordinate -33.86,151.20 at zoom level 6.
//        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
//                                                                longitude:151.20
//                                                                     zoom:6];
//        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//        mapView_.myLocationEnabled = YES;
//        self.view = mapView_;
//        
//        // Creates a marker in the center of the map.
//        GMSMarker *marker = [[GMSMarker alloc] init];
//        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
//        marker.title = @"Sydney";
//        marker.snippet = @"Australia";
//        marker.map = mapView_;
//    }
//    @catch (NSException *exception) {
//        
//    }
//    @finally {
//        
//    }
    
    
    
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:CLLocationCoordinate2DMake(20.326116, 85.818656) completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
        NSLog(@"reverse geocoding results:");
        for(GMSAddress* addressObj in [response results])
        {
            NSLog(@"coordinate.latitude=%f", addressObj.coordinate.latitude);
            NSLog(@"coordinate.longitude=%f", addressObj.coordinate.longitude);
            NSLog(@"thoroughfare=%@", addressObj.thoroughfare);
            NSLog(@"locality=%@", addressObj.locality);
            NSLog(@"subLocality=%@", addressObj.subLocality);
            NSLog(@"administrativeArea=%@", addressObj.administrativeArea);
            NSLog(@"postalCode=%@", addressObj.postalCode);
            NSLog(@"country=%@", addressObj.country);
            NSLog(@"lines=%@", addressObj.lines);
            break;
        }
    }];
  
    
}
- (void)application:didFinishLaunchingWithOptions{
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
