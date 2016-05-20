//
//  NetworkOperation.h
//  ContractList
//
//  Created by Dmitry on 4/14/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "INetworkErrorHandlingPolitic.h"

@interface NetworkOperation : NSOperation
{
    @private
    BOOL _isFinished;
    BOOL _isExecuting;
    BOOL _isCancelled;
    void (^onErrorBlock)(NSInteger statusCode, NSError *error);
}


- (instancetype)initWithContext:(NSManagedObjectContext *)context;
- (instancetype)initWithContext:(NSManagedObjectContext *)context URLString:(NSString *)url;
- (void)setOnError:(void (^)(NSInteger statusCode, NSError *error))onError;

@property (strong) id<INetworkErrorHandlingPolitic> errorHandler;
@property (strong) NSManagedObjectContext *innerContext;
@property (strong, nonatomic) NSString *URL;

@end
