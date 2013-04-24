//
//  TweetListViewController.m
//  JsonAndCoreData
//
//  Created by Marcus Classon on 2013-04-24.
//  Copyright (c) 2013 Marcus Classon. All rights reserved.
//

#import "TweetListViewController.h"
#import "TwitterHelper.h"
#import "DateUtils.h"

@interface TweetListViewController ()
{
    TwitterHelper * helper;
    NSArray * arrayOfTweets;
}
@end

@implementation TweetListViewController
@synthesize managedObjectContext = __managedObjectContext;
@synthesize persistentStoreCoordinator,tweetsTable;
-(void)loadComplete:(NSArray*)payLoad
{
    arrayOfTweets =payLoad;
    [tweetsTable reloadData];
}


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
    helper = [[TwitterHelper alloc] init];
    helper.context = self.managedObjectContext;
    [helper GetTweets:self];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

    return [arrayOfTweets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"tweet";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Tweet *t = (Tweet*)[arrayOfTweets objectAtIndex:indexPath.row];
    UILabel *text = (UILabel*)[cell viewWithTag:1];

    if(Nil != text)
    {
        UILabel *user = (UILabel*)[cell viewWithTag:2];

        UILabel *date = (UILabel*)[cell viewWithTag:3];
        
        text.text = t.text;
        NSString * dateString = [DateUtils toLongDateStringFromDate:t.created_at];
        date.text = dateString;
        user.text = t.user;
        
    }
    else{
        cell.textLabel.text = t.text;
    }
    
    return cell;
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
