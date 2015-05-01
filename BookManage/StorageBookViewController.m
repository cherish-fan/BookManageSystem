//
//  StorageBookViewController.m
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "StorageBookViewController.h"
#import "AppDelegate.h"
#import "Book.h"
@interface StorageBookViewController ()<UIAlertViewDelegate>
@property (nonatomic , weak) AppDelegate* appDelegate;
@property (nonatomic,retain) NSArray *bookArray;
@end

@implementation StorageBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate = (AppDelegate *)
    [[UIApplication sharedApplication] delegate];
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

- (IBAction)storageBook:(id)sender {
    NSLog(@"text  %@",self.bookNoTF.text);
    if ([self.bookNoTF.text isEqualToString:@""]||[self.bookNameTF.text isEqualToString:@""]||[self.bookAmoutTF.text isEqualToString:@""]||[self.bookAuthorTF.text isEqualToString:@""]||[self.bookPublisherTF.text isEqualToString:@""]||[self.bookTypeTF.text isEqualToString:@""]||[self.bookYearTF.text isEqualToString:@""]) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"所需填项均不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }else{
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book"
                                                  inManagedObjectContext:self.appDelegate.managedObjectContext];
        request.predicate=[NSPredicate predicateWithFormat:@"id_no=%@",self.bookNoTF.text];
        [request setEntity:entity];
        NSError *error = nil;
        // 执行抓取数据的请求，返回符合条件的数据
        self.bookArray = [[self.appDelegate.managedObjectContext
                             executeFetchRequest:request error:&error] mutableCopy];
        NSLog(@"%@",self.bookArray);
        if (self.bookArray.count==0) {
            
            Book *book=[NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.appDelegate.managedObjectContext];
            book.id_no=[NSNumber numberWithInt:[self.bookNoTF.text intValue]];
            book.book_name=self.bookNameTF.text;
            book.book_author=self.bookAuthorTF.text;
            book.book_publisher=self.bookPublisherTF.text;
            book.book_storage=[NSNumber numberWithInt:[self.bookAmoutTF.text intValue]];
            book.book_type=self.bookTypeTF.text;
            book.book_year=[NSNumber numberWithInt:[self.bookYearTF.text intValue]];
            book.book_total_amount=[NSNumber numberWithInt:[self.bookAmoutTF.text intValue]];
            book.book_price=[NSNumber numberWithDouble:[self.bookprice.text doubleValue]];
            NSError *error;
            // 设置完实体属性之后，调用托管对象上下文的save:方法将实体写入数据库，如果保存成功
            if ([self.appDelegate.managedObjectContext save:&error])
            {
                // 使用UIActionSheet提示添加成功
                [[[UIActionSheet alloc] initWithTitle:@"添加成功" delegate:nil
                                    cancelButtonTitle:nil destructiveButtonTitle:@"确定"
                                    otherButtonTitles:nil, nil] showInView:self.view];
                // 返回显示作者列表的视图控制器
                //[self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                NSLog(@"添加FKAuthor实体出错: %@,%@" , error ,[error userInfo]);
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"添加失败" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alert show];
                
            }

            
            
            
        }else{
            
            
            
            
        }
        
        
        
    }
}
@end
