//
//  main.m
//  05 - copy
//
//  Created by mac on 2021/8/26.
//

#import <Foundation/Foundation.h>

void test1() {
    NSString *str1 = [[NSString alloc] initWithFormat:@"test"];
    NSString *str2 = [str1 copy];
    NSMutableString *str3 = [str1 mutableCopy];
    
    NSLog(@"str1:%@,%p",[str1 class],str1);
    NSLog(@"str2:%@,%p",[str2 class],str2);
    NSLog(@"str3:%@,%p",[str3 class],str3);
    
    [str1 release];
    [str2 release];
    [str3 release];
}

void testMutableString() {
    NSMutableString *str1 = [[NSMutableString alloc] initWithFormat:@"test"];
    NSString *str2 = [str1 copy];
    NSMutableString *str3 = [str1 mutableCopy];
    
    NSLog(@"str1:%@,%p",[str1 class],str1);//NSMutableString类型
    NSLog(@"str2:%@,%p",[str2 class],str2);//NSTaggedPointerString类型，不可变类型
    NSLog(@"str3:%@,%p",[str3 class],str3);//NSMutableString类型
}

void testArray() {
    NSArray *arr1 = [NSArray arrayWithObjects:@"a",@"b", nil];
    NSArray *arr2 = [arr1 copy];
    NSMutableArray *arr3 = [arr1 mutableCopy];

    NSLog(@"arr1:%@,%p",[arr1 class],arr1);
    NSLog(@"arr2:%@,%p",[arr2 class],arr2);
    NSLog(@"arr3:%@,%p",[arr3 class],arr3);
}

void testMutableArray() {
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"a",@"b", nil];
    NSArray *arr2 = [arr1 copy];
    NSMutableArray *arr3 = [arr1 mutableCopy];

    NSLog(@"arr1:%@,%p",[arr1 class],arr1);
    NSLog(@"arr2:%@,%p",[arr2 class],arr2);
    NSLog(@"arr3:%@,%p",[arr3 class],arr3);
}

void testDictionary() {
    NSDictionary *dict = @{@"a":@"aaaa",
                          @"b":@"bbbb"
                        };
    NSDictionary *dict2 = [dict copy];
    
    NSMutableDictionary *dict3 = [dict mutableCopy];
    [dict3 setObject:@"adf" forKey:@"ddd"];
    NSLog(@"dict1:%@,%p",[dict class],dict);
    NSLog(@"dict2:%@,%p",[dict2 class],dict2);
    NSLog(@"dict3:%@,%p",[dict3 class],dict3);
}

void testMutableDictionary() {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjects:@[@"aaaa",@"bbbb"] forKeys:@[@"a",@"b"]];
    NSDictionary *dict2 = [dict copy];
    
    NSMutableDictionary *dict3 = [dict mutableCopy];
    [dict3 setObject:@"adf" forKey:@"ddd"];
    NSLog(@"dict1:%@,%p",[dict class],dict);
    NSLog(@"dict2:%@,%p",[dict2 class],dict2);
    NSLog(@"dict3:%@,%p",[dict3 class],dict3);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testMutableDictionary();
    }
    return 0;
}
