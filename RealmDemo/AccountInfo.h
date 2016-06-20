//
//  AccountInfo.h
//  RealmDemo
//
//  Created by cloud on 6/20/16.
//  Copyright © 2016 yedaoinc. All rights reserved.
//

#import <Realm/Realm.h>

@interface AccountInfo : RLMObject
@property RLMArray<AddressInfo>* addressArr;
@property RLMArray<PaymentMethod>* paymentMethodArr;
@property NSNumber<RLMInt>* userId;
@property NSNumber<RLMInt>* credits;
@property NSNumber<RLMInt>* favors;
@property NSString* nickname;
@property NSString* avatar;
@property NSString* descriptionInfo;
@end
RLM_ARRAY_TYPE(AccountInfo)