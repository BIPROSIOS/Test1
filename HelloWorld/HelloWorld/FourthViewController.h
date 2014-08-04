//
//  FourthViewController.h
//  HelloWorld
//
//  Created by Default on 7/17/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import <CoreLocation/CoreLocation.h>

@interface FourthViewController : UIViewController<UISearchBarDelegate ,  MKMapViewDelegate , CLLocationManagerDelegate>
{
     CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet UILabel *LabelLatitude;
@property (weak, nonatomic) IBOutlet UILabel *LabelLongitude;
@property (weak, nonatomic) IBOutlet UITextView *TextViewAddress;
@property (weak, nonatomic) IBOutlet MKMapView *MapViewTestMap;
-(void) goLocation;


@end
