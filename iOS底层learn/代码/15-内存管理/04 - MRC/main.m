//
//  main.m
//  04 - MRC
//
//  Created by mac on 2021/8/24.
//

#import <Foundation/Foundation.h>
#import "GLPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GLPerson *person = [[GLPerson alloc] init];
        GLDog *dog1 = [[GLDog alloc] init];
//        [dog1 release];
        
        [person setDog:dog1];
        [person setDog:dog1];
//        [person setDog:dog1];
//        [person setDog:dog1];
//        [person setDog:dog1];
//        [person setDog:dog1];
        [dog1 release];
        
        
        
//        GLDog *dog2 = [[GLDog alloc] init];
//        [person setDog:dog2];
//        [dog2 release];
    
        [person.dog run];
        [person release];
    }
    return 0;
}
