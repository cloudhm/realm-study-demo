//
//  PaymentMethod.m
//  RealmDemo
//
//  Created by cloud on 6/20/16.
//  Copyright © 2016 yedaoinc. All rights reserved.
//

#import "PaymentMethod.h"

@implementation PaymentMethod
+ (NSDictionary *)linkingObjectsProperties
{
    return @{@"accountInfo": [RLMPropertyDescriptor descriptorWithClass:AccountInfo.class
                                                           propertyName:@"paymentMethodArr"],
             };
}
+(NSString*)primaryKey
{
    return @"paymentType";
}
@end
