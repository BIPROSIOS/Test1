//
//  ThirdViewController.h
//  HelloWorld
//
//  Created by Default on 6/23/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController<NSURLSessionDownloadDelegate , NSURLSessionDataDelegate>

-(NSData *) convertToJSONData;
@end
