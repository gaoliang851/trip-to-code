//
//  main.m
//  Hello Algorithm
//
//  Created by mac on 2021/4/28.
//

#import <Foundation/Foundation.h>

#import "GLArrayList.h"
#import "Person.h"
#import "GLLinkedList.h"

void testArrayList(void);
void testLinkedList(void);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testLinkedList();
        
        GLLog(@"----");
    }
    return 0;
}

void testArrayList() {
    GLArrayList <Person *>*arrayList = [[GLArrayList alloc] init];
    [arrayList addElement:[Person personWithName:@"11"]];
    [arrayList addElement:[Person personWithName:@"22"]];
    [arrayList addElement:[Person personWithName:@"33"]];
    [arrayList addElement:[Person personWithName:@"44"]];
    [arrayList addElement:[Person personWithName:@"55"]];
    [arrayList addElement:[Person personWithName:@"66"]];
    [arrayList addElement:[Person personWithName:@"77"]];

    [arrayList addElement:[Person personWithName:@"00"] atIndex:0];
    [arrayList addElement:[Person personWithName:@"--"] atIndex:3];

    [arrayList addElement:[Person personWithName:@"??"] atIndex:9];
    GLLog(@"%@",arrayList);
        
    [arrayList removeAtIndex:0];
    GLLog(@"%@",arrayList);

    [arrayList removeAtIndex:5];
    GLLog(@"%@",arrayList);
    
//
    [arrayList removeAtIndex:7];
    GLLog(@"%@",arrayList);
//
    [arrayList clear];
    GLLog(@"%@",arrayList);
//
//    [arrayList setElement:[Person personWithName:@"()"] atIndex:0];
//    GLLog(@"%@",arrayList);
//
//    [arrayList setElement:[Person personWithName:@"()"] atIndex:6];
//    GLLog(@"%@",arrayList);
//
//    [arrayList setElement:[Person personWithName:@"(?)"] atIndex:3];
//    GLLog(@"%@",arrayList);
//
//    GLLog(@"size = %d",[arrayList size]);
//    GLLog(@"isEmpty = %d",[arrayList isEmpty]);
//
//    GLLog(@"contains:%d",[arrayList containsElement:[Person personWithName:@"66"]]);
//
//    GLLog(@"get:%@",[arrayList getElementAtIndex:6]);
//
//    GLLog(@"indexOf:%d",[arrayList indexOfElement:[Person personWithName:@"___"]]);
//
//    [arrayList clear];
//    GLLog(@"isEmpty = %d",[arrayList isEmpty]);
//
//    GLLog(@"end");
}

void testLinkedList() {
    GLLinkedList <Person *>*arrayList = [[GLLinkedList alloc] init];
    [arrayList addElement:[Person personWithName:@"11"]];
    [arrayList addElement:[Person personWithName:@"22"]];
    [arrayList addElement:[Person personWithName:@"33"]];
    [arrayList addElement:[Person personWithName:@"44"]];
    [arrayList addElement:[Person personWithName:@"55"]];
    [arrayList addElement:[Person personWithName:@"66"]];
    [arrayList addElement:[Person personWithName:@"77"]];

    [arrayList addElement:[Person personWithName:@"00"] atIndex:0];
    [arrayList addElement:[Person personWithName:@"--"] atIndex:3];

    [arrayList addElement:[Person personWithName:@"??"] atIndex:9];
    GLLog(@"%@",arrayList);
        
    [arrayList removeAtIndex:0];
    GLLog(@"%@",arrayList);

    [arrayList removeAtIndex:5];
    GLLog(@"%@",arrayList);

//
    [arrayList removeAtIndex:7];
    GLLog(@"%@",arrayList);
//
//    [arrayList clear];
//    GLLog(@"%@",arrayList);

    [arrayList setElement:[Person personWithName:@"()"] atIndex:0];
    GLLog(@"%@",arrayList);

    [arrayList setElement:[Person personWithName:@"()"] atIndex:6];
    GLLog(@"%@",arrayList);

    [arrayList setElement:[Person personWithName:@"(?)"] atIndex:3];
    GLLog(@"%@",arrayList);

    GLLog(@"size = %d",[arrayList size]);
    GLLog(@"isEmpty = %d",[arrayList isEmpty]);

    GLLog(@"contains:%d",[arrayList containsElement:[Person personWithName:@"66"]]);

    GLLog(@"get:%@",[arrayList getElementAtIndex:6]);

    GLLog(@"indexOf:%d",[arrayList indexOfElement:[Person personWithName:@"___"]]);

    [arrayList clear];
    GLLog(@"isEmpty = %d",[arrayList isEmpty]);

    GLLog(@"end");
}


