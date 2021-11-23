//
//  md5.h
//  oclearn
//
//  Created by try on 2021/11/19.
//

/*
 * md5输出为字符数组，但是标准md5位十六进制表示，所以需要进行一个转换
 */

#ifndef md5_h
#define md5_h
@interface MD5 : NSObject
+(void) md5:(const uint8_t *)origin :(size_t)origin_len :(uint8_t *)digest;


+(void) byte2hex:(unsigned char*)buff :(unsigned int)len :(uint8_t *)out;
@end

#endif /* md5_h */
