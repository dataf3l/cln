//
//  CLNJsonClient.m
//  cleanifyDemo
//
//  Created by Auditor400 on 6/15/15.
//  Copyright (c) 2015 Cleanify. All rights reserved.
//

#import "CLNJsonClient.h"
#import "CLNJsonClientDelegate.h"
#import "CLNPurchaseOrder.h"
#import "CLNPersistence.h"
@implementation CLNJsonClient
-(void)getDataFromServer {
    NSString *serviceUrl = @"https://raw.githubusercontent.com/dataf3l/cln/gh-pages/README.md";
    NSURL *url = [[NSURL alloc] initWithString:serviceUrl];
    NSLog(@"%@", serviceUrl);
    NSURLRequest* req = [[NSURLRequest alloc] initWithURL:url] ;
    [NSURLConnection sendAsynchronousRequest: req queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            NSLog(@"error :( : %@", [error localizedDescription]);
            
            [self.delegate errorCallback:error];
        } else {
            
            CLNPersistence* p = [[CLNPersistence alloc] init];
            [p initDB];
            [p deletePurchaseOrders];
            
            NSError *e = nil;
            NSArray *jd = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
            for(int i=0;i<[jd count];i++){
                
                NSLog(@"%@",[[jd objectAtIndex:i] objectForKey:@"customerName"]);
                
                CLNPurchaseOrder *record = [[CLNPurchaseOrder alloc] init];
                record.customerName = [[jd objectAtIndex:i] objectForKey:@"customerName"];
                record.startTime = [[jd objectAtIndex:i] objectForKey:@"startTime"];
                record.cleanerName = [[jd objectAtIndex:i] objectForKey:@"cleanerName"];
                record.appointmentDuration = [[jd objectAtIndex:i] objectForKey:@"appointmentDuration"];
                record.address = [[jd objectAtIndex:i] objectForKey:@"address"];
                record.endTime = [[jd objectAtIndex:i] objectForKey:@"endTime"];
                record.bedrooms = [[jd objectAtIndex:i] objectForKey:@"bedrooms"];
                record.bathrooms = [[jd objectAtIndex:i] objectForKey:@"bathrooms"];
                record.windows = [[jd objectAtIndex:i] objectForKey:@"windows"];
                record.blinds = [[jd objectAtIndex:i] objectForKey:@"blinds"];
                record.wallWash = [[jd objectAtIndex:i] objectForKey:@"wallWash"];
                record.oven = [[jd objectAtIndex:i] objectForKey:@"oven"];
                record.fridge = [[jd objectAtIndex:i] objectForKey:@"fridge"];
                record.appointmentNotes = [[jd objectAtIndex:i] objectForKey:@"appointmentNotes"];
                record.lat  = [[jd objectAtIndex:i] objectForKey:@"lat"];
                record.lon = [[jd objectAtIndex:i] objectForKey:@"lon"];
                
                [p createPurchaseOrder:record];
            }

            
            
            
            
           // NSLog(@"ok :)");
           // [self.delegate successCallback:data];
        }
    }];
    
}


-(void)errorCallback:(NSError*)error {
    NSLog(@"error on json data :(");
    
}
-(void)successCallback:(NSData*)data{
  //do nil
}

@end
