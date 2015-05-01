//
//  Book.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSNumber * id_no;
@property (nonatomic, retain) NSString * book_name;
@property (nonatomic, retain) NSString * book_type;
@property (nonatomic, retain) NSString * book_publisher;
@property (nonatomic, retain) NSNumber * book_year;
@property (nonatomic, retain) NSString * book_author;
@property (nonatomic, retain) NSNumber * book_price;
@property (nonatomic, retain) NSNumber * book_total_amount;
@property (nonatomic, retain) NSNumber * book_storage;

@end
