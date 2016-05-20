//
//  INetworkErrorHandlerPolitic.h
//  ContractList
//
//  Created by Dmitry on 5/4/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#ifndef INetworkErrorHandlingPolitic_h
#define INetworkErrorHandlingPolitic_h

@class NetworkOperation;

@protocol INetworkErrorHandlingPolitic
- (BOOL)networkOperation:(NetworkOperation *)sender failedWithStatusCode:(NSInteger)statusCode;
@end

#endif /* INetworkErrorHandlingPolitic_h */
