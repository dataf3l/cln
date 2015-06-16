//
//  CLNPersistence.h
//  cleanifyDemo
//
//  Created by Auditor400 on 6/15/15.
//  Copyright (c) 2015 Cleanify. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "CLNPurchaseOrder.h"
@interface CLNPersistence : NSObject
@property(strong,nonatomic) NSString* dbPath;
@property(nonatomic) sqlite3* database;
-(void)initDB;
-(void)createPurchaseOrder:(CLNPurchaseOrder*)order;
-(void)deletePurchaseOrders;
-(void)populatePurchaseOrders:(NSMutableArray*)purchaseOrders;
-(void)updateRecord:(CLNPurchaseOrder*)purchaseOrder ;
@end
