//
//  APIConnection.m
//  HelloWorld
//
//  Created by Default on 7/31/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import "APIConnection.h"


@implementation APIConnection
NSString * authTokenValue = @"FltPaB1ZQoW31wfPig8Qig==";
NSString * authTokenKey = @"AuthToken";
-(id)SynchronousPostWithNSURLConnection:(NSString *)url data:(NSDictionary *)postData
{
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"POST";
    
    // This is how we set header fields
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:authTokenValue forHTTPHeaderField:authTokenKey];
    NSURLResponse * response = nil;
    NSError * error = nil;
    
    NSMutableArray * postDataArray = [[NSMutableArray alloc] init];
    [postDataArray addObject:postData];
    
    //Convert NSDictionary to NSData
    NSData * jsonData;
    if([NSJSONSerialization isValidJSONObject:postDataArray]){
        NSError * jsonError;
        jsonData = [NSJSONSerialization dataWithJSONObject:postDataArray options:NSJSONWritingPrettyPrinted error:&jsonError];
        
    }
    
    // Convert your data and set your request's HTTPBody property
    //NSData *requestBodyData = [requestData dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = jsonData;
    
    NSData * data = [NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    NSDictionary * responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    if (error == nil)
    {
        return responseData;
    }else
    {
        return nil;
    }
}
@end
