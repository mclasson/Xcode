//
//  protocols.h
//  JsonAndCoreData
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DataLoadingComplete <NSObject>
    -(void)loadComplete:(NSArray*)payLoad;
@end
@protocol Controller <NSObject>
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@end

