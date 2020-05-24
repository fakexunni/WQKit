//
//  NSObject+WQKit.h
//  WQKit
//
//  Created by xunni zou on 2020/5/20.
//  Copyright © 2020 xunni zou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WQKit)

@end


/**
 实现NSCoding协议，快速归档
*/
@interface NSObject (WQCoding)

- (void)wq_decodeWithCoder:(NSCoder *)decoder;

- (void)wq_encodeWithCoder:(NSCoder *)coder;

@end

/**
 实现自动copy
 */
@interface NSObject (WQCopy)

- (id)wq_copyWithZone:(NSZone *)zone;

@end


@interface NSObject (WQProperty)

@end

/**
 拦截未实现的消息，避免崩溃
 */
@interface NSObject (ExceptionForward)

@end

NS_ASSUME_NONNULL_END
