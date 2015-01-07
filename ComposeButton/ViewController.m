//
//  ViewController.m
//  ComposeButton
//
//  Created by isee15 on 15/1/7.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self.buttonOK setupMenu:@[@"OK", @"Cacel", @"Ignore"] andBlock:^(id sender, int index) {
        NSLog(@"click menu at %d", index);
    }];
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
