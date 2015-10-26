//
//  TRIPersonPreviewViewController.m
//  triapp
//
//  Created by Harry Jones on 26/10/2015.
//  Copyright © 2015 Harry Jones. All rights reserved.
//

#import "TRIPersonPreviewViewController.h"

@interface TRIPersonPreviewViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation TRIPersonPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"128.jpg"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPerson:(TRIPerson *)person {
    _person = person;
    if (person == nil) {
        self.view.layer.opacity = 0;
        self.imageView.image = nil;
    } else {
        self.view.layer.opacity = 1;
    }
    self.nameLabel.text = person.name;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
