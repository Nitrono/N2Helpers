//
//  NetworkOperation.m
//  ContractList
//
//  Created by Dmitry on 4/14/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import "NetworkOperation.h"
#import "NetworkOperation+Protected.h"
#import "NetworkErrorHandlerPolitic.h"

@interface NetworkOperation ()

@end

@implementation NetworkOperation

- (instancetype) initWithContext:(NSManagedObjectContext *)context
{
    self = [self init];
    if (self)
    {
        self.innerContext = context;
        self.errorHandler = [[NetworkErrorHandlerPolitic alloc] init];
    }
    return self;
}

- (instancetype)initWithContext:(NSManagedObjectContext *)context URLString:(NSString *)url
{
    self = [self initWithContext:context];
    if (self) {
        self.URL = url;
    }
    return self;
}

- (void)setOnError:(void (^)(NSInteger statusCode, NSError *error))onError
{
    onErrorBlock = [onError copy];
}

- (void)start
{
    [super start];
    if (!self.isCancelled) {
        self.isExecuting = YES;
        self.isFinished = NO;
    }
    else
    {
        self.isFinished = YES;
    }
}

- (BOOL)isReady
{
    return YES;
}

- (BOOL)isFinished
{
    return _isFinished;
}


- (BOOL)isExecuting
{
    
    return _isExecuting;
}

- (void)cancel
{
    [super cancel];
    self.isCancelled = YES;
}

- (void)finishedWithStatus:(NSInteger)status
{
    if (self.errorHandler) {
        BOOL isHandled = [self.errorHandler networkOperation:self failedWithStatusCode:status];
        if (!isHandled && onErrorBlock) {
            onErrorBlock(status, nil);
        }
    }
}

@end
