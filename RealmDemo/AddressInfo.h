//
//  AddressInfo.h
//  RealmDemo
//
//  Created by cloud on 6/20/16.
//  Copyright © 2016 yedaoinc. All rights reserved.
//

#import <Realm/Realm.h>

@interface AddressInfo : RLMObject
@property NSString* address;
@end
RLM_ARRAY_TYPE(AddressInfo)
