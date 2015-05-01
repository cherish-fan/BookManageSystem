//
//  StorageBookViewController.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StorageBookViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *bookNoTF;
@property (weak, nonatomic) IBOutlet UITextField *bookTypeTF;
@property (weak, nonatomic) IBOutlet UITextField *bookNameTF;
@property (weak, nonatomic) IBOutlet UITextField *bookPublisherTF;
@property (weak, nonatomic) IBOutlet UITextField *bookYearTF;
@property (weak, nonatomic) IBOutlet UITextField *bookAuthorTF;
@property (weak, nonatomic) IBOutlet UITextField *bookAmoutTF;
@property (weak, nonatomic) IBOutlet UITextField *bookprice;
- (IBAction)storageBook:(id)sender;

@end
