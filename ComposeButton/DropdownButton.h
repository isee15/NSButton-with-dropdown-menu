//
//  DropdownButton.h
//  ComposeButton
//
//  Created by isee15 on 15/1/7.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DropdownButton : NSButton

@property NSPopUpButtonCell *popUpCell;
@property(weak) NSView *relativeView;

@end
