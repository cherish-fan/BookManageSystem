//
//  SearchBookViewController.m
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "SearchBookViewController.h"
#import "BookCell.h"
#import "AppDelegate.h"
@interface SearchBookViewController ()<UIAlertViewDelegate>
@property(weak,nonatomic)AppDelegate *appDelegate;
@property(retain,nonatomic)NSArray *bookArray;
@end

@implementation SearchBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark-UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    
    NSLog(@"start search %@",searchBar.text);
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"book_name CONTAINS %@",searchBar.text];
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    self.bookArray = [[self.appDelegate.managedObjectContext
                         executeFetchRequest:request error:&error] mutableCopy];
    NSLog(@"%@",self.bookArray);
    if (self.bookArray == nil)
    {
        NSLog(@"获取FKAuthor实体时出错: %@,%@",error,[error userInfo]);
        
        return;
    }
    if (self.bookArray.count==0) {
        UIAlertView *alertVC=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"书库中无此书" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alertVC show];
    }else{
        
        [self.SearchTableView reloadData];
        
        
    }
    
    
    
    
}// called when keyboard search button pressed



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [self.bookArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"friendCell";
    BookCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"BookCell" owner:self options:nil]lastObject];
    }
    cell.book=self.bookArray[indexPath.row];
    
    
    // Configure the cell...
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 271.0;
    
    
}


@end
