//
//  BorrowBookViewController.m
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "BorrowBookViewController.h"
#import "AppDelegate.h"
#import "Book.h"
#import "BorrowRecord.h"
@interface BorrowBookViewController ()<UIAlertViewDelegate>
@property(weak,nonatomic) AppDelegate *appDelegate;
@property(retain,nonatomic)NSArray *bookArray;
@property(retain,nonatomic)NSArray *bookArray2;
@property(retain,nonatomic)NSArray *bookArray3;
@end

@implementation BorrowBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.appDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    self.borrowBookCountTF.text=@"1";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)queryBook:(id)sender {
    
    if (self.borrowBookIDTF.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"输入不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
        return;
    }
    
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"id_no=%@",self.borrowBookIDTF.text];
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
    
    
    for (Book *book in self.bookArray) {
        NSLog(@"%@,%@,%@,%@",book.book_name,book.book_author,book.book_publisher,book.book_type);
    }
    if (self.bookArray.count!=0) {
        Book *book=[self.bookArray objectAtIndex:0];
        
        self.bookMessageTV.text=[NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@",book.book_name,book.book_author,book.book_publisher,book.book_type,book.book_total_amount];

    }else{
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"未查到您借的书" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
        
    }
    
    
    
}

- (IBAction)borrowBook:(id)sender {
    
    
    if (self.borrowBookIDTF.text.length==0||self.borrowBookIDTF.text.length==0||self.card_id.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"输入不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
        return;
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"id_no=%@",self.borrowBookIDTF.text];
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    self.bookArray2 = [[self.appDelegate.managedObjectContext
                       executeFetchRequest:request error:&error] mutableCopy];
    NSLog(@"%@",self.bookArray2);
    if (self.bookArray2== nil)
    {
        NSLog(@"获取FKAuthor实体时出错: %@,%@",error,[error userInfo]);
    }
    
    if (self.bookArray2.count==1) {
        Book *book=[self.bookArray2 objectAtIndex:0];
        
        
        NSString *bookcountstring=[NSString stringWithFormat:@"%@",book.book_total_amount];
        int count=[bookcountstring intValue]-[self.borrowBookCountTF.text intValue];
        if (count<0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"图书储备量不足" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
            
            return;
        }
        
        
        book.book_total_amount=[NSNumber numberWithInt:count];
       
        
        if ([self.appDelegate.managedObjectContext save:&error]) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"借书成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        
             BorrowRecord *borrowRecord=[NSEntityDescription insertNewObjectForEntityForName:@"BorrowRecord" inManagedObjectContext:self.appDelegate.managedObjectContext];
            borrowRecord.id_no=[NSNumber numberWithInt:self.card_id.text.intValue];
            borrowRecord.book_card_id=[NSNumber numberWithInt:self.borrowBookRecordTF.text.intValue];
            NSDate *date=[NSDate date];
            NSDate *borrowDate=[date dateByAddingTimeInterval:3600*24*30];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            NSString *formate=[NSString stringWithFormat:@"%@",@"yyyy'年'MM'月'dd'日'"];
            [formatter setDateFormat:formate];
            NSString *str = [formatter stringFromDate:date];
            NSString *str2=[formatter stringFromDate:borrowDate];
            borrowRecord.borrow_date=str;
            borrowRecord.return_date=str2;
#warning 修改
            borrowRecord.admin_id=@10001;
            [self.appDelegate.managedObjectContext save:&error];
            
            
            
            
            
        }else{
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"借书失败" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
        
        
        
        
        
    }
    
   

    
    
    
    
    
    
}

- (IBAction)quaryBookRecord:(id)sender {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BorrowRecord"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"book_card_id=%@",self.borrowBookRecordTF.text];
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
        
        self.bookMessageTV.text=bookstr;
        
    }
    
    
    
    
}

- (IBAction)gotoBorrowVC:(id)sender {
    NSLog(@"______________________");
     [self performSegueWithIdentifier:@"Borrow" sender:self];
}
@end
