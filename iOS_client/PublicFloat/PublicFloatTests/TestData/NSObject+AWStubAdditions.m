//
//  NSObject+AWStubAdditions.m
//  PublicFloat
//
//  Created by Albert Wang on 18/09/2015.
//  Copyright (c) 2015 YellowTeam. All rights reserved.
//

#import "NSObject+AWStubAdditions.h"
#import <objc/runtime.h>
#import <string.h>

static NSMapTable *stubMap;

@implementation NSObject (AWStubAdditions)

- (void)stubSuperSelector:(SEL)aSelector withBlock:(id (^)(NSArray *))block
{
    NSParameterAssert(aSelector);
    NSParameterAssert(block);
    
    Method originalMethod = class_getInstanceMethod(self.superclass, aSelector);
    IMP originalImp = method_getImplementation(originalMethod);
    id impBlock = [self impBlockWith:block originalMethod:originalMethod];
    IMP stubbedImp = imp_implementationWithBlock(impBlock);
    
    if (!stubMap) {
        stubMap = [NSMapTable strongToStrongObjectsMapTable];
    }
    [stubMap setObject:[NSValue value:&originalMethod withObjCType:@encode(Method)]
                forKey:[NSValue value:&originalImp withObjCType:@encode(IMP)]];
    method_setImplementation(originalMethod, stubbedImp);
}

- (id)impBlockWith:(id (^)(NSArray *))block originalMethod:(Method)originalMethod
{
    // id self, SEL selectorOfMethod, arguments...
    // Current support limited types of arguments and return type.
    id impBlock = ^(id self, ...){
        va_list argumentList;
        va_start(argumentList,self);
        unsigned int numberOfArguments = method_getNumberOfArguments(originalMethod);
        NSMutableArray *args = [NSMutableArray new];
        for ( int i = 2; i < numberOfArguments; i++) {
            
            char objCType[2];
            bzero(objCType,2);
            size_t length = 2;
            method_getArgumentType(originalMethod,i,objCType,length);
            
            if (strcmp(objCType, @encode(id)) == 0) {
                id object = va_arg(argumentList, id);
                [args addObject:object];
            }
            else if (strcmp(objCType, @encode(BOOL)) == 0) {
                BOOL boolArg = va_arg(argumentList, int);
                [args addObject:@(boolArg)];
            }
            else if(strcmp(objCType, @encode(long)) == 0) {
                long longArg = va_arg(argumentList, long);
                [args addObject:@(longArg)];
            }
            else if(strcmp(objCType, @encode(int)) == 0) {
                int intArg = va_arg(argumentList, int);
                [args addObject:@(intArg)];
            }
        }
        va_end(argumentList);
        return block(args);
    };
    return impBlock;
}

- (void)clearSuperStubs
{
    NSEnumerator *enumerator = [stubMap keyEnumerator];
    NSValue *keyValue;
    NSValue *objectValue;
    while ((keyValue = [enumerator nextObject])) {
        objectValue = [stubMap objectForKey:keyValue];
        IMP originalImp;
        [keyValue getValue:&originalImp];
        Method originalMethod;
        [objectValue getValue:&originalMethod];
        imp_removeBlock(method_getImplementation(originalMethod));
        method_setImplementation(originalMethod, originalImp);
    }
    [stubMap removeAllObjects];
}

@end


