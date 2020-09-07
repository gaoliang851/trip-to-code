//
//  Cat.h
//  RealmLearn
//
//  Created by mac on 2020/8/27.
//Copyright © 2020 Dever.G. All rights reserved.
//

#import <Realm/Realm.h>

@interface Cat : RLMObject
@property int a;
@property int b;
@property NSString *c;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Cat *><Cat>
RLM_ARRAY_TYPE(Cat)
