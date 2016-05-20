//
//  NetworkController.h
//  ContractList
//
//  Created by Dmitry on 4/14/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NetworkController : NSObject
{
    @protected
    NSOperationQueue *queue;
}
@property (strong) NSManagedObjectContext *innerContext;


- (instancetype) initWithContext:(NSManagedObjectContext *)context;

- (void)requestData;
- (void)requestDataOnComplete:(void(^)())onComplete;
- (NSFetchedResultsController *)fetchedController;
@end
