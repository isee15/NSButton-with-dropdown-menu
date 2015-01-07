//
//  DropdownButton.m
//  ComposeButton
//
//  Created by isee15 on 15/1/7.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "DropdownButton.h"


@implementation DropdownButton

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];

    // Drawing code here.
}

- (void)viewWillMoveToWindow:(NSWindow *)newWindow
{
    if ([self menu] != nil) {
        if (self.popUpCell == nil) {
            self.popUpCell = [[NSPopUpButtonCell alloc] initTextCell:@""];
            [self.popUpCell setPullsDown:YES];
            [self.popUpCell setPreferredEdge:NSMaxYEdge];
        }

    }
}


- (void)runPopUp:(NSEvent *)theEvent
{
    // create the menu the popup will use
    NSMenu *popUpMenu = [self menu];
    if (popUpMenu.numberOfItems > 0 && [popUpMenu itemAtIndex:0].title.length != 0) {
        [popUpMenu insertItemWithTitle:@"" action:NULL keyEquivalent:@"" atIndex:0];
    }// blank item at top
    [self.popUpCell setMenu:popUpMenu];

    if (self.relativeView != nil) {
        [self.popUpCell performClickWithFrame:[self.relativeView bounds] inView:self.relativeView];
    }
    else {
        // and show it
        [self.popUpCell performClickWithFrame:[self bounds] inView:self];
    }


    [self setNeedsDisplay:YES];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    if (self.popUpCell != nil && self.isEnabled) {
        [self runPopUp:theEvent];
    }
    else {
        [super mouseDown:theEvent];
    }
}


@end
