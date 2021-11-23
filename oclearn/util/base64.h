//
//  base64.h
//  oclearn
//
//  Created by try on 2021/11/18.
//

#ifndef base64_h
#define base64_h

#define BASE64_ENCODE_OUT_SIZE(s) ((unsigned int)((((s) + 2) / 3) * 4 + 1))
#define BASE64_DECODE_OUT_SIZE(s) ((unsigned int)(((s) / 4) * 3))

@interface Base64 : NSObject

+(unsigned int) base64encode:(const unsigned char*)in :(unsigned int) inlen :(char *)out;
+(unsigned int) base64decode:(const char*)in :(unsigned int)inlen :(unsigned char*)out;

+(void) test:(unsigned char *)encode :(unsigned int) encodeLen :(char *)decode :(unsigned int)decodeLen;

@end


#endif /* base64_h */
