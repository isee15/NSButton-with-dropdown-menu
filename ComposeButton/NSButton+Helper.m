//
//  NSButton+Helper.m
//  ComposeButton
//
//  Created by isee15 on 15/1/7.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "NSButton+Helper.h"

@implementation NSButton (Helper)
- (void)setColorTitle:(NSString *)title
{
    NSMutableAttributedString *colorTitle = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange titleRange = NSMakeRange(0, [colorTitle length]);
    [colorTitle addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:titleRange];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSCenterTextAlignment;
    [colorTitle addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:titleRange];
    [self setAttributedTitle:colorTitle];
}
@end
