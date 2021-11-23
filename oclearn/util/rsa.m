//
//  rsa.m
//  oclearn
//
//  Created by try on 2021/11/21.
//

#import <Foundation/Foundation.h>
#import "rsa.h"

@implementation RSA : NSObject

+(SecKeyRef) publicKey:(NSString *)filepath {
    NSString *path = [[NSBundle mainBundle] pathForResource:filepath ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    if (!data) {
        return nil;
    }
    
    SecCertificateRef cert = SecCertificateCreateWithData(NULL, (CFDataRef)data);
    
    SecKeyRef key = NULL;
    SecTrustRef trust = NULL;
    SecPolicyRef policy = NULL;
    
    if (cert != NULL) {
        policy = SecPolicyCreateBasicX509();
        if (policy) {
            if (SecTrustCreateWithCertificates((CFTypeRef)cert, policy, &trust) == noErr) {
                SecTrustResultType result;
                if (SecTrustEvaluate(trust, &result) == noErr) {
                    key = SecTrustCopyPublicKey(trust);
                }
            }
        }
    }
    
    if (policy) CFRelease(policy);
    if (trust) CFRelease(trust);
    if (cert) CFRelease(cert);
    return key;
}

+(SecKeyRef) privateKey:(NSString *)filepath :(NSString *)pwd {
    NSString *path = [[NSBundle mainBundle] pathForResource:filepath ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    SecKeyRef private = NULL;
    
    NSMutableDictionary *options = [[NSMutableDictionary alloc] init];
    [options setObject:pwd forKey:(__bridge id)kSecImportExportPassphrase];
    
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    OSStatus error = SecPKCS12Import((__bridge  CFDataRef)data, (__bridge CFDictionaryRef)options, &items);
    if (error == noErr && CFArrayGetCount(items) > 0) {
        CFDictionaryRef identity = CFArrayGetValueAtIndex(items, 0);
        SecIdentityRef app = (SecIdentityRef)CFDictionaryGetValue(identity, kSecImportItemIdentity);
        error = SecIdentityCopyPrivateKey(app, &private);
        if (error != noErr) {
            private = NULL;
        }
    }
    
    return private;
}

+(NSString *)encrypt:(NSString *)origin {
    SecKeyRef public = [self publicKey:@""];
    
    size_t size = SecKeyGetBlockSize(public);
    uint8_t *buffer = malloc(size);
    uint8_t *nonce = (uint8_t *)[origin UTF8String];
    
    SecKeyEncrypt(public, kSecPaddingPKCS1, nonce, strlen((char*)nonce), &buffer[0], size);
    
    NSData *encrypt = [NSData dataWithBytes:buffer length:size];
    free(buffer);
    
    return [encrypt base64EncodedDataWithOptions:0];
}

+(NSString *)decrypt:(NSString *)ciphertext {
    
    return nil;
}

@end
