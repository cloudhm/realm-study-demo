//
//  MDObject.h
//  mode
//
//  Created by cloud on 6/16/16.
//  Copyright © 2016 Yedao Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AccountInfo;
@interface AddressInfo : RLMObject
@property NSString* address;
@end
RLM_ARRAY_TYPE(AddressInfo)

@interface PaymentMethod : RLMObject
@property PaymentType paymentType;
@property BTUIPaymentOptionType cardType;
@property NSString* cardId;
@property NSString* cardCvv;
@property NSString* cardExpire;
@property (readonly) RLMLinkingObjects* accountInfo;
@end
RLM_ARRAY_TYPE(PaymentMethod)

@interface AccountInfo : RLMObject
@property RLMArray<AddressInfo*><AddressInfo>* addressArr;
@property RLMArray<PaymentMethod*><PaymentMethod>* paymentMethodArr;
@property NSNumber<RLMInt>* userId;
@property NSNumber<RLMInt>* credits;
@property NSNumber<RLMInt>* favors;
@property NSString* nickname;
@property NSString* avatar;
@property NSString* descriptionInfo;
@end


@interface OrderInfo : RLMObject
@property RLMArray<AddressInfo*><AddressInfo>* addressArr;
@property RLMArray<PaymentMethod*><PaymentMethod>*paymentMethodArr;
@end







@interface MDObject : RLMObject
@end
