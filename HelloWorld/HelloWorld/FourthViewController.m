//
//  FourthViewController.m
//  HelloWorld
//
//  Created by Default on 7/17/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//


#import "FourthViewController.h"
#import <GoogleMaps/GoogleMaps.h>
@interface FourthViewController ()

@end

@implementation FourthViewController
CLGeocoder *geocoder;
CLPlacemark *placemark;

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
    
   [self goLocation];
    
    // Do any additional setup after loading the view.(double)longitude :(double)latitude
}
-(void) goLocation{
//    _MapViewTestMap.mapType = MKMapTypeHybrid;
//    MKCoordinateRegion newRegion;
//    newRegion.center.latitude = 20.326116;
//    newRegion.center.longitude = 85.818656;
//    //newRegion.center.latitude = latitude;
//    //newRegion.center.longitude = longitude;
//    newRegion.span.latitudeDelta = 0.013079;
//    newRegion.span.longitudeDelta = 0.022359;
//    
//    CLLocationCoordinate2D cordinate;
//    cordinate.latitude = 20.326116;
//    cordinate.longitude = 85.818656;
//    
//    //create pin
//    MKPointAnnotation * annotation  = [[MKPointAnnotation alloc]init];
//    [annotation setCoordinate:cordinate];
//    [annotation setTitle:@"BIPROS"];
//    //[self.MapViewTestMap removeAnnotation:self.MapViewTestMap.annotations];
//    [self.MapViewTestMap addAnnotation:annotation];
//    [self.MapViewTestMap setRegion:newRegion animated:YES];
//   
    
    //get current location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    //locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    
    [locationManager startUpdatingLocation];
    geocoder = [[CLGeocoder alloc] init];
    
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    // Stop Location Manager
    //[locationManager stopUpdatingLocation];
    double  updatedLatitude = currentLocation.coordinate.latitude;
    double updatedLongitude = currentLocation.coordinate.longitude;

    
    if (currentLocation != nil) {
        _LabelLongitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        _LabelLatitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];

   _MapViewTestMap.mapType = MKMapTypeHybrid;
   MKCoordinateRegion newRegion;
   //newRegion.center.latitude = 20.326116;
   //newRegion.center.longitude = 85.818656;
        newRegion.center.latitude =  updatedLatitude;
        newRegion.center.longitude = updatedLongitude;
   newRegion.span.latitudeDelta = 0.013079;
   newRegion.span.longitudeDelta = 0.022359;

   CLLocationCoordinate2D cordinate;
   cordinate.latitude = updatedLatitude;
   cordinate.longitude = updatedLongitude;

   //create pin
   MKPointAnnotation * annotation  = [[MKPointAnnotation alloc]init];
   [annotation setCoordinate:cordinate];
   [annotation setTitle:@"BIPROS"];
   //[self.MapViewTestMap removeAnnotation:self.MapViewTestMap.annotations];
   [self.MapViewTestMap addAnnotation:annotation];
   [self.MapViewTestMap setRegion:newRegion animated:YES];

        //[self goLocation:(double)currentLocation.coordinate.longitude :(double)currentLocation.coordinate.latitude];
    }
    
    NSLog(@"Resolving the Address");
//    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
//        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
//        if (error == nil && [placemarks count] > 0) {
//            placemark = [placemarks lastObject];
//            _TextViewAddress.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
//                                 placemark.subThoroughfare, placemark.thoroughfare,
//                                 placemark.postalCode, placemark.locality,
//                                 placemark.administrativeArea,
//                                 placemark.country];
//        } else {
//            NSLog(@"%@", error.debugDescription);
//        }
//    } ];
    
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:CLLocationCoordinate2DMake(updatedLatitude , updatedLongitude) completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
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
            _TextViewAddress.text = [[addressObj valueForKey:@"lines"] componentsJoinedByString:@" "];
            break;
        }
    }];
    [NSThread sleepUntilDate: [NSDate dateWithTimeIntervalSinceNow:0.5]];
    //[NSThread sleepForTimeInterval:60.0];
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
