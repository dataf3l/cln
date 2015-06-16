//
//  CLNJsonClient.h
//  cleanifyDemo
//
//  Created by Auditor400 on 6/15/15.
//  Copyright (c) 2015 Cleanify. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CLNJsonClientDelegate;
@interface CLNJsonClient : NSObject
 @property (weak, nonatomic) id<CLNJsonClientDelegate> delegate;

-(void)getDataFromServer;
-(void)errorCallback:(NSError*)error;
-(void)successCallback:(NSData*)data;

@end
