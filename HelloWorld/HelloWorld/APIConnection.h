//
//  APIConnection.h
//  HelloWorld
//
//  Created by Default on 7/31/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConnection : NSObject
-(id)SynchronousPostWithNSURLConnection:(NSString *)url data:(NSDictionary *)postData;

@end
