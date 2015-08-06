//
//  ViewController.h
//  AutoLayout
//
//  Created by Ravi Prakash on 04/08/15.
//  Copyright (c) 2015 Ravi Prakash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UITableView *tableView;


@end

