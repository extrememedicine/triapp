//
//  TRIPersonDetailViewController.m
//  triapp
//
//  Created by Harry Jones on 26/10/2015.
//  Copyright © 2015 Harry Jones. All rights reserved.
//

#import "TRIPersonDetailViewController.h"
#import "TRIPerson.h"

@interface TRIPersonDetailViewController ()

@property (nonatomic) NSArray *cellLayout;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation TRIPersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView dequeueReusableCellWithIdentifier:@"simpleHeaded"];
    
    _cellLayout = @[
                    @{@"header":@"Date of birth",  @"text":@"5/7/1987 (age 28)"},
                    @{@"header":@"Sex",  @"text":self.person.sex},
                    @{@"header":@"Height",  @"text":self.person.height},
                    @{@"header":@"Weight", @"text":self.person.weight},
                    @{@"header":@"Reported conditions", @"text":self.person.reportedConditions},
                    @{@"header":@"Past conditions", @"text":self.person.pastConditions},
                    ];
    self.nameLabel.text = self.person.name;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    UIBarButtonItem *bleButton = [[UIBarButtonItem alloc] initWithTitle:@"." style:UIBarButtonItemStylePlain target:self action:@selector(bleFake)];
    self.navigationItem.rightBarButtonItem = bleButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bleFake {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Welcome to XXX medical centre"
                                  message:@"Lorem ipsum dolor sit amit"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];

    NSLog(@"ble");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellLayout.count + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.cellLayout.count) {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleHeaded" forIndexPath:indexPath];
    
    
    UILabel *headerLabel = (UILabel*)[cell viewWithTag:1];
    UILabel *descriptionLabel = (UILabel*)[cell viewWithTag:2];
    
    
    headerLabel.text = (NSString*)[[self.cellLayout objectAtIndex:indexPath.row] objectForKey:@"header"];
    descriptionLabel.text = (NSString*)[[self.cellLayout objectAtIndex:indexPath.row] objectForKey:@"text"];
    // Configure the cell...
    
    return cell;
    } else {
        UITableViewCell *cell;
        NSUInteger diff = indexPath.row - self.cellLayout.count;
        switch (diff) {
            case 0:
                cell = [tableView dequeueReusableCellWithIdentifier:@"LongHeadedAttributed" forIndexPath:indexPath];
                break;
            case 1:
                cell = [tableView dequeueReusableCellWithIdentifier:@"Location" forIndexPath:indexPath];
                break;
        }
        
        return cell;
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.cellLayout.count) return 60;
    return 140;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
