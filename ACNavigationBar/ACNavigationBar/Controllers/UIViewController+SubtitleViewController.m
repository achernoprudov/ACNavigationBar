//
//  UIViewController+SubtitleViewController.m
//  ACNavigationBar
//
//  Created by Andrey Chernoprudov on 06/12/16.
//  Copyright © 2016 Little Stars. All rights reserved.
//

#import "UIViewController+SubtitleViewController.h"
#import <objc/runtime.h>

static char UIViewControllerTitleKey;
static char UIViewControllerSubtitleKey;

@implementation UIViewController (Subtitle)
@dynamic title;
@dynamic subtitle;

- (NSString *)title
{
    return objc_getAssociatedObject(self, &UIViewControllerTitleKey);
}

- (void)setTitle:(NSString *)title
{
    [self willChangeValueForKey:@"title"];
    objc_setAssociatedObject(self, &UIViewControllerTitleKey, title, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"title"];
    [self setSubtitle:title];
    self.navigationItem.title = title;
}

- (NSString *)subtitle
{
    return objc_getAssociatedObject(self, &UIViewControllerSubtitleKey);
}

- (void)setSubtitle:(NSString *)subtitle
{
    [self willChangeValueForKey:@"subtitle"];
    objc_setAssociatedObject(self, &UIViewControllerSubtitleKey, subtitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"subtitle"];
    [self setSubtitle:subtitle];
}

@end
