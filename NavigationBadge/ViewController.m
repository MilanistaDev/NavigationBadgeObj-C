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

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NavigationBar name
    self.navigationItem.title = @"Navigation Badge";
    
    // Set Button to NavigationBar
    [self addNavigationBarRightButtonItem];
    self.countNum = 99;
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
     * foundationView <- rightButton < - badgeImageView <- badgeLabel
     */
    
    // make right button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(0.0, 0.0, 45.0, 44.0);
    UIImage *rightButtonImage = [[UIImage imageNamed:@"NaviIcon"]
                                 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rightButton setImage:rightButtonImage forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(tapRightButton) forControlEvents:UIControlEventTouchUpInside];
    
    // make foundation view of ImageView
    self.badgeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(28, 0, 20, 20)];
    self.badgeImageView.image = [UIImage imageNamed:@"Badge"];
    self.badgeImageView.hidden = NO;
    [rightButton addSubview:self.badgeImageView];
    
    // make badge label view
    self.badgeLabel = [[UILabel alloc]initWithFrame:CGRectMake(29, 1, 18, 18)];
    [self.badgeLabel.layer setMasksToBounds:YES];
    //self.badgeLabel.backgroundColor = [UIColor colorWithRed:237/255.0 green:97/255.0 blue:3/255.0 alpha:1.0];
    self.badgeLabel.backgroundColor = [UIColor clearColor];
    self.badgeLabel.textColor = [UIColor whiteColor];
    self.badgeLabel.font = [UIFont boldSystemFontOfSize:10.0f];
    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeLabel.hidden = NO;
    self.badgeLabel.text = @"99";
    [rightButton addSubview:self.badgeLabel];
    
    // make foundation view and addSubView(right button)
    UIView *foundationView = [[UIView alloc] initWithFrame:(CGRect){.size.width = 45.0,.size.height = 44.0}];
    [foundationView addSubview:rightButton];
    UIBarButtonItem *reloadItem = [[UIBarButtonItem alloc] initWithCustomView:foundationView];
    [self.navigationItem setRightBarButtonItem:reloadItem];
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
    
    if (self.countNum > 1) {
        self.countNum = self.countNum - 1;
        self.badgeLabel.text = [NSString stringWithFormat:@"%ld", self.countNum];
    } else {
        self.countNum = 99;
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
