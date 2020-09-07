//
//  Student.h
//  RealmLearn
//
//  Created by mac on 2020/7/29.
//Copyright © 2020 Dever.G. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
#import "Dog.h"
@interface Student : RLMObject
@property int age;
@property NSString *name;
@property (readonly) UIImage *headImage;
@property NSData *imageData;
@property RLMArray <Dog *><Dog> *dogs;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Student *><Student>
RLM_ARRAY_TYPE(Student)
