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

- (void)loadPeople {
    PFQuery *query = [PFQuery queryWithClassName:@"TRIPerson"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        NSUInteger i = 0;
        for (TRIPerson *person in objects) {
            if (i >= self.containerVCs.count) break;
            [(TRIPersonPreviewViewController*)self.containerVCs[i] setPerson:person];
            i++;
        }
        for (; i < self.containerVCs.count; i++) {
            [(TRIPersonPreviewViewController*)self.containerVCs[i] setPerson:nil];
        }
    }];
}

- (void)presentPersonDetail: (UIGestureRecognizer*)gesture {
    NSUInteger index = [@[self.containerView, self.containerViewB] indexOfObject:gesture.view];
    

    TRIPersonPreviewViewController *sourceVC = _containerVCs[index];
    
    [self performSegueWithIdentifier:@"showPerson" sender:sourceVC.person];
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
    } else if ([segue.identifier isEqualToString:@"showPerson"]) {
        TRIPersonDetailViewController *destVC = (TRIPersonDetailViewController*)segue.destinationViewController;
        destVC.person = sender;
    }
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadPeople];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
