//
//  ReturnBookViewController.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Book.h"
#import "BorrowRecord.h"
@interface ReturnBookViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *BorrorwCard_id;
- (IBAction)quaryRecord:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *returnBookTF;
- (IBAction)returnBookAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *bookRecordTV;
@property (weak,nonatomic)AppDelegate *appDelegate;
@property (retain,nonatomic)NSArray *bookArray;
@property(retain,nonatomic)NSArray *bookArray3;
@end
