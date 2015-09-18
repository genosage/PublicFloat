//
//  NSObject+AWStubAdditions.h
//  PublicFloat
//
//  Created by Albert Wang on 18/09/2015.
//  Copyright (c) 2015 YellowTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    A category used to stub a method implementation in super class.
    It is NOT thread safe. 
    A stubSuperSelector call must be followed by a clearSuperStubs call in tear down methods.
 */
@interface NSObject (AWStubAdditions)

/**
    It replaces the implemention of a method in the super class by a given block.
    Parameters will be wrapped in an array and passed to the block.
    Primitive type objects will be wrapped in NSNumber objects.
    Curretly, the arguments types and return type supported is limited.
   
    @aSelector a selector to a Method object that you want to stub.
    @block     a block object used to replace the implementation of the Method.
               Parameters will be passed as an array.
 */
- (void)stubSuperSelector:(SEL)aSelector withBlock:(id (^)(NSArray *))block;

/**
   Clears all stubs.
 */
- (void)clearSuperStubs;

@end
