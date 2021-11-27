//
//  ARMTest.m
//  oclearn
//
//  Created by try on 2021/11/26.
//

#import <Foundation/Foundation.h>
#import "ARMTest.h"

@implementation ObjItem : NSObject

@end

@implementation ObjAttr : NSObject

@end

static ArmTest *instance = NULL;

@implementation ArmTest : NSObject

+(instancetype) create {
    if (instance == NULL) {
        instance = [ArmTest alloc];
    }
    return instance;
}

+(void) test_static_param0_return0 {
    NSLog(@"static no param no returns");
}

+(NSString *) test_static_param1_return1:(int) id {
    NSString *str = [[NSString alloc] initWithFormat:@"return %d", id];
    return str;
}

+(void) test_static_param2_return0:(int) id :(NSString *) name {
    NSLog(@"static no returns, id:%d name:%@", id, name);
    
    id = 3;
    for (int i=0; i!=id; i++) {
        name = [[NSString alloc] initWithFormat:@"%@-%d", name, i];
    }
    NSLog(@"static no returns, id:%d target name:%@", id, name);
}

+(void) test_static_param3_return0:(int) id :(NSString *) name :(int)age :(NSString *)avatar {
    NSLog(@"static no returns, id:%d name:%@ avatar:%@", id, name, avatar);
}

+(ObjItem*) test_static_paramObj_return1:(const ObjItem*) pitem {
    NSLog(@"static return obj, addr:%p", pitem);
    
    ObjItem *item = [ObjItem alloc];

    [item setId:1001];
    [item setName:@"i am try"];
    [item setAge:21];
    [item setAvatar:@"head image"];
    [item setWidth:100];
    [item setHigh:200];
    
    ObjAttr *attr = [ObjAttr alloc];
    [attr setHand:1];
    [item setAttr:attr];
    
    return item;
}

-(void) test_member_param0_return0 {
    NSLog(@"member no param no returns");
}

-(NSString *) test_member_param1_return1:(int) id {
    NSLog(@"member 1 param 1 return");
    NSString *str = [[NSString alloc] initWithFormat:@"return %d", id];
    return str;
}

-(void) test_all {
    ArmTest* arm = [ArmTest create];
    
    // 1. member function 0 params, 0 returns
    [arm test_member_param0_return0];
    
    // 2. member function 1 param, 1 return
    NSString *ret1 = [arm test_member_param1_return1:101];
    NSLog(@"111 ret:%@", ret1);
    
    // 3. static function 0 params, 0 returns
    [ArmTest test_static_param0_return0];
    
    // 4. static function 1 param, 1 return
    NSString *ret2 = [ArmTest test_static_param1_return1:201];
    NSLog(@"222 ret:%@", ret2);
    
    // 5. static function 2 params, 0 returns
    [ArmTest test_static_param2_return0:301 :@"name301"];
    
    // 6. static function 3 params, 0 returns
    [ArmTest test_static_param3_return0:401 :@"name401" :501 :@"avatar501"];
    
    // 7. static function obj param, obj return
    const ObjItem* pitem = [ObjItem alloc];
    [pitem setId:601];
    [pitem setName:@"name601"];
    [pitem setAge:701];
    [pitem setAvatar:@"avatar601"];
    [pitem setWidth:1000];
    [pitem setHigh:2000];
    
    ObjAttr *attr = [ObjAttr alloc];
    [attr setHand:10];
    [pitem setAttr:attr];
    ObjItem *newItem = [ArmTest test_static_paramObj_return1:pitem];
    NSLog(@"333 ret:%p", newItem);
}

@end
