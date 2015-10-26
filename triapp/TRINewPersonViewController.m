//
//  TRINewPersonViewController.m
//  triapp
//
//  Created by Harry Jones on 26/10/2015.
//  Copyright © 2015 Harry Jones. All rights reserved.
//

#import "TRINewPersonViewController.h"
#import "XLForm.h"
#import "TRIPerson.h"

@interface TRINewPersonViewController ()

@end

@implementation TRINewPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Add Event"];
    
    // First section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"name" rowType:XLFormRowDescriptorTypeText title:@"Name"];
    [row.cellConfigAtConfigure setObject:@"John Doe" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    // Date of birth
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"dob" rowType:XLFormRowDescriptorTypeDateInline title:@"Date of birth"];
    row.value = [NSDate dateWithTimeIntervalSinceNow:-60*60*24*365*28*1.1];
    [section addFormRow:row];
    
    // Second Section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // sex
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"sex" rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"Sex"];
    row.selectorOptions = @[@"Male", @"Female"];
    [section addFormRow:row];
    
    // weight
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"weight-number" rowType:XLFormRowDescriptorTypeInteger title:@"Weight (kg)"];
    [section addFormRow:row];
    
    //height
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"height-number" rowType:XLFormRowDescriptorTypeInteger title:@"Height (cm)"];
    [section addFormRow:row];
    
    // Third Section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // Reported conditions
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"reportedConditions" rowType:XLFormRowDescriptorTypeText title:@"Current conditions"];
    [row.cellConfigAtConfigure setObject:@"None" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    // Past conditions
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pastConditions" rowType:XLFormRowDescriptorTypeText title:@"Past conditions"];
    [row.cellConfigAtConfigure setObject:@"Diarrhoea" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
//    // All-day
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"all-day" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"All-day"];
//    [section addFormRow:row];
//    
//    // Starts
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"starts" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Starts"];
//    row.value = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
//    [section addFormRow:row];
    
    self.form = form;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(createNewPerson)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    // Do any additional setup after loading the view.
}

- (void)createNewPerson {
    NSDictionary *formValues = [self.form formValues];
    TRIPerson *person = [TRIPerson object];
    person.name = formValues[@"name"];
    person.dob = formValues[@"dob"];
    person.sex = formValues[@"sex"];
    person.weight = [NSString stringWithFormat:@"%@kg", formValues[@"weight-number"]];
    person.height = [NSString stringWithFormat:@"%@cm", formValues[@"height-number"]];
    person.reportedConditions = formValues[@"reportedConditions"];
    person.pastConditions = formValues[@"pastConditions"];
    person.recentLog = @"bantaaa";
    person.lastLocation = nil;
    [person saveInBackground];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
