//
//  ADBarButtonItemFactory.m
//  ADBarButtonFactory
//
//  Created by Andrew Drozdov on 11/12/14.
//  Copyright (c) 2014 Andrew Drozdov. All rights reserved.
//

#import "ADBarButtonFactory.h"

@implementation ADBarButtonFactory

+ (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIButton*)createButtonWithTitle:(NSString *)t font:(UIFont*)font target:(id)tgt action:(SEL)a color:(UIColor*)color bgColor:(UIColor*)bgColor
{
    UIButton *button = [[UIButton alloc] init];
    
    CGSize size = [t sizeWithAttributes:@{NSFontAttributeName:font}];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ceilf(size.width), ceilf(size.height))];
    label.text = t;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.font = font;
    UIImage *img = [self imageWithView:label];
    
    UILabel *bgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ceilf(size.width), ceilf(size.height))];
    bgLabel.text = t;
    bgLabel.textColor = bgColor;
    bgLabel.backgroundColor = [UIColor clearColor];
    bgLabel.font = font;
    UIImage *bgImg = [self imageWithView:bgLabel];
    
    CGRect buttonFrame = [button frame];
    buttonFrame.size.width = img.size.width;
    buttonFrame.size.height = img.size.height;
    [button setFrame:buttonFrame];
    
    [button setBackgroundImage:img forState:UIControlStateNormal];
    [button setBackgroundImage:bgImg forState:UIControlStateHighlighted];
    
    [button addTarget:tgt action:a forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIBarButtonItem *)createBarButtonItemWithTitle:(NSString *)t font:(UIFont*)font target:(id)tgt action:(SEL)a color:(UIColor*)color bgColor:(UIColor*)bgColor
{
    UIButton *button = [self createButtonWithTitle:t font:font target:tgt action:a color:color bgColor:bgColor];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return buttonItem;
}

@end
