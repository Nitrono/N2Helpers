//
//  BaseNetworkOperation.m
//  ContractList
//
//  Created by Dmitry on 5/24/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import "BaseNetworkOperation.h"
#import "NetworkOperation+Protected.h"
#import <AFNetworking/AFNetworking.h>

@interface BaseNetworkOperation ()
{
    NSURLSession *session;
}
@end

@implementation BaseNetworkOperation

- (void)main
{
    [super main];
    if (self.isCancelled) {
        self.isExecuting = NO;
        self.isFinished = YES;
        return;
    }
    
    __weak BaseNetworkOperation *wself = self;
    
    
    NSURLRequest *request = [self getRequest];
    
    session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (self.isCancelled) {
            wself.isExecuting = NO;
            wself.isFinished = YES;
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.isCancelled) {
                wself.isExecuting = NO;
                wself.isFinished = YES;
                return;
            }
            
            if ([wself hasErrors:response error:error]) {
                return;
            }
            
            [wself handleResult:data];
            
            NSLog(@"%@",response);
            wself.isExecuting = NO;
            wself.isFinished = YES;
        
        });
        
    }];
    [task resume];
}

- (NSURLRequest *)getRequest
{
    return [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:self.URL parameters:nil error:nil];
}

- (BOOL)hasErrors:(NSURLResponse * _Nullable)response error:(NSError * _Nullable)error
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
    if ([httpResponse statusCode] != 200) {
        NSLog(@"ERROR: get location types");
        NSLog(@"%@",httpResponse.description);
        [self finishedWithStatus:[httpResponse statusCode]];
        return YES;
    }
    return NO;
}

- (void)handleResult:(NSData * _Nullable)data
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"result: %@",json);
}
@end
