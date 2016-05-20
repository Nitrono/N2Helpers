//
//  NetworkController.m
//  ContractList
//
//  Created by Dmitry on 4/14/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import "NetworkController.h"

@interface NetworkController ()


@end

@implementation NetworkController

- (instancetype) initWithContext:(NSManagedObjectContext *)context
{
    self = [self init];
    if (self)
    {
        queue = [[NSOperationQueue alloc] init];
        [queue setMaxConcurrentOperationCount:1];
        self.innerContext = context;
    }
    return self;
}

- (void)requestDataOnComplete:(void(^)())onComplete
{
    
}

- (void)requestData
{
    [self requestDataOnComplete:^{
        
    }];
}

- (NSFetchedResultsController *)fetchedController
{
// override
    return nil;
}
@end
