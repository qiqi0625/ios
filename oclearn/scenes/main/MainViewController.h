//
//  MainViewController.h
//  oclearn
//
//  Created by try on 2021/11/17.
//

#ifndef MainViewController_h
#define MainViewController_h

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property(nonatomic, strong) NSString *path;

-(void)viewDidLoad;

-(void) setWorkingPath:(NSString *)dir sub:(NSString *)sub;


/*
 * 以下知识点学习
 */

/* NSLog 常见格式化输出
 * %@，输出对象
 * %d, %i 输出整形 %u 无符整形 %f 浮点 %lld 64b长整数
 * %s c 字符串
 * %p 指针
 * %x 二进制整数
 */

-(void) learnNSData;


-(void) learnNSArray;


-(void) learnNSDictionary;

-(void) learnNSUserDefault;

-(void) learnBlock;


@end

#endif /* MainViewController_h */
