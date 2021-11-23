//
//  LoginViewController.m
//  oclearn
//
//  Created by try on 2021/11/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "MainViewController.h"

@implementation LoginViewController : UIViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"LoginViewController viewDidLoad");
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"黑信";
    
    
    // 0. bg
    UIImage *bg = [UIImage imageNamed:@"res/bg.jpg"];
    self.view.layer.contents = (id)bg.CGImage;
    
    
    // 1. 登陆按钮
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    
    UIImage *image = [UIImage imageNamed:@"res/login.png"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setTitle:@"登陆" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    btn.frame = CGRectMake(size.width/2 - image.size.width/2, size.height*3/4, image.size.width, image.size.height);
    [self.view addSubview:btn];
    
    
    [btn addTarget:self action:@selector(onClickedLogin) forControlEvents:UIControlEventTouchUpInside];
}

-(void) onClickedLogin {
    NSLog(@"onClickedLogin");
    
    MainViewController *main = [[MainViewController alloc] init];
    [self.navigationController pushViewController:main animated:YES];
}

@end
