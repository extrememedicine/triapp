//
//  ViewController.m
//  triapp
//
//  Created by Harry Jones on 26/10/2015.
//  Copyright © 2015 Harry Jones. All rights reserved.
//

#import "ViewController.h"
#import "TRIPersonPreviewViewController.h"
#import "TRIPersonDetailViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *containerViewB;

@property (nonatomic) NSMutableArray *containerVCs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSArray *containers = @[self.containerView, self.containerViewB];
    
    for (UIView* containerView in containers) {
        containerView.layer.cornerRadius = 5;
        containerView.layer.masksToBounds = YES;
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentPersonDetail:)];
        singleTap.numberOfTapsRequired = 1;
        [containerView addGestureRecognizer:singleTap];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)presentPersonDetail: (UIGestureRecognizer*)gesture {
    __block TRIPersonPreviewViewController *destVC = nil;
    [self.containerVCs enumerateObjectsUsingBlock:^(TRIPersonPreviewViewController *obj, NSUInteger idx, BOOL *stop) {
        if (obj.view == gesture.view) {
            *stop = YES;
            destVC = obj;
        }
    }];

    destVC = _containerVCs[0];
    
    [self performSegueWithIdentifier:@"showPerson" sender:destVC.person];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (self.containerVCs == nil) {
        self.containerVCs = [NSMutableArray array];
    }
    if ([segue.identifier isEqualToString:@"embedPicture"]) {
        TRIPersonPreviewViewController *destVC = (TRIPersonPreviewViewController*)segue.destinationViewController;
        [self.containerVCs addObject:destVC];
        TRIPerson *person = [TRIPerson object];
        person.name = @"dat Harry Doe";
        person.sex = @"Male";
        person.height = @"184cm";
        person.weight = @"65kg";
        person.reportedConditions = @"None";
        person.pastConditions = @"Diarrhoea";
        destVC.person = person;
    } else if ([segue.identifier isEqualToString:@"showPerson"]) {
        TRIPersonDetailViewController *destVC = (TRIPersonDetailViewController*)segue.destinationViewController;
        destVC.person = sender;
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
