//
//  ReturnBookViewController.m
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "ReturnBookViewController.h"

@interface ReturnBookViewController ()<UIAlertViewDelegate>

@end

@implementation ReturnBookViewController

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

- (IBAction)quaryRecord:(id)sender {
    
    if (self.BorrorwCard_id.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"输入不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
        
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BorrowRecord"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"book_card_id=%@",self.BorrorwCard_id.text];
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    self.bookArray3 = [[self.appDelegate.managedObjectContext
                        executeFetchRequest:request error:&error] mutableCopy];
    NSLog(@"%@",self.bookArray3);
    if (self.bookArray3== nil)
    {
        NSLog(@"获取FKAuthor实体时出错: %@,%@",error,[error userInfo]);
    }
    NSString *bookstr=[[NSString alloc]init];
    if (self.bookArray3.count>0) {
        
        for (BorrowRecord *record in self.bookArray3) {
            
            NSString *recordString=[NSString stringWithFormat:@"借书证号:%@\n借书日期:%@\n归还日期:%@\n经办人:%@\n\n\n",record.book_card_id,record.borrow_date,record.return_date,record.admin_id];
            
            bookstr=[NSString stringWithFormat:@"%@%@",bookstr,recordString];
            
            
        }
        
        self.bookRecordTV.text=bookstr;
        
    }

    
    
    
    
    
    
}
- (IBAction)returnBookAction:(id)sender {
    
    if (self.returnBookTF.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"输入不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
        return;

    }
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"id_no=%@",self.returnBookTF.text];
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    self.bookArray = [[self.appDelegate.managedObjectContext
                        executeFetchRequest:request error:&error] mutableCopy];
    NSLog(@"%@",self.bookArray);
    if (self.bookArray== nil)
    {
        NSLog(@"获取FKAuthor实体时出错: %@,%@",error,[error userInfo]);
    }
    
    if (self.bookArray.count==1) {
        Book *book=[self.bookArray objectAtIndex:0];
        
        
        NSString *bookcountstring=[NSString stringWithFormat:@"%@",book.book_total_amount];
        int count=[bookcountstring intValue]+1;
        
        
        book.book_total_amount=[NSNumber numberWithInt:count];
        
           if ([self.appDelegate.managedObjectContext save:&error]) {
               
               UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"还书成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
               [alert show];
           }else{
               
               UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"还书失败" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
               [alert show];
               
               
           }
        
        
        
        
        
        
    
    
    }else{
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"书库中没有这本书" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
        
    }
    
    
    
    
}

@end
