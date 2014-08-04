//
//  Student.h
//  HelloWorld
//
//  Created by Default on 7/21/14.
//  Copyright (c) 2014 BIPROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSNumber * studentID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * rollNo;
@property (nonatomic, retain) NSNumber * pnoneNO;

@end
