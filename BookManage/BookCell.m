//
//  BookCell.m
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "BookCell.h"

@implementation BookCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.Book_NoTF.text=[NSString stringWithFormat:@"%@",self.book.id_no];
    self.BookAuthorTF.text=self.book.book_author;
    self.BookNameTF.text=self.book.book_name;
    self.BookPriceTF.text=[NSString stringWithFormat:@"%@",self.book.book_price];
    self.BookStorageTF.text=[NSString stringWithFormat:@"%@",self.book.book_total_amount];
    self.BookTypeTF.text=[NSString stringWithFormat:@"%@",self.book.book_type];
    self.BookYearTF.text=[NSString stringWithFormat:@"%@",self.book.book_year];
    self.PublisherTF.text=self.book.book_publisher;
    
    
    
    
}


@end
