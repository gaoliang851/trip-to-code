//
//  Person.h
//  RealmLearn
//
//  Created by mac on 2020/8/21.
//Copyright © 2020 Dever.G. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"
@interface Person : RLMObject
@property int age;
@property NSString *fullName;
//@property NSString *firstName;
//@property NSString *lastName;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person *><Person>
RLM_ARRAY_TYPE(Person)
