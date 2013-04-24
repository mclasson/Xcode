//
//  JsonAndCoreDataAppDelegate.h
//  JsonAndCoreData
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsonAndCoreDataAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
