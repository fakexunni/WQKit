//
//  NSObject+WQKit.m
//  WQKit
//
//  Created by xunni zou on 2020/5/20.
//  Copyright © 2020 xunni zou. All rights reserved.
//

#import "NSObject+WQKit.h"
#import <objc/runtime.h>

@implementation NSObject (WQKit)




@end


@implementation NSObject (WQCoding)

- (void)wq_decodeWithCoder:(NSCoder *)decoder
{
}

- (void)wq_encodeWithCoder:(NSCoder *)coder
{
    
}

@end


@implementation NSObject (WQCopy)

- (id)wq_copyWithZone:(NSZone *)zone
{
    return nil;
}

@end


@implementation NSObject (WQProperty)

- (NSArray *)allPropertyNameArray
{
    unsigned int count = 0;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    objc_property_t *propertys = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        const char *name = property_getName(property);
        NSString *nameString = [[NSString alloc] initWithUTF8String:name];
        [array addObject:nameString];
    }
    return [NSArray arrayWithArray:array];
}

@end

@implementation NSObject (ExceptionForward)

// 接收消息的IMP
void dynamicResolveMethod(id self, SEL _cmd) {
    NSLog(@"method forward");
    //可以在这做做崩溃统计等操作
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    const char *types = sel_getName(sel);
    class_addMethod([self class], sel, (IMP)dynamicResolveMethod, types);
    return YES;
}

#pragma clang diagnostic pop

//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//
//}


@end
