//
//  WQPet.m
//  WQKit
//
//  Created by xunni zou on 2020/5/24.
//  Copyright © 2020 xunni zou. All rights reserved.
//

#import "WQPet.h"
#import "WQCat.h"
#import "WQDog.h"

@interface WQPet () <WQDogProtocol,WQCatProtocol>

@property (nonatomic, strong) WQCat *cat;

@property (nonatomic, strong) WQDog *dog;

@end

@implementation WQPet

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([self.cat respondsToSelector:aSelector]) {
        return self.cat;
    }
    else if ([self.dog respondsToSelector:aSelector]){
        return self.dog;
    }
    return self;
}

- (WQCat *)cat
{
    if (!_cat) {
        _cat = [[WQCat alloc] init];
    }
    return _cat;
}

- (WQDog *)dog
{
    if (!_dog) {
        _dog = [[WQDog alloc] init];
    }
    return _dog;
}

@end
