
//
//  ThirdViewController.m
//  HelloWorld
//
//  Created by Default on 6/23/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import "ThirdViewController.h"
#import "TestClass.h"
@interface ThirdViewController ()

@end
@implementation ThirdViewController
{
    NSDictionary * responseData;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    TestClass * test = [[TestClass alloc]init];
//    [test setUserName:@"admin"];
//    [test setPassword:@"admin"];
//    NSData *jsonData = [self convertToJSONData];
//   // NSURL *url = [NSURL URLWithString:@"http://54.204.12.176:8084/api/Login/Login"];
//    NSURL *url = [NSURL URLWithString:@"http://54.204.12.176:8084/api/CICO/SaveLocation"];
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:jsonData];
//    //[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    //[request setValue:@"FltPaB1ZQoW31wfPig8Qig==" forHTTPHeaderField:@"AuthToken"];
//    NSURLSessionDataTask * task = [[self getSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
//     {
//         NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *) response;
//         NSInteger statusCode = [httpResponse statusCode];
//         if([data length] > 0 && error == nil && statusCode == 200)
//         {
//             NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//         }
//         
//     }];
//    [task resume];
    id a = [self postRequest];
    

//    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        
//        NSError *jsonError;
//        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
//        
//        NSLog(@"%@",json);
//        
//        
//    }];
	// Do any additional setup after loading the view, typically from a nib.
}

-(id)postRequest{
    
    TestClass * test = [[TestClass alloc]init];
    [test setUserName:@"admin"];
    [test setPassword:@"admin"];
    NSData *jsonData = [self convertToJSONData];
    // NSURL *url = [NSURL URLWithString:@"http://54.204.12.176:8084/api/Login/Login"];
    NSURL *url = [NSURL URLWithString:@"http://54.204.12.176:8084/api/CICO/SaveLocation"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    //[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request setValue:@"FltPaB1ZQoW31wfPig8Qig==" forHTTPHeaderField:@"AuthToken"];
    NSURLSessionDataTask * task = [[self getSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                   {
                                       NSHTTPURLResponse * httpResponse = (NSHTTPURLResponse *) response;
                                       NSInteger statusCode = [httpResponse statusCode];
                                       if([data length] > 0 && error == nil && statusCode == 200)
                                       {
                                           NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                           responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                           dispatch_semaphore_signal(semaphore);
                                           
                                       }
                                       
                                   }];
    //NSURLSessionDataTask * task2 = [[self getSession] dataTaskWithRequest:request];
    [task resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return responseData;
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
    
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    
}


-(NSURLSession *) getBackgroundSession{
    static NSURLSession *backgroundSession =  nil;
    static dispatch_once_t onceTpken;
    dispatch_once(&onceTpken , ^{
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration backgroundSessionConfiguration:@"com.bipros.task"];
        backgroundSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
        
    });
    return backgroundSession;
}
-(NSURLSession *) getSession{
    static NSURLSession *session =  nil;
    static dispatch_once_t onceTpken;
    dispatch_once(&onceTpken , ^{
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.HTTPAdditionalHeaders = @{@"AuthToken" : @"FltPaB1ZQoW31wfPig8Qig==",
            @"Content-Type" : @"application/json"
            };
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
    [newCourse setValue:@"test objective c2" forKey:@"locationName"];
    [newCourse setValue:[NSNumber numberWithInt:1] forKey:@"updated_By"];
    NSMutableArray * newCourse1 = [[NSMutableArray alloc] init];
    //[newCourse1 setValue:newCourse1 forKey:@"data"];
    [newCourse1 addObject:newCourse];

    
    NSData * jsonData;
    if([NSJSONSerialization isValidJSONObject:newCourse]){
        NSError * jsonError;
        jsonData = [NSJSONSerialization dataWithJSONObject:newCourse1 options:NSJSONWritingPrettyPrinted error:&jsonError];
        
    }
    return jsonData;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
