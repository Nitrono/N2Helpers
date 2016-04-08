//
//  BaseScrollableViewController.h
//  ContractList
//
//  Created by Dmitry on 4/7/16.
//  Copyright © 2016 sam-solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseScrollableViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *allFields;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
