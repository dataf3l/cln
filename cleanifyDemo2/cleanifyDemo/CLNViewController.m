//
//  CLNViewController.m
//  cleanifyDemo
//
//  Created by Auditor400 on 6/15/15.
//  Copyright (c) 2015 Cleanify. All rights reserved.
//

#import "CLNViewController.h"
#import "CLNJsonClient.h"
#import "CLNPurchaseOrder.h"
#import "CLNPersistence.h"

@interface CLNViewController ()

@end

@implementation CLNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@"app started");
    
    CLNJsonClient* cn = [[CLNJsonClient alloc] init];
    CLNPersistence* per = [[CLNPersistence alloc] init];
    CLNPurchaseOrder* po = [[CLNPurchaseOrder alloc] init];
    po.address = @"something";
    
    [cn getDataFromServer];
    [per initDB];
    [per createPurchaseOrder:po];
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
