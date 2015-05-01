//
//  BorrowBookViewController.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BorrowBookViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *borrowBookIDTF;
@property (weak, nonatomic) IBOutlet UITextField *borrowBookCountTF;
@property (weak, nonatomic) IBOutlet UITextView *bookMessageTV;
@property (weak, nonatomic) IBOutlet UITextField *borrowBookRecordTF;
@property (weak, nonatomic) IBOutlet UITextField *card_id;

- (IBAction)queryBook:(id)sender;
- (IBAction)borrowBook:(id)sender;
- (IBAction)quaryBookRecord:(id)sender;
- (IBAction)gotoBorrowVC:(id)sender;

@end
