//
//  ViewController.m
//  ADBarButtonFactory
//
//  Created by Andrew Drozdov on 11/12/14.
//  Copyright (c) 2014 Andrew Drozdov. All rights reserved.
//

#import "TableViewController.h"
#import "ADBarButtonFactory.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIBarButtonItem *left = [ADBarButtonFactory createBarButtonItemWithTitle:@"Wu" font:[UIFont fontWithName:@"Helvetica" size:13.f] target:nil action:nil color:[UIColor blackColor] bgColor:[UIColor blueColor]];
    UIBarButtonItem *right = [ADBarButtonFactory createBarButtonItemWithTitle:@"Tang" font:[UIFont fontWithName:@"Helvetica" size:13.f] target:nil action:nil color:[UIColor purpleColor] bgColor:[UIColor yellowColor]];
    
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.rightBarButtonItem = right;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
