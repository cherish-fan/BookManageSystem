//
//  AdminLoginViewController.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *adminNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passWardTF;
- (IBAction)loginBt:(id)sender;


@end
