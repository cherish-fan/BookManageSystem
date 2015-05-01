//
//  LibraryCardVC.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface LibraryCardVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *LibraryCardTF;
@property (retain ,nonatomic)NSArray *cardArray;
@property (retain ,nonatomic)NSArray *cardArray2;
@property (retain ,nonatomic)NSArray *cardArray3;
@property (weak,nonatomic)AppDelegate *appDelegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *unitTF;
@property (weak, nonatomic) IBOutlet UITextField *typeTF;



- (IBAction)addCardAction:(id)sender;
- (IBAction)DelegateCardAction:(id)sender;

@end
