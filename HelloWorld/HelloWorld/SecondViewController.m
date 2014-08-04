//
//  SecondViewController.m
//  HelloWorld
//
//  Created by Default on 6/22/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import "SecondViewController.h"
#import "TestClass.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //if there is a connection going on just cancel it.
    [self.connection cancel];
    
    //initialize new mutable data
    NSMutableData *data = [[NSMutableData alloc] init];
    self.receivedData = data;
    TestClass * test = [[TestClass alloc]init];
    [test setUserName:@"admin"];
    [test setPassword:@"admin"];
    NSData *jsonData = [self convertToJSONData];
   
    NSError * jsonError;
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&jsonError];
    //initialize url that is going to be fetched.
    //NSURL *url = [NSURL URLWithString:@"http://www.snee.com/xml/crud/posttest.cgi"];
    //NSURL *url = [NSURL URLWithString:@"http://113.19.87.196:8081/SchoolMsg/App/GetAllSendMessages?reqstdIndex=0"];
    //NSURL *url = [NSURL URLWithString:@"http://54.204.12.176:8084/api/Login/Login"];
     NSURL *url = [NSURL URLWithString:@"http://54.204.12.176:8084/api/CICO/SaveLocation"];
   
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    //initialize a post data
    //NSString *postData = [[NSString alloc] initWithString:@"fname=example&amp;lname=example"];
    //set request content type we MUST set this value.
    
    //[request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    //[request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:jsonData];

    
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;
    
    //start the connection
    [connection start];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(NSURLSession *) getSession{
    static NSURLSession *session =  nil;
    static dispatch_once_t onceTpken;
    dispatch_once(&onceTpken , ^{
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration:config];
        
    });
    return session;
}
-(NSData *) convertToJSONData{
    NSMutableDictionary * newCourse = [[NSMutableDictionary alloc]init];
    //[newCourse setValue:@"admin" forKey:@"Password"];
    //[newCourse setValue:@"admin" forKey:@"UserName"];
    
    [newCourse setValue:[NSNumber numberWithInt:1] forKey:@"companyID"];
    [newCourse setValue:[NSNumber numberWithInt:1] forKey:@"created_By"];
    [newCourse setValue:@"location1" forKey:@"id"];
    [newCourse setValue:@"test objective c" forKey:@"locationName"];
    [newCourse setValue:[NSNumber numberWithInt:1] forKey:@"updated_By"];
    NSMutableArray * newCourse1 = [[NSMutableArray alloc] init];
    //[newCourse1 setValue:newCourse1 forKey:@"data"];
    [newCourse1 addObject:newCourse];
    
    
    NSData * jsonData;
    if([NSJSONSerialization isValidJSONObject:newCourse]){
        NSError * jsonError;
        //jsonData = [NSJSONSerialization dataWithJSONObject:newCourse1 options:NSJSONWritingPrettyPrinted error:&jsonError];
          jsonData = [NSJSONSerialization dataWithJSONObject:newCourse1 options:NSJSONWritingPrettyPrinted error:&jsonError];
        
    }
    return jsonData;
}
/*
 this method might be calling more than one times according to incoming data size
 */
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
}
/*
 if there is an error occured, this method will be called by connection
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"%@" , error);
}

/*
 if data is successfully received, this method will be called by connection
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    //initialize convert the received data to string with UTF8 encoding
    NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData
                                              encoding:NSUTF8StringEncoding];
    NSLog(@"%@" , htmlSTR);
    //initialize a new webviewcontroller
    //WebViewController *controller = [[WebViewController alloc] initWithString:htmlSTR];
    
    //show controller with navigation
    //[self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
