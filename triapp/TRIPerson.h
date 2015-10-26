//
//  TRIPerson.h
//  triapp
//
//  Created by Harry Jones on 26/10/2015.
//  Copyright © 2015 Harry Jones. All rights reserved.
//

#import "PFObject.h"
#import <Parse/Parse.h>

@interface TRIPerson : PFObject<PFSubclassing>
+ (NSString *)parseClassName;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *weight;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *reportedConditions;
@property (nonatomic, strong) NSString *pastConditions;
@property (nonatomic, strong) NSString *recentLog;
@property (nonatomic, strong) PFGeoPoint *lastLocation;

@end
