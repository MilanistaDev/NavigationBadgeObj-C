//
//  ViewController.m
//  NavigationBadge
//
//  Created by 麻生 拓弥 on 2016/02/22.
//  Copyright © 2016年 麻生 拓弥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UILabel *badgeLabel;
@property(nonatomic, strong) UIImageView *badgeImageView;
@property(nonatomic) NSInteger countNum;
@end

@implementation ViewController

const NSInteger kMAXNumber = 99;

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NavigationBar name
    self.navigationItem.title = @"Navigation Badge";
    
    // Set Button to NavigationBar
    [self addNavigationBarRightButtonItem];
    self.countNum = kMAXNumber;
}

# pragma mark - Private Method
# pragma mark Navigation
/**
 * Make and Add Button to NavigationBar
 *
 */
- (void)addNavigationBarRightButtonItem {
    
    /**
     * Generating sequence
     * NavigationBar <- rightButton <- badgeImageView <- badgeLabel
     */
    
    // make right button
    UIButton *naviRightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    naviRightButton.frame = CGRectMake(0.0, 0.0, 44.0, 44.0);
    UIImage *naviRightButtonImage = [[UIImage imageNamed:@"NaviIcon"]
                                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [naviRightButton setImage:naviRightButtonImage forState:UIControlStateNormal];
    [naviRightButton addTarget:self action:@selector(tapRightButton)
              forControlEvents:UIControlEventTouchUpInside];
    
    // make foundation view of ImageView
    self.badgeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(28, 0, 20, 20)];
    self.badgeImageView.image = [UIImage imageNamed:@"Badge"];
    self.badgeImageView.hidden = NO;
    
    // make badge label view
    self.badgeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];
  
    // It can achieve using only UILabel.
//    [self.badgeLabel.layer setMasksToBounds:YES];
//    self.badgeLabel.layer.cornerRadius = 9.0f;
//    self.badgeLabel.backgroundColor = [UIColor blueColor];

    self.badgeLabel.backgroundColor = [UIColor clearColor];
    self.badgeLabel.textColor = [UIColor whiteColor];
    self.badgeLabel.font = [UIFont boldSystemFontOfSize:10.0f];
    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeLabel.hidden = NO;
    self.badgeLabel.text = [NSString stringWithFormat:@"%ld", kMAXNumber];
    [self.badgeImageView addSubview:self.badgeLabel];
    [naviRightButton addSubview:self.badgeImageView];

    // Set Button to NavigationBarItem
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]
                                            initWithCustomView:naviRightButton];
    [self.navigationItem setRightBarButtonItem:navigationRightItem];
}

# pragma mark - Action
# pragma mark Button Action
/**
 * Refresh badge
 * For Debug
 *
 */
- (IBAction)revivalbadgeAction:(id)sender {
    
    if (self.badgeImageView.hidden) {
        self.badgeImageView.hidden = NO;
    }
    if (self.badgeLabel.hidden) {
        self.badgeLabel.hidden = NO;
    }
}

/**
 * Badge numner counts down
 *
 */
- (IBAction)countDownAction:(id)sender {
    
    if (self.badgeImageView.hidden) {
        return;
    }
    
    if (self.countNum > 1) {
        self.countNum = self.countNum - 1;
        self.badgeLabel.text = [NSString stringWithFormat:@"%ld", self.countNum];
    } else {
        self.countNum = kMAXNumber;
        self.badgeLabel.text = [NSString stringWithFormat:@"%ld", self.countNum];
        self.badgeImageView.hidden = YES;
        self.badgeLabel.hidden = YES;
    }
}

# pragma mark Tap Action
/**
 * Tap NavigationBar right button
 *
 */
- (void)tapRightButton {
    self.badgeLabel.hidden = YES;
    self.badgeImageView.hidden = YES;
}

# pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
