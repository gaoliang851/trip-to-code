//
//  ViewController.m
//  04-KVO&KVC
//
//  Created by mac on 2020/12/31.
//

#import "ViewController.h"
#import "GLPerson.h"

#import <objc/runtime.h>

@interface ViewController ()
@property (strong,nonatomic) GLPerson *person1;
@property (strong,nonatomic) GLPerson *person2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 初始化两个对象
    self.person1 = [[GLPerson alloc] init];
    self.person1.age = 1;
    self.person2 = [[GLPerson alloc] init];
    self.person2.age = 2;
    
    //
    NSLog(@"self.person1:%p",self.person1);
    NSLog(@"self.person2:%p",self.person2);
    
    NSLog(@"%p %p",
          [self.person1 methodForSelector:@selector(setAge:)],
          [self.person2 methodForSelector:@selector(setAge:)]);
    
    //person1添加KVO
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:nil];
    
    NSLog(@"%p %p",
          [self.person1 methodForSelector:@selector(setAge:)],
          [self.person2 methodForSelector:@selector(setAge:)]);
    
    [self printInfoWithClass:object_getClass(self.person1)];
    
    [self.person1 setValue:@(1) forKey:@""];
    
    
    [self willChangeValueForKey:@"keyPath"];
    
    // 原来的setter实现
    
    [self didChangeValueForKey:@"keyPath"];
    
    //内部调用observer的observeValueForKeyPath:ofObject:change:context:方法
    

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.person1.age = 10;
    self.person1->_age = 10;
    self.person2.age = 20;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@ : %@",object,change);
}


- (void) printInfoWithClass:(Class) clazz {
    
    ///遍历方法
    unsigned int methodCount = 0;
    Method  *methods = class_copyMethodList(clazz, &methodCount);
    for (int i = 0; i < methodCount; i++) {
        ///获得方法
        Method method = methods[i];
        ///获取方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        NSLog(@"方法名:%@",methodName);
    }
    free(methods);
    
    ///遍历属性
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList(clazz, &ivarCount);
    for (int i = 0; i < ivarCount; i++) {
        Ivar ivar = ivars[i];
        const char *ivarName = ivar_getName(ivar);
        const char *ivarType = ivar_getTypeEncoding(ivar);
        NSLog(@"属性类型：%s，属性名称：%s",ivarType,ivarName);
    }
    free(ivars);
    
    //打印父类
    NSLog(@"父类：%@",[clazz superclass]);
}

@end
