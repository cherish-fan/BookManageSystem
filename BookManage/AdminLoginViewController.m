//
//  AdminLoginViewController.m
//  BookManage
//
//  Created by 梁建 on 15/1/13.
//  Copyright (c) 2015年 梁建. All rights reserved.
//

#import "AdminLoginViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
@interface AdminLoginViewController ()<UIAlertViewDelegate>
@property (nonatomic , weak) AppDelegate* appDelegate;
@property (nonatomic,retain)NSArray *addminArray;
@end

@implementation AdminLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.appDelegate = (AppDelegate *)
    [[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)loginBt:(id)sender {
    
    if (self.adminNameTF.text.length==0||self.passWardTF.text==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"用户名或者密码输入不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Admin"
                                              inManagedObjectContext:self.appDelegate.managedObjectContext];
    request.predicate=[NSPredicate predicateWithFormat:@"username=%@ AND password=%@",self.adminNameTF.text,self.passWardTF.text];
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    self.addminArray = [[self.appDelegate.managedObjectContext
                    executeFetchRequest:request error:&error] mutableCopy];
    NSLog(@"%@",self.addminArray);
    if (self.addminArray == nil)
    {
        NSLog(@"获取FKAuthor实体时出错: %@,%@",error,[error userInfo]);
    }

    if (self.addminArray.count==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提醒" message:@"用户名或者密码错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }else{
        
        
        
        
        
        
        
        [self performSegueWithIdentifier:@"AdminLogin" sender:self];      
    }
    
}
@end
