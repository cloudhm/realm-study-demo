//
//  PaymentMethod.h
//  RealmDemo
//
//  Created by cloud on 6/20/16.
//  Copyright © 2016 yedaoinc. All rights reserved.
//

#import <Realm/Realm.h>

@interface PaymentMethod : RLMObject
@property PaymentType paymentType;
@property BTUIPaymentOptionType cardType;
@property NSString* cardId;
@property NSString* cardCvv;
@property NSString* cardExpire;
@property (readonly) RLMLinkingObjects* accountInfo;
@end
RLM_ARRAY_TYPE(PaymentMethod)

