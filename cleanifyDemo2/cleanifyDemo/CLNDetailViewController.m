//
//  CLNDetailViewController.m
//  cleanifyDemo
//
//  Copyright © 2015 Cleanify. All rights reserved.
//

#import "CLNDetailViewController.h"
#import "CLNPersistence.h"
#import "CLNMapViewController.h"

@interface CLNDetailViewController ()

@end

@implementation CLNDetailViewController
- (IBAction)notesUpdated:(UITextField*)notesTextField {
    NSLog(@"HI");
    CLNPersistence *p = [[CLNPersistence alloc] init];
    [p initDB];
    
    _purchaseOrder.appointmentNotes = [notesTextField text];
    [p updateRecord: _purchaseOrder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* labels = @[@"NO",@"YES",];
    
    
    
    _customerNameLabel.text = _purchaseOrder.customerName;
    _startTimeLabel.text = _purchaseOrder.startTime;
    _cleanerNameLabel.text = _purchaseOrder.cleanerName;
    _appointmentDurationLabel.text = _purchaseOrder.appointmentDuration;
    _addressLabel.text = _purchaseOrder.address;
    _endTimeLabel.text = _purchaseOrder.endTime;
    
    _bedroomsLabel.text = _purchaseOrder.bedrooms;
    _bathroomsLabel.text = _purchaseOrder.bathrooms;
    _windowsLabel.text = labels[[_purchaseOrder.windows intValue]];
    _blindsLabel.text = labels[[_purchaseOrder.blinds intValue]];
    _wallWashLabel.text = labels[[_purchaseOrder.wallWash intValue]];
    _ovenLabel.text = labels[[_purchaseOrder.oven intValue]];
    _fridgeLabel.text = labels[[_purchaseOrder.fridge intValue]];
    
    _appointmentNotesTextField.text =_purchaseOrder.appointmentNotes;

    self.navigationItem.title = _purchaseOrder.customerName;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/**
 send correct purchase order object to detail view.
 */
-(void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender{
    if([[segue identifier] isEqualToString:@"ShowMap"]){
        CLNMapViewController* mapViewController = [segue destinationViewController];

        mapViewController.purchaseOrder = [self purchaseOrder];
        
    }
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
