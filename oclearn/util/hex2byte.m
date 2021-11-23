//
//  hex2byte.m
//  oclearn
//
//  Created by try on 2021/11/20.
//

#import <Foundation/Foundation.h>

const uint8_t l[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
const uint8_t u[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

int idx(uint8_t c) {
    if (c >= 'a') {
        return c - 'a' + 10;
    } else if (c >= 'A') {
        return c - 'A' + 10;
    } else {
        return c - '0';
    }
}

void byte2hex(const uint8_t* buff, int len, char* out) {
    int i, j;
    i = j = 0;
    
    for (; i < len; i++)
    {
        out[j++] = l[(0xF0 & buff[i]) >> 4];
        out[j++] = l[0x0F & buff[i]];
    }
    out[j] = '\0';
}

void byte2Hex(const uint8_t* buff, int len, char* out) {
    int i, j;
    i = j = 0;
    
    for (; i < len; i++)
    {
        out[j++] = u[(0xF0 & buff[i]) >> 4];
        out[j++] = u[0x0F & buff[i]];
    }
    out[j] = '\0';
}

void hex2byte(const uint8_t* buff, int len, char* out) {
    int i, j;
    i = j = 0;
    
    for (; i < len; i += 2)
    {
        uint8_t c1 = idx(buff[i]);
        uint8_t c2 = idx(buff[i+1]);
        
        out[j++] = (c1 << 4) | c2;
    }
    out[j] = '\0';
}
