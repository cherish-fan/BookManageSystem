//
//  BookCell.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Book.h"
@interface BookCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *Book_NoTF;
@property (weak, nonatomic) IBOutlet UITextField *BookTypeTF;
@property (weak, nonatomic) IBOutlet UITextField *BookNameTF;
@property (weak, nonatomic) IBOutlet UITextField *PublisherTF;
@property (weak, nonatomic) IBOutlet UITextField *BookYearTF;
@property (weak, nonatomic) IBOutlet UITextField *BookAuthorTF;
@property (weak, nonatomic) IBOutlet UITextField *BookPriceTF;
@property (weak, nonatomic) IBOutlet UITextField *BookStorageTF;
@property (retain,nonatomic) Book *book;
@end
