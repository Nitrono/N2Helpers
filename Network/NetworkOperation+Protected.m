//
//  NetworkOperation+Private.m
//  ContractList
//
//  Created by Dmitry on 4/15/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import "NetworkOperation+Protected.h"

@implementation NetworkOperation (perotectedMethods)

- (void)setIsFinished:(BOOL)value
{
    if (value != _isFinished)
    {
        [self willChangeValueForKey:@"isFinished"];
        _isFinished = value;
        [self didChangeValueForKey:@"isFinished"];
    }
}
- (void)setIsExecuting:(BOOL)value
{
    if (value != _isExecuting)
    {
        [self willChangeValueForKey:@"isExecuting"];
        _isExecuting = value;
        [self didChangeValueForKey:@"isExecuting"];
    }
}

- (void)setIsCancelled:(BOOL)value
{
    if (value != _isCancelled)
    {
        [self willChangeValueForKey:@"isCancelled"];
        _isCancelled = value;
        [self didChangeValueForKey:@"isCancelled"];
    }
}


@end
