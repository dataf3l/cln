//
//  CLNTableViewCell.h
//  cleanifyDemo
//
//  Created by Auditor400 on 6/15/15.
//  Copyright (c) 2015 Cleanify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLNTableViewCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UILabel* nameLabel;
@property (strong,nonatomic) IBOutlet UILabel* descriptionLabel;

@end
