//
//  OCPerson.m
//  iOS从OC迁移到Swift
//
//  Created by mac on 2020/12/6.
//

#import "OCPerson.h"
#import "iOS从OC迁移到Swift-Swift.h"
@implementation OCPerson

-(instancetype)initWithAge:(NSInteger)age name:(NSString *)name {
    if (self = [super init]) {
        self.age = age;
        self.name = name;
    }
    return self;
}

+ (instancetype)personWithAge:(NSInteger)age name:(NSString *)name {
    return [[self alloc] initWithAge:age name:name];
}

+ (void)run {
    NSLog(@"%@ + run",self.class);
}

-(void)run {
    NSLog(@"%zd %@ -run",self.age,self.name);
}

+ (void)eat:(NSString *)food other:(NSString *)other {
    NSLog(@"%@ +eat %@ %@",self.class,food,other);
}

- (void)eat:(NSString *)food other:(NSString *)other {
    NSLog(@"%zd %@ -eat %@ %@",self.age,self.name,food,other);
}

int sum(int a,int b) {
    SwiftCar *car = [[SwiftCar alloc] initWithPrice:20.2 band:@"banz"];
    car.name = @"Bently";
    car.price = 108.5;
    [car drive];
    [car exec];
    [SwiftCar run];
    return a + b;
}

@end
