//
//  BorrowRecord.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BorrowRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * id_no;
@property (nonatomic, retain) NSNumber * book_card_id;
@property (nonatomic, retain) NSString * borrow_date;
@property (nonatomic, retain) NSString * return_date;
@property (nonatomic, retain) NSNumber * admin_id;

@end
