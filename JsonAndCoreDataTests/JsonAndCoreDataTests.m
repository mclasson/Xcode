//
//  JsonAndCoreDataTests.m
//  JsonAndCoreDataTests
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import "JsonAndCoreDataTests.h"
#import "TwitterHelper.h"
@implementation JsonAndCoreDataTests
NSManagedObjectModel * managedObjectModel;
NSPersistentStoreCoordinator * coordinator;
NSPersistentStore *store;
NSManagedObjectContext *context; 

- (void)setUp
{
    [super setUp];
    
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:[NSBundle allBundles]];
    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    store = [coordinator addPersistentStoreWithType: NSInMemoryStoreType
                                       configuration: nil
                                                 URL: nil
                                             options: nil
                                               error: NULL];
    context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = coordinator;
}

- (void)tearDown
{

    [super tearDown];
}

- (void)testDesializeDate
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tweet" inManagedObjectContext:context];
    

    Tweet * tweet=[NSEntityDescription
                     insertNewObjectForEntityForName:[entity name]
                     inManagedObjectContext:context];
    TwitterHelper * helper = [[TwitterHelper alloc] init];
    helper.context = context;
    NSDictionary * json = @{@"created_at" : @"Wed Apr 24 09:12:58 +0000 2013",
        @"id_str" : @"123456",
        @"text" : @"sdfsd sd asdf asd fasd fasd f",
        @"name" : @"MArcus"
    };
    Tweet * t =  [helper Deserialize:json tweet:tweet ];
    STAssertNotNil(t.created_at , @"Klarade inte att översätta datum");
    
    
}

@end
