//
//  NetworkErrorHandlerPolitic.m
//  ContractList
//
//  Created by Dmitry on 5/4/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import "NetworkErrorHandlerPolitic.h"
#import <UIKit/UIKit.h>
#import "UIAlertController+Window.h"

@interface NetworkErrorHandlerPolitic ()
{
//    UIAlertController *alert;
}
@end

@implementation NetworkErrorHandlerPolitic

- (BOOL)networkOperation:(NetworkOperation *)sender failedWithStatusCode:(NSInteger)statusCode
{
    __weak NetworkOperation *wsender = sender;
    NSLog(@"operation '%@' failed with status code:%li",[sender class], (long)statusCode);
    
    if (statusCode == 0) //no connection
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error",@"error alert title")
                                                                           message:NSLocalizedString(@"There is no connection to the server",@"error alert message")
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Retry",@"error alert button") style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                      [wsender performSelector:@selector(main) withObject:nil afterDelay:0];
                                                                  }];
            
        [alert addAction:defaultAction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [alert show:YES];
        });
        return YES;
    }
    return NO;
}

@end
