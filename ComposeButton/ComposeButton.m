//
//  ComposeButton.m
//  ComposeButton
//
//  Created by isee15 on 15/1/7.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "ComposeButton.h"
#import "DropdownButton.h"
#import "NSButton+Helper.h"

@interface ComposeButton ()
@property DropdownButton *buttonRight;
@property NSMenu *menu;
@property(nonatomic, copy) void (^dropdownBlock)(id sender, int index);
@end

@implementation ComposeButton

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];

    // Drawing code here.
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
    if (self = [super initWithFrame:frameRect]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.menu = [[NSMenu alloc] initWithTitle:@""];
    self.bezelStyle = NSShadowlessSquareBezelStyle;
    [self.cell setButtonType:NSMomentaryLightButton];
    self.bordered = NO;
    self.image = [NSImage imageNamed:@"button"];
    self.alternateImage = [NSImage imageNamed:@"buttondown"];

    self.buttonRight = [[DropdownButton alloc] init];
    self.buttonRight.bezelStyle = NSShadowlessSquareBezelStyle;
    self.buttonRight.bordered = NO;
    self.buttonRight.image = [NSImage imageNamed:@"right"];
    self.buttonRight.alternateImage = [NSImage imageNamed:@"rightdown"];
    [self.buttonRight.cell setImageScaling:NSImageScaleAxesIndependently];
    [self.buttonRight.cell setButtonType:NSMomentaryLightButton];
    self.buttonRight.menu = self.menu;
    self.buttonRight.relativeView = self;
    //[self.buttonRight setColorTitle:@"\u25BE"];
    [self setColorTitle:@"同意"];
    [self addSubview:self.buttonRight];
    [self sizeToFit];
    NSRect rect = self.frame;
    [self.buttonRight setFrame:NSMakeRect(rect.size.width - 19, 0, 19, rect.size.height-1)];


}

- (void)setupMenu:(NSArray *)menus andBlock:(void (^)(id sender, int index))dropdownButtonBlock
{
    [self.menu removeAllItems];
    if (menus.count > 0) [self setColorTitle:menus[0]];
    for (int i = 0; i < menus.count; i++) {
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:menus[i] action:@selector(onMenuClick:) keyEquivalent:@""];
        item.tag = i;
        item.target = self;
        [self.menu addItem:item];
    }
    self.dropdownBlock = dropdownButtonBlock;
}

- (void)onMenuClick:(id)sender
{
    if (!self.enabled) return;
    NSMenuItem *item = sender;
    if (self.dropdownBlock != nil) {
        self.dropdownBlock(self, (int) item.tag);
    }
}


@end
