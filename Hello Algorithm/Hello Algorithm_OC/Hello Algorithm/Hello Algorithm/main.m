//
//  main.m
//  Hello Algorithm
//
//  Created by mac on 2021/4/28.
//

#import <Foundation/Foundation.h>

#import "GLArrayList.h"
#import "Person.h"
#import "GLSignleLinkedList.h"
#import "GLCycleLinkedList.h"
#import "GLCycleSignleLinkedList.h"

void testArrayList(void);
void testLinkedList(void);
void testCycleLinkedList(void);
void testCycleSignledList(void);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        testCycleLinkedList();
        testCycleSignledList();
        
        //GLLog(@"----");
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
    GLSignleLinkedList <Person *>*arrayList = [[GLSignleLinkedList alloc] init];
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

void testCycleLinkedList() {
    GLCycleLinkedList <Person *>*arrayList = [[GLCycleLinkedList alloc] init];
    [arrayList addElement:[Person personWithName:@"11"]];
//    NSLog(@"%@",arrayList);
    [arrayList addElement:[Person personWithName:@"22"]];
    [arrayList addElement:[Person personWithName:@"33"]];
    [arrayList addElement:[Person personWithName:@"44"]];
    [arrayList addElement:[Person personWithName:@"55"]];
    [arrayList addElement:[Person personWithName:@"66"]];
    [arrayList addElement:[Person personWithName:@"77"]];
    [arrayList addElement:[Person personWithName:@"00"] atIndex:0];
    [arrayList addElement:[Person personWithName:@"--"] atIndex:3];

    [arrayList addElement:[Person personWithName:@"??"] atIndex:9];
//    GLLog(@"%@",arrayList);
//
    [arrayList removeAtIndex:0];
//    GLLog(@"%@",arrayList);
//
    [arrayList removeAtIndex:5];
//    GLLog(@"%@",arrayList);
//
////
    [arrayList removeAtIndex:7];
//    GLLog(@"%@",arrayList);
////
//    [arrayList clear];
////    GLLog(@"%@",arrayList);
//
    [arrayList setElement:[Person personWithName:@"()"] atIndex:0];
//    GLLog(@"%@",arrayList);
//  (),22,--,(?),44,66,(),
    [arrayList setElement:[Person personWithName:@"()"] atIndex:6];
//    GLLog(@"%@",arrayList);
//
    [arrayList setElement:[Person personWithName:@"(?)"] atIndex:3];
//    GLLog(@"%@",arrayList);
//
    GLLog(@"size = %d",[arrayList size]);
    GLLog(@"isEmpty = %d",[arrayList isEmpty]);
    // (),22,--,(?),44,66,()
    GLLog(@"contains:%d",[arrayList containsElement:[Person personWithName:@"66"]]);
//
    GLLog(@"get:%@",[arrayList getElementAtIndex:6]);
//
    GLLog(@"indexOf:%d",[arrayList indexOfElement:[Person personWithName:@"___"]]);
//
    [arrayList clear];
    GLLog(@"isEmpty = %d",[arrayList isEmpty]);
//
    GLLog(@"end");
}


void testCycleSignledList(void) {
    GLCycleSignleLinkedList <NSNumber *>*list  = [[GLCycleSignleLinkedList alloc] init];
    
    [list addElement:@0];
    [list addElement:@1];
    [list addElement:@2];
    [list addElement:@3];
    [list addElement:@4];
    [list addElement:@5]; // [0,1,2,3,4,5]
    
    [list addElement:@-1 atIndex:0];
    [list addElement:@99 atIndex:[list size]]; // [-1,0,1,2,3,4,5,99]
    
    [list removeAtIndex:0];// [0,1,2,3,4,5,99]
    [list removeAtIndex:[list size] - 1];// [0,1,2,3,4,5]
    
    [list setElement:@20 atIndex:0];
    [list setElement:@30 atIndex:[list size] - 1];// [20,1,2,3,4,30]
    
    NSLog(@"%@",list);

    NSLog(@"%d",[list indexOfElement:@20]);
    NSLog(@"%@",[list getElementAtIndex:4]);
    NSLog(@"%d",[list containsElement:@20]);
    NSLog(@"%d",[list containsElement:@120]);
    NSLog(@"%d",[list indexOfElement:@120]);
    
    [list clear];
    NSLog(@"%d",[list isEmpty]);
}


