//
//  MDObject.m
//  mode
//
//  Created by cloud on 6/16/16.
//  Copyright © 2016 Yedao Inc. All rights reserved.
//

#import "MDObject.h"

@implementation AddressInfo
+(nullable NSString *)primaryKey
{
    return @"address";
}
@end

@implementation PaymentMethod
+ (NSDictionary *)linkingObjectsProperties
{
    return @{@"accountInfo": [RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"AccountInfo")
                                                           propertyName:@"paymentMethodArr"],
             };
}
+(NSString*)primaryKey
{
    return @"paymentType";
}
@end

@implementation AccountInfo
+(nullable NSString *)primaryKey
{
    return @"userId";
}
+ (NSDictionary *)defaultPropertyValues
{
    return @{@"addressArr": @[],@"paymentMethodArr":@[]};
}
+(NSArray*)ignoredProperties
{
    return @[@"addressArr",@"paymentMethodArr"];
}
@end
@implementation MDObject

@end
