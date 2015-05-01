//
//  BookCard.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BookCard : NSManagedObject

@property (nonatomic, retain) NSNumber * id_no;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * unit;

@end
