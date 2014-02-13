//
//  GPBDSViewController.m
//  GPBDS
//
//  Created by Tom Cole on 2/12/14.
//  Copyright (c) 2014 Cal Poly Pomona. All rights reserved.
//

#import "GPBDSViewController.h"
#import "GPBDSDataService.h"
#import "GPBDSDataRecord.h"

@interface GPBDSViewController () <UISearchDisplayDelegate, UISearchBarDelegate>

@end

@implementation GPBDSViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView == self.tableView)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.tableView)
    {
        return 0;
    }
    else
    {
        return [self.searchResults count];
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.tableView) return nil;
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    GPBDSDataRecord *record = [self.searchResults objectAtIndex:indexPath.row];
    NSString *label =[NSString stringWithFormat:@"Record Number: %@", record.recordId];
    [cell.textLabel setText: label];
    [cell.detailTextLabel setText:record.displayData];
    
    return cell;
}

#pragma mark - Search Display Controller

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self.searchResults removeAllObjects];
    [self.searchDisplayController.searchResultsTableView reloadData];
    return NO;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    NSString *searchString = controller.searchBar.text;
    self.searchResults = [[[GPBDSDataService alloc] init] searchByKeywords:searchString];
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchString = searchBar.text;
    self.searchResults = [[[GPBDSDataService alloc] init] searchByKeywords:searchString];
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    [self.searchDisplayController.searchResultsTableView reloadData];
}


/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
