//
//  rsa.h
//  oclearn
//
//  Created by try on 2021/11/21.
//

#ifndef rsa_h
#define rsa_h

@interface RSA : NSObject

+(NSString *)encrypt:(NSString *)origin;
+(NSString *)decrypt:(NSString *)ciphertext;

@end



#endif /* rsa_h */
