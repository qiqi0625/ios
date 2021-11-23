//
//  hex2byte.h
//  oclearn
//
//  Created by try on 2021/11/20.
//

/*
 字符数组([]byte) 与 十六进制数(hex)的互相转换
 原理：
 一个byte由8位二进制数组成，4位二进制数表示1个十六进制数的字符 => 一byte 表示 二16进制字符
 * 获取byte低四位: byte & 0xOF
 * 获取byte高四位: byte & 0xF0 >> 4
 */

#ifndef hex2byte_h
#define hex2byte_h


void byte2hex(const uint8_t* buff, int len, char* out);

void byte2Hex(const uint8_t* buff, int len, char* out);

void hex2byte(const uint8_t* buff, int len, char* out);

#endif /* hex2byte_h */
