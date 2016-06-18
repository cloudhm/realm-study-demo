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
    
    PaymentMethod* p = [[PaymentMethod alloc]init];
    p.paymentType = Card;
    p.cardId = @"123123";
    p.cardCvv = @"789";
    p.cardExpire = @"啦啦啦";
    p.cardType = Visa;
    
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:p];
    }];
    
    RLMResults<PaymentMethod*>*result = [PaymentMethod objectsInRealm:realm where:@"cardExpire contains '啦'"];
    NSLog(@"%@",result);
    
//    AccountInfo* accountInfo = [[AccountInfo alloc]init];
//    RLMResults<PaymentMethod*>* payment = [PaymentMethod allObjects];
//    [accountInfo.paymentMethodArr addObjects:payment];
//    NSInteger index = [accountInfo.paymentMethodArr indexOfObject:p];
//    if (index == NSNotFound)
//    {
//        [accountInfo.paymentMethodArr addObject:p];
//    }
    
}
@end
