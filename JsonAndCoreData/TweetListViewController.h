//
//  TweetListViewController.h
//  JsonAndCoreData
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterHelper.h"
#import "protocols.h"
@interface TweetListViewController : UITableViewController<DataLoadingComplete,Controller>
@property (strong, nonatomic) IBOutlet UITableView *tweetsTable;

@end
