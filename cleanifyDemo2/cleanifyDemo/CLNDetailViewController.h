//
//  CLNDetailViewController.h
//  cleanifyDemo
//
//  Copyright © 2015 Cleanify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLNPurchaseOrder.h"
@interface CLNDetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *customerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *cleanerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *appointmentDurationLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *bedroomsLabel;
@property (strong, nonatomic) IBOutlet UILabel *bathroomsLabel;
@property (strong, nonatomic) IBOutlet UILabel *windowsLabel;
@property (strong, nonatomic) IBOutlet UILabel *blindsLabel;
@property (strong, nonatomic) IBOutlet UILabel *wallWashLabel;
@property (strong, nonatomic) IBOutlet UILabel *ovenLabel;
@property (strong, nonatomic) IBOutlet UILabel *fridgeLabel;
@property (strong, nonatomic) IBOutlet UITextField *appointmentNotesTextField;

@property(strong,nonatomic) CLNPurchaseOrder* purchaseOrder;
@end
