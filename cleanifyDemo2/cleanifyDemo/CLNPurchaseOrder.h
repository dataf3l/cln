//
//  CLNPurchaseOrder.h
//  cleanifyDemo
//
//  Created by Auditor400 on 6/15/15.
//  Copyright (c) 2015 Cleanify. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLNPurchaseOrder : NSObject

@property (strong, nonatomic) NSNumber *purchaseOrderId;
@property (strong, nonatomic) NSString *customerName;
@property (strong, nonatomic) NSString *startTime;
@property (strong, nonatomic) NSString *cleanerName;
@property (strong, nonatomic) NSString *appointmentDuration;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *endTime;
@property (strong, nonatomic) NSString *bedrooms;
@property (strong, nonatomic) NSString *bathrooms;
@property (strong, nonatomic) NSString *windows;
@property (strong, nonatomic) NSString *blinds;
@property (strong, nonatomic) NSString *wallWash;
@property (strong, nonatomic) NSString *oven;
@property (strong, nonatomic) NSString *fridge;
@property (strong, nonatomic) NSString *appointmentNotes;
@property (strong, nonatomic) NSString *lat;
@property (strong, nonatomic) NSString *lon;


@end
