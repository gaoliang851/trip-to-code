//
//  GLLog.m
//  Hello Algorithm
//
//  Created by mac on 2021/4/29.
//

#import "GLLog.h"
static int i = 0;

void GLLog(NSString *format,...) {
    va_list args;
    va_start(args, format);
    NSString *string = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    NSString *strFormat = [NSString stringWithFormat:@"at%d:   %@",__LINE__,string];
    //GLLog(@"%@", strFormat);
    printf("%s\n",[strFormat cStringUsingEncoding:NSUTF8StringEncoding]);

    i++;
}
