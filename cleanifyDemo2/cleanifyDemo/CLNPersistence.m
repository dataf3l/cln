//
//  CLNPersistence.m
//  cleanifyDemo
//
//  Created by Auditor400 on 6/15/15.
//  Copyright (c) 2015 Cleanify. All rights reserved.
//

#import "CLNPersistence.h"
#import "CLNPurchaseOrder.h"

@implementation CLNPersistence
-(void)initDB {
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _dbPath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:
                                      @"orders.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: _dbPath ] == NO)
    {
        const char *dbpath = [_dbPath UTF8String];
        
        if (sqlite3_open(dbpath, &_database) == SQLITE_OK)
        {
            char *errMsg;
            /*
            const char *sql_stmt1 ="DROP TABLE  IF EXISTS PURCHASE_ORDERS";
            if (sqlite3_exec(_database, sql_stmt1, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to drop table");
            }
             */
            
            const char *sql_stmt ="CREATE TABLE IF NOT EXISTS PURCHASE_ORDERS ( id INTEGER PRIMARY KEY AUTOINCREMENT, customerName TEXT, startTime TEXT, cleanerName TEXT, appointmentDuration TEXT, address TEXT, endTime TEXT, bedrooms TEXT, bathrooms TEXT, windows TEXT, blinds TEXT, wallWash TEXT, oven TEXT, fridge TEXT, appointmentNotes TEXT,lat TEXT, lon TEXT)";
            
            if (sqlite3_exec(_database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table");
            }
            sqlite3_close(_database);
        } else {
            NSLog(@"Failed to open/create database");
        }
    }
}
-(void)deletePurchaseOrders;{

    
    sqlite3_stmt    *statement;
    const char *dbpath = [_dbPath UTF8String];
    printf("Path is: %s",dbpath);
    
    if (sqlite3_open(dbpath, &_database) == SQLITE_OK)
    {
        
        NSString *deleteSQL = @"DELETE FROM PURCHASE_ORDERS ";
        
        
        const char *del_stmt = [deleteSQL UTF8String];
        sqlite3_prepare_v2(_database, del_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Deleted Records.");
        } else {
            
            const char* cmsg = sqlite3_errmsg(_database);
            
            NSString *errorMessage =[NSString stringWithUTF8String:cmsg];
            NSLog(@"Error deleting records from database: %@",errorMessage);
            
        }
        sqlite3_finalize(statement);
        sqlite3_close(_database);
    }

}

- (void) createPurchaseOrder:(CLNPurchaseOrder*)order
{
    sqlite3_stmt    *statement;
    const char *dbpath = [_dbPath UTF8String];
    printf("Path is: %s",dbpath);
    
    if (sqlite3_open(dbpath, &_database) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO PURCHASE_ORDERS (customerName,startTime,cleanerName,appointmentDuration,address,startTime,endTime,bedrooms,bathrooms,windows,blinds,wallWash,oven,fridge,appointmentNotes,lat,lon) VALUES(\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",
                               order.customerName,
                               order.startTime,
                               order.cleanerName,
                               order.appointmentDuration,
                               order.address,
                               order.startTime,
                               order.endTime,
                               order.bedrooms,
                               order.bathrooms,
                               order.windows,
                               order.blinds,
                               order.wallWash,
                               order.oven,
                               order.fridge,
                               order.appointmentNotes,
                               order.lat,
                               order.lon];
        
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_database, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Success");
        } else {
            
            const char* cmsg = sqlite3_errmsg(_database);
            
            NSString *errorMessage =[NSString stringWithUTF8String:cmsg];
            NSLog(@"Error inserting to database: %@",errorMessage);

        }
        sqlite3_finalize(statement);
        sqlite3_close(_database);
    }
}

-(void)populatePurchaseOrders:(NSMutableArray*)purchaseOrders {
    sqlite3_stmt    *statement;
    const char *dbpath = [_dbPath UTF8String];
    printf("%s\n",dbpath);
    if (sqlite3_open(dbpath, &_database) == SQLITE_OK)
    {
        
        NSString *selectSQL = @"SELECT id,customerName,startTime,cleanerName,appointmentDuration,address,startTime,endTime,bedrooms,bathrooms,windows,blinds,wallWash,oven,fridge,appointmentNotes,lat,lon FROM PURCHASE_ORDERS";
        const char *select_stmt = [selectSQL UTF8String];
        sqlite3_prepare_v2(_database, select_stmt, -1, &statement, NULL);
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int c=0;
            CLNPurchaseOrder* p = [[CLNPurchaseOrder alloc] init];
            p.purchaseOrderId = [NSNumber  numberWithInt: sqlite3_column_int(statement, c++)];
            p.customerName = [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.startTime= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.cleanerName= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.appointmentDuration= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.address= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.startTime= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.endTime= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.bedrooms= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.bathrooms= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.windows= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.blinds= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.wallWash= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.oven= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.fridge= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.appointmentNotes= [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.lat = [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            p.lon = [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement,c++)];
            
            [purchaseOrders addObject:p];
            NSLog(@"YEP");
        }
        sqlite3_finalize(statement);
        sqlite3_close(_database);
    }

    
}

-(void)updateRecord:(CLNPurchaseOrder*)purchaseOrder {

    sqlite3_stmt    *statement;
    const char *dbpath = [_dbPath UTF8String];
    printf("Path is: %s",dbpath);
    
    if (sqlite3_open(dbpath, &_database) == SQLITE_OK)
    {
        NSString* notes = purchaseOrder.appointmentNotes;
        NSString* theId = [purchaseOrder.purchaseOrderId  stringValue];
        
        NSString *updateSQL = [NSString stringWithFormat:@"UPDATE PURCHASE_ORDERS SET appointmentNotes = '%@' WHERE id='%@'",notes, theId];
        
        const char *insert_stmt = [updateSQL UTF8String];
        sqlite3_prepare_v2(_database, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Success");
        } else {
            
            const char* cmsg = sqlite3_errmsg(_database);
            
            NSString *errorMessage =[NSString stringWithUTF8String:cmsg];
            NSLog(@"Error inserting to database: %@",errorMessage);
            
        }
        sqlite3_finalize(statement);
        sqlite3_close(_database);
    }
    
}
@end
