//
//  PFServerAPIStubs.m
//  PublicFloat
//
//  Created by Albert Wang on 3/09/2015.
//  Copyright (c) 2015 YellowTeam. All rights reserved.
//

#if DEBUG

#import "PFServerAPIStubs.h"
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <PublicFloat-Swift.h>


@implementation PFServerAPIStubs

+ (void)load
{
    [self stubFetchPhotoRequest];
    [self stubLoginRequest];
    
}

+ (void)stubLoginRequest
{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request){
        return [request.URL.relativePath hasPrefix:@"/login"];
    }
                        withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request){
                            return [OHHTTPStubsResponse responseWithJSONObject:@{
                                                                                 @"hasError" : @0,
                                                                                 @"errorMessage" : @"",
                                                                                 @"responseData" : @"sdfjsodfsdTEEFSDFOijDFDFSFDSDF121FDSDFDF11ww"
                                                                                 } statusCode:201 headers:@{@"Content-Type":@"application/json"}];
                        }];
}


// TODO: Add a real photo url in the json object.
+ (void)stubFetchPhotoRequest
{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request){
        return [request.URL.relativePath hasPrefix:@"/photos"];
    }
                        withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request){
                            return [OHHTTPStubsResponse responseWithJSONObject:@{
                                                                                 @"hasError" : @0,
                                                                                 @"errorMessage" : @"",
                                                                                 @"numberOfPhotos" : @1,
                                                                                 @"photoUrls" : @[@""]
                                                                                 
                                                                                 } statusCode:201 headers:@{@"Content-Type":@"application/json"}];
                        }];
}

@end

#endif