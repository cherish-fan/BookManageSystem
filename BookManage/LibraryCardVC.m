//
//  LibraryCardVC.m
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "LibraryCardVC.h"
#import "BookCard.h"
@interface LibraryCardVC ()

@end

@implementation LibraryCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.appDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
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

- (IBAction)addCardAction:(id)sender {
    
    if (self.LibraryCardTF.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"所需填项均不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BookCard"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"id_no=%@",self.LibraryCardTF.text];
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    self.cardArray = [[self.appDelegate.managedObjectContext
                       executeFetchRequest:request error:&error] mutableCopy];
    NSLog(@"%@",self.cardArray);
    
    if (self.cardArray.count==0) {
        
        BookCard *bookCard=[NSEntityDescription insertNewObjectForEntityForName:@"BookCard" inManagedObjectContext:self.appDelegate.managedObjectContext];
         bookCard.id_no=[NSNumber numberWithInt:[self.LibraryCardTF.text intValue]];
        bookCard.name=self.nameTF.text;
        bookCard.unit=self.unitTF.text;
        bookCard.type=[NSNumber numberWithInt:[self.typeTF.text intValue]];
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
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"您添加的卡号已经存在" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (IBAction)DelegateCardAction:(id)sender {
    
    if (self.LibraryCardTF.text.length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"所需填项均不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BookCard"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"id_no=%@",self.LibraryCardTF.text];
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    self.cardArray2 = [[self.appDelegate.managedObjectContext
                       executeFetchRequest:request error:&error] mutableCopy];
    NSLog(@"%@",self.cardArray2);
    if (self.cardArray2.count==0) {
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"您要删除的账号不存在" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
        
        
    }else{
        
        
        
        BookCard *bookcard=[self.cardArray2 objectAtIndex:0];
        [self.appDelegate.managedObjectContext deleteObject:bookcard];
        NSError *error;
        // 保存删除操作，如果出现错误，显示错误信息
        if (![self.appDelegate.managedObjectContext save:&error])
        {
            NSLog(@"删除FKAuthor实体出错:%@,%@",error,[error userInfo]);
        }else{
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"删除成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
            
        }

        
        
    }
    
    

}
@end
