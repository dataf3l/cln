//
//  CLNTableViewController.m
//  cleanifyDemo
//
//  Created by Auditor400 on 6/15/15.
//  Copyright (c) 2015 Cleanify. All rights reserved.
//

#import "CLNTableViewController.h"
#import "CLNTableViewCell.h"
#import "CLNDetailViewController.h"
#import "CLNJsonClient.h"
#import "CLNPersistence.h"
#import <GoogleMaps/GoogleMaps.h>

@interface CLNTableViewController ()

@end

@implementation CLNTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    //CLNPurchaseOrder* p1 = [[CLNPurchaseOrder alloc] init];
    //CLNPurchaseOrder* p2 = [[CLNPurchaseOrder alloc] init];
    //CLNPurchaseOrder* p3 = [[CLNPurchaseOrder alloc] init];
    
    //p1.customerName = @"Customer1";
    //p2.customerName = @"Customer2";
    //p3.customerName = @"Customer3";
    //  _purchaseOrders = [[NSArray alloc] initWithObjects:p1,p2,p3, nil];
    
    _purchaseOrders = [[NSMutableArray alloc] init];
    CLNPersistence* cp = [[CLNPersistence alloc] init];
    CLNJsonClient* client = [[CLNJsonClient alloc] init];
    
    [cp initDB];
    
    // get data from the server
    [client getDataFromServer];
    //populate the data on the array
    [cp populatePurchaseOrders:_purchaseOrders];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_purchaseOrders count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CLNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CLNTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    long row = [indexPath row];
    cell.nameLabel.text = ((CLNPurchaseOrder*)_purchaseOrders[row]).customerName;
    cell.descriptionLabel.text = ((CLNPurchaseOrder*)_purchaseOrders[row]).startTime;
    
    return cell;
}

/** 
 send correct purchase order object to detail view.
 */
-(void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender{
    if([[segue identifier] isEqualToString:@"ShowDetails"]){
        CLNDetailViewController* detailViewController = [segue destinationViewController];
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        long row = [indexPath row];
        detailViewController.purchaseOrder = (CLNPurchaseOrder*)_purchaseOrders[row];
        
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
