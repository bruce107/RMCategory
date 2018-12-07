//
//  NSString+ramdomTxt.m
//  randomTxt
//
//  Created by BruceSun on 2018/11/9.
//  Copyright © 2018年 BruceSun. All rights reserved.
//

#import "NSString+ramdomTxt.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonRandom.h>

@implementation NSString (ramdomTxt)

//利用CCRandomGenerateBytes实现随机字符串的生成
+ (NSString *)randomString:(NSInteger)length {
    length = length/2;
    unsigned char digest[length];
    CCRNGStatus status = CCRandomGenerateBytes(digest, length);
    NSString *s = nil;
    if (status == kCCSuccess) {
        s = [self stringFrom:digest length:length];
    }
    
//    NSLog(@"randomLength---:%@",s);
    return s;
}
//将bytes转为字符串
+ (NSString *)stringFrom:(unsigned char *)digest length:(NSInteger)leng {
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < leng; i++) {
        [string appendFormat:@"%02x",digest[i]];
    }
//    NSLog(@"final stringFrom:%@",string);
    return string;
}
//---------------------
//作者：iChenfy
//来源：CSDN
//原文：https://blog.csdn.net/u012198553/article/details/78707197
//版权声明：本文为博主原创文章，转载请附上博文链接！

+ (NSString *)hanzi {
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSInteger randomH = 0xA1+arc4random()%(0xFE - 0xA1+1);
    
    NSInteger randomL = 0xB0+arc4random()%(0xF7 - 0xB0+1);
    
    NSInteger number = (randomH<<8)+randomL;
    NSData *data = [NSData dataWithBytes:&number length:2];
    
    NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];
//    NSLog(@"%@",string);
    return string;
}

@end
