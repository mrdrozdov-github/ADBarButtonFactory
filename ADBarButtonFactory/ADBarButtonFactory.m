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

+ (UIBarButtonItem *)createBarButtonItemWithTitle:(NSString *)t target:(id)tgt action:(SEL)a color:(UIColor*)color bgColor:(UIColor*)bgColor
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGSize size = [t sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0f]}];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ceilf(size.width), ceilf(size.height))];
    label.text = t;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    UIImage *img = [self imageWithView:label];
    
    UILabel *bgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ceilf(size.width), ceilf(size.height))];
    bgLabel.text = t;
    bgLabel.textColor = bgColor;
    bgLabel.backgroundColor = [UIColor clearColor];
    UIImage *bgImg = [self imageWithView:bgLabel];
    
    CGRect buttonFrame = [button frame];
    buttonFrame.size.width = img.size.width;
    buttonFrame.size.height = img.size.height;
    [button setFrame:buttonFrame];
    
    [button setBackgroundImage:img forState:UIControlStateNormal];
    [button setBackgroundImage:bgImg forState:UIControlStateHighlighted];
    
    [button addTarget:tgt action:a forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return buttonItem;
}

@end
