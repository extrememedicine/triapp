//
//  TRIPerson.m
//  triapp
//
//  Created by Harry Jones on 26/10/2015.
//  Copyright © 2015 Harry Jones. All rights reserved.
//

#import "TRIPerson.h"
#import <Parse/PFObject+Subclass.h>

@implementation TRIPerson

@dynamic name;
@dynamic dob;
@dynamic sex;
@dynamic weight;
@dynamic height;
@dynamic reportedConditions;
@dynamic pastConditions;
@dynamic recentLog;
@dynamic lastLocation;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TRIPerson";
}

@end
