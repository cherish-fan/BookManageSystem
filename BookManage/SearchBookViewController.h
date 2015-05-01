//
//  SearchBookViewController.h
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBookViewController : UIViewController<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBookBar;
@property (weak, nonatomic) IBOutlet UITableView *SearchTableView;

@end
