//
//  ViewController.m
//  AutoLayout
//
//  Created by Ravi Prakash on 04/08/15.
//  Copyright (c) 2015 Ravi Prakash. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) loadView {
    [super loadView];
    self.button1 = [[UIButton alloc] init];
    [self.button1 setTitle:@"button1" forState:UIControlStateNormal];
    [self.button1 setBackgroundColor:[UIColor lightGrayColor]];
    [self.button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    self.button2 = [[UIButton alloc] init];
    [self.button2 setTitle:@"button2" forState:UIControlStateNormal];
    [self.button2 setBackgroundColor:[UIColor lightGrayColor]];
    [self.button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.tableView = [[UITableView alloc] init];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *metrics = @{@"width" : @70,
                              @"height" : @30,
                              @"leftSpacing" : @30,
                              @"rightSpacing" : @30,
                              @"verticalSpacing" : @30,
                              @"bottomSpacing" : @30
                              };
    
    NSDictionary *views = @{@"button1":self.button1,
                           @"button2":self.button2,
                            @"tableView":self.tableView};
    NSArray *constraint_button1_width = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[button1(width)]"
                                                                          options:0
                                                                          metrics:metrics
                                                                            views:views];

    NSArray *constraint_button1_height = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button1(height)]"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views];
    
    [self.button1 addConstraints:constraint_button1_height];
    [self.button1 addConstraints:constraint_button1_width];
    
    NSArray *constraint_button2_width = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[button2(width)]"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:views];
    
    NSArray *constraint_button2_height = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[button2(height)]"
                                                                                 options:0
                                                                                 metrics:metrics
                                                                                   views:views];
    [self.button2 addConstraints:constraint_button2_width];
    [self.button2 addConstraints:constraint_button2_height];
    
    
    NSArray *constraint_POS_button1_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftSpacing-[button1]"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:views];
    
    NSArray *constraint_POS_button1_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalSpacing-[button1]"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:views];
    
    NSArray *constraint_POS_button2_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[button2]-rightSpacing-|"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:views];
    
    NSArray *constraint_POS_button2_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalSpacing-[button2]"
                                                                             options:0
                                                                             metrics:metrics
                                                                               views:views];
    
    NSArray *constraint_POS_tableView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftSpacing-[tableView]-rightSpacing-|"
                                                                                options:0
                                                                                metrics:metrics
                                                                                  views:views];
    
    NSArray *constraint_POS_tableView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[tableView]-bottomSpacing-|"
                                                                                  options:0
                                                                                  metrics:metrics
                                                                                    views:views];
    
    [self.view addConstraints:constraint_POS_tableView_H];
    [self.view addConstraints:constraint_POS_tableView_V];
    
    [self.view addConstraints:constraint_POS_button1_H];
    [self.view addConstraints:constraint_POS_button1_V];

    [self.view addConstraints:constraint_POS_button2_H];
    [self.view addConstraints:constraint_POS_button2_V];
}

#pragma mark tableView Delegate

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    UILabel *lable = [[UILabel alloc] init];
    [lable setTranslatesAutoresizingMaskIntoConstraints:NO];
    lable.text = [NSString stringWithFormat:@"Cell Number %ld",indexPath.row];
    [cell addSubview:lable];
    
    NSDictionary *views = @{@"lable":lable};
    [cell addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[lable]-10-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    [cell addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[lable]-5-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
