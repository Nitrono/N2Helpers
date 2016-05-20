//
//  NetworkOperation+Private.h
//  ContractList
//
//  Created by Dmitry on 4/15/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkOperation.h"
@interface NetworkOperation(protectedMethods)
- (void)setIsFinished:(BOOL)value;
- (void)setIsExecuting:(BOOL)value;
- (void)setIsCancelled:(BOOL)value;

- (void)finishedWithStatus:(NSInteger)status;

@end
