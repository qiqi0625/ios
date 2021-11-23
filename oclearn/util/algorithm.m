//
//  algorithm.m
//  oclearn
//
//  Created by try on 2021/11/18.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import "algorithm.h"
#import "base64.h"
#import "md5.h"
#import "hex2byte.h"

@implementation OCAlgorithm : NSObject
+(instancetype) create{
    OCAlgorithm *alg = [OCAlgorithm alloc];
    return alg;
}

-(void) init {
    [super init];
    
}

-(void) test_origin {
    
    printf("md:");
    unsigned char buff[CC_MD5_DIGEST_LENGTH];
    CC_MD5((void*)"love", 4, buff);
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        printf("%2.2x", buff[i]);
    }
    printf("\n");
    
    printf("sha1:");
    unsigned char shaBuff[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1((void*)"love", 4, shaBuff);
    for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        printf("%2.2x", shaBuff[i]);
    }
    printf("\n");
    

    NSString *str = @"love";
    NSLog(@"base64 origin:%@", str);
    
    NSData *encode = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodeStr = [encode base64EncodedStringWithOptions:0];
    NSLog(@"base64 encode:%@", encodeStr);
    
    NSData *decode = [[NSData alloc] initWithBase64EncodedString:encodeStr options:0];
    NSString *decodeStr = [[NSString alloc] initWithData:decode encoding:NSUTF8StringEncoding];
    NSLog(@"base64 decode:%@", decodeStr);
    
    // aes key
    const NSString *aesKey = @"iloveyoubaby";
    
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr)); // memset zero
    [aesKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    // aes encode
    size_t aesEncBytes;
    NSData *aesSrcData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger aesSrcLen = [aesSrcData length];
    
    size_t aesEncBufferLen = aesSrcLen + kCCBlockSizeAES128;
    void *aesEncBuffer = malloc(aesEncBufferLen);
    
    CCCryptorStatus status = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [aesSrcData bytes], aesSrcLen, aesEncBuffer, aesEncBufferLen, &aesEncBytes);
    if (status == kCCSuccess) {
        NSData *encdata = [NSData dataWithBytesNoCopy:aesEncBuffer length:aesEncBytes];
        NSString *encstr = [encdata base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        NSLog(@"aes encode:%@", encstr);
    } else {
        free(aesEncBuffer);
        NSLog(@"aes encode fail");
    }
    
    // aes decode
    NSString *encstr = @"n7h253QXa88XnUSlSq2g4w==";
    NSData *aesDecData = [[NSData alloc] initWithBase64EncodedString:encstr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSUInteger aesDecDataLen = [aesDecData length];
    
    size_t aesDecBufferLen = aesDecDataLen + kCCBlockSizeAES128;
    void *aesDecBuffer = malloc(aesDecBufferLen);
    
    size_t aesDecBytes;
    CCCryptorStatus decStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [aesDecData bytes], aesDecDataLen, aesDecBuffer, aesDecBufferLen, &aesDecBytes);
    if (decStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytesNoCopy:aesDecBuffer length:aesDecBufferLen];
        NSString *decstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"aes decode:%@", decstr);
    } else {
        free(aesDecBuffer);
        NSLog(@"aes decode fail");
    }
    
    
    
    printf("\n");
    
}
 
-(void) test_base64 {
    NSLog(@"========base64========");
//    test((void *)"", 0, "", 0);
//    test((void *)"f", 1, "Zg==", 4);
//    test((void *)"fo", 2, "Zm8=", 4);
//    test((void *)"foo", 3, "Zm9v", 4);
//    test((void *)"foob", 4, "Zm9vYg==", 8);
//    test((void *)"fooba", 5, "Zm9vYmE=", 8);
//    test((void *)"foobar", 6, "Zm9vYmFy", 8);
    
//    [Base64 test:(void*)"" :0 :"" :0];
    [Base64 test:(void*)"f" :1 :"Zg==" :4];
    
    NSLog(@"========base64========");
}


-(void) test_md5 {
    NSLog(@"========md5========");
    
    
    char buff[] = {"love"};
    size_t len = strlen(buff);
    
    uint8_t result[16];
    [MD5 md5:(const uint8_t*)buff :len :result];
    
    uint8_t hexstr[32];
    byte2Hex(result, 16, hexstr);
    printf("test_md5 -> %s\n", hexstr);
    
    NSLog(@"========md5========");
}

-(void) test_hex2byte {
    NSLog(@"========hex2byte========");
    
    
    NSLog(@"========hex2byte========");
}

@end
