//
//  Admin.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Admin : NSManagedObject

@property (nonatomic, retain) NSNumber * id_no;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * admin_name;
@property (nonatomic, retain) NSString * contact;

@end
