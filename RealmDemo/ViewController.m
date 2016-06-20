//
//  ViewController.m
//  RealmDemo
//
//  Created by cloud on 6/18/16.
//  Copyright © 2016 yedaoinc. All rights reserved.
//

#import "ViewController.h"
@class Person;

@interface Dog : RLMObject
@property NSString *name;
@property NSData   *picture;
@property NSInteger age;
@property (readonly) RLMLinkingObjects* owners;
@end
RLM_ARRAY_TYPE(Dog)
@implementation Dog
+(NSString*)primaryKey
{
    return @"name";
}
+ (NSDictionary *)linkingObjectsProperties
{
    return @{@"owners": [RLMPropertyDescriptor descriptorWithClass:NSClassFromString(@"Person")
                                                      propertyName:@"dogs"],
             };
}
@end

@interface Person : RLMObject
@property NSString             *name;
@property RLMArray<Dog *><Dog> *dogs;
@end

@implementation Person
@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RLMRealm* realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        [AccountInfo createOrUpdateInRealm:realm withValue:@[@[],@[@[@0,@0,@"4111111111111111",@"321",@"1218"]],@1,@2,@3,@"cloud",@"",@"a test account"]];
    }];
    
    RLMResults *allPayment = [PaymentMethod allObjects];
    for (PaymentMethod* paymentMethod in allPayment)
    {
        NSArray *accountInfos = [paymentMethod.accountInfo valueForKeyPath:@"nickname"];
        NSLog(@"%@ has %lu owners (%@)", paymentMethod.cardId, (unsigned long)accountInfos.count, accountInfos);
    }
    [realm transactionWithBlock:^{
        [realm deleteObject:allPayment.firstObject];
    }];
    NSLog(@"%lu",allPayment.count);
}
@end
