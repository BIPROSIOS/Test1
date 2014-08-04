//
//  FirstViewController.m
//  HelloWorld
//
//  Created by Default on 6/22/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "APIConnection.h"


@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextView *FirstViewLavel2;
@property (weak, nonatomic) IBOutlet UITextView *TextView1;

@end

@implementation FirstViewController
NSMutableData*      receivedData;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary * newCourse = [[NSMutableDictionary alloc]init];
    //[newCourse setValue:@"admin" forKey:@"Password"];
    //[newCourse setValue:@"admin" forKey:@"UserName"];
    [newCourse setValue:[NSNumber numberWithInt:1] forKey:@"companyID"];
    [newCourse setValue:[NSNumber numberWithInt:1] forKey:@"created_By"];
    [newCourse setValue:@"location1" forKey:@"id"];
    [newCourse setValue:@"test objective c2" forKey:@"locationName"];
    [newCourse setValue:[NSNumber numberWithInt:1] forKey:@"updated_By"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        NSArray * data2 = [[APIConnection new] SynchronousPostWithNSURLConnection:@"http://54.204.12.176:8084/api/CICO/SaveLocation"data:newCourse];
    });
    
    
    
    
    NSURL *url3 = [NSURL URLWithString:@"http://maps.googleapis.com/maps/api/geocode/xml?latlng=28.11,77&sensor=false"];
    NSMutableURLRequest * request3 = [NSMutableURLRequest requestWithURL:url3];
    [NSURLConnection sendAsynchronousRequest:request3 queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
            NSError *jsonError;
           // NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
       NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
       // NSLog(@"%@",json);
                
                
    }];
    
    
    
    NSURLConnection*    connection;
    
    NSURL*					url			= [NSURL URLWithString:@"http://www.ifixit.com/api/0.1/badges"];
    //NSURL*					url			= [NSURL URLWithString:@"http://192.168.1.11/SchoolMsg/user/CheckLogin?user[Email_Id]=ranjit.panda%40thebipros.com&user[Password]=ranjit"];
    
    
	NSMutableURLRequest*	request		= [NSMutableURLRequest requestWithURL:url
                                                            cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                        timeoutInterval:10];
	if (request)
	{
		[request setURL:url];
		connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	}
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)connection:(NSURLConnection*)connection
didReceiveResponse:(NSURLResponse*)response;
{
    receivedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection*)connection
    didReceiveData:(NSData*)data;
{
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection*)connection
  didFailWithError:(NSError*)error;
{
    NSLog(@"WHOOPS! Something went wrong");
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:error.description
                                                   delegate:nil
                                          cancelButtonTitle:@"Close"
                                          otherButtonTitles:nil];
	[alert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                       message:@"This is the message."
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    [theAlert show];
    
    
    
    //UIActivityIndicatorView *act = (UIActivityIndicatorView *)[self.view viewWithTag:111];
    [_act stopAnimating];
	NSString* s = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
	NSLog(@"Received data %@", s);
    self.FirstViewLavel2.text = s;
    self.TextView1.text = s;
	
   // badges = [[IFixItBadges alloc] initWithData:receivedData];
}

@end
