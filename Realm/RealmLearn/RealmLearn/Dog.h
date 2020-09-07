//
//  Dog.h
//  RealmLearn
//
//  Created by mac on 2020/8/20.
//Copyright © 2020 Dever.G. All rights reserved.
//

#import <Realm/Realm.h>
@class Person;
@interface Dog : RLMObject
@property int age;
@property NSString *name;
//@property (readonly) RLMLinkingObjects *master;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Dog *><Dog>
RLM_ARRAY_TYPE(Dog)
