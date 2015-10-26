//
//  ViewController.m
//  triapp
//
//  Created by Harry Jones on 26/10/2015.
//  Copyright © 2015 Harry Jones. All rights reserved.
//

#import "ViewController.h"
#import "TRIPersonPreviewViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", self.containerView);
    self.containerView.layer.cornerRadius = 5;
    self.containerView.layer.masksToBounds = YES;
    
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentPersonDetail)];
    singleTap.numberOfTapsRequired = 1;
    [self.containerView addGestureRecognizer:singleTap];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)presentPersonDetail {
    [self performSegueWithIdentifier:@"showPerson" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedPicture"]) {
        TRIPersonPreviewViewController *destVC = (TRIPersonPreviewViewController*)segue.destinationViewController;
        destVC.profilePicture = [UIImage imageNamed:@"128.jpg"];
        destVC.name = @"John Doe";
    }
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
