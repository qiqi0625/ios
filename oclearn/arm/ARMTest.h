//
//  ARMTest.h
//  oclearn
//
//  Created by try on 2021/11/26.
//

#ifndef ARMTest_h
#define ARMTest_h

@interface ObjAttr : NSObject
@property(nonatomic, assign)int hand;
@end

@interface ObjItem : NSObject
@property(nonatomic, assign)int Id;
@property(nonatomic, assign)NSString *name;
@property(nonatomic, assign)int age;
@property(nonatomic, assign)NSString *avatar;
@property(nonatomic, assign)int high;
@property(nonatomic, assign)int width;
@property(nonatomic, assign)float depth;
@property(nonatomic, assign)ObjAttr *attr;
@end

@interface ArmTest : NSObject

+(instancetype) create;

+(void) test_static_param0_return0;

+(NSString *) test_static_param1_return1:(int) id;

+(void) test_static_param2_return0:(int) id :(NSString *) name;

+(void) test_static_param3_return0:(int) id :(NSString *) name :(int)age :(NSString *)avatar;

+(ObjItem*) test_static_paramObj_return1:(const ObjItem*) pitem;

-(void) test_all;

-(void) test_member_param0_return0;

-(NSString *) test_member_param1_return1:(int) id;

@end
#endif /* ARMTest_h */
