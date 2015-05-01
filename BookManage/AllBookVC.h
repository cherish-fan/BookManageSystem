//
//  AllBookVC.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookCell.h"
#import "AppDelegate.h"
@interface AllBookVC : UITableViewController
@property(nonatomic,weak)AppDelegate *appDelegate;
@property (nonatomic,retain)NSArray *bookArray;
@end
