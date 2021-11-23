//
//  MainViewController.m
//  oclearn
//
//  Created by try on 2021/11/17.
//

#import <Foundation/Foundation.h>
#import "MainViewController.h"
#import "algorithm.h"

@implementation MainViewController : UIViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"MainViewController viewDidLoad");
    self.view.backgroundColor = [UIColor yellowColor];
    
    NSString *dir = @"dir";
    NSString *sub = @"file";
    
    [self setWorkingPath:dir sub:sub];
    [self learnBlock];
    
    
    /*
     * 相关算法测试用例
     */
    OCAlgorithm* algo = [OCAlgorithm create];
//    [algo test_base64];
//    [algo test_md5];
//    [algo test_hex2byte];
    [algo test_origin];
    
    
    NSLog(@"over");
}

-(void) setWorkingPath:(NSString *)dir sub:(NSString *)sub {
    [self setPath:[dir stringByAppendingPathComponent:sub]];
    NSLog(@"xname:%@", self.path);
}

-(void) learnNSData {
    // 1.
    NSString *str = @"日了TT";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"data:%@", data);
    
    NSString *newstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"newstr:%@", newstr);
    
    // 2.
    Byte byte[] = {0, 1, 2, 3};
    NSData *bdata = [[NSData alloc] initWithBytes:byte length:4];
    NSLog(@"bdata:%@", bdata);
    
    // 3. image convert to data
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *name = [NSString stringWithFormat:@"res/login.png"];
    NSString *fpath = [path stringByAppendingPathComponent:name];
    NSLog(@"fpath:%@", fpath);
    
    NSData *img = [NSData dataWithContentsOfFile:fpath];
    UIImage *image = [[UIImage alloc] initWithData:img];

    NSData *img2 = UIImagePNGRepresentation(image);
    NSLog(@"img:%@ img2:%@", img, img2);
}

-(void) learnNSArray {
    NSArray *a1 = [[NSArray alloc] initWithObjects:@"a1a2", @"a3a4", nil];
    NSLog(@"a1:%@", a1);
    
    NSArray *a2 = [NSArray arrayWithObjects:@"a5", @"a6", nil];
    NSLog(@"a2:%@", a2);
    
    NSArray *a3 = @[@"1",@"one",@"3",@4,@"ONE"];
    NSLog(@"a3:%@", a3);
    
    for (NSString* str in a3) {
        NSLog(@"for :%@", str);
    }
    
    [a3 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"idx:%ldk obj:%@", idx, obj);
    }];
}

-(void) learnNSDictionary {
    // 一旦创建，不可修改
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"obj" forKey:@"key"];
    NSLog(@"dict:%@", dict);
    NSLog(@"dict:%@", dict[@"key"]);
    
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"obj1", @"key1", @"obj2", @"key2", nil];
    NSLog(@"dict2:%@", dict2);
    
    for (NSString *key in dict2) {
        NSLog(@"key:%@ - value:%@ value:%@", key, dict2[key], [dict2 objectForKey:key]);
    }
    
    [dict2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
        NSLog(@"key:%@ - value:%@", key, obj);
    }];
}

-(void) learnNSUserDefault {
    // synchronize flush
    NSUserDefaults *udef = [NSUserDefaults standardUserDefaults];
    [udef setObject:@"obj" forKey:@"key"];
    [udef synchronize];
    
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    NSLog(@"str:%@", str);
    
    
    // 写基础数据类型之外，需要先转换成二进制nsdata
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[UIColor redColor]];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"mycolor"];
    
    NSData *rdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"mycolor"];
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:rdata];
    NSLog(@"rdata:%@ color:%@", rdata, color);
    
    
}



-(void) learnBlock {
    __block int multiple = 10;
    
    
    int (^print)(int) = ^(int num) {
        multiple = 100;
        return num * multiple ;
    };
    
    NSLog(@"result:%d", print(10));
    
    
}

@end
