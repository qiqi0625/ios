//
//  algorithm.h
//  oclearn
//
//  Created by try on 2021/11/18.
//

#ifndef algorithm_h
#define algorithm_h

@interface OCAlgorithm : NSObject

+(instancetype) create;
-(void) init;


-(void) test_origin;

-(void) test_base64;

-(void) test_md5;

-(void) sha1;

-(void) aes;

-(void) rsa;

-(void) test_hex2byte;

@end

#endif /* algorithm_h */
