//
//  TableViewController.m
//  TableView
//
//  Created by Krešimir Sabljo on 07/05/2019.
//  Copyright © 2019 Krešimir Sabljo. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.year = @[@"Januar",@"Februray",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.year count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * listCellIdentifier = @"tableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: listCellIdentifier];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"logo.png"];
    cell.textLabel.text = self.year[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:30];
    cell.detailTextLabel.text = @"Detail"; // show details => GOTO : main.storyboard -> select prototype cell -> show the Attributes inspector  -> table view cell -> style -> select "Subtitle"
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

 - (NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 3)
    {
        return 0;
    }
    if (indexPath.row <= 3 && indexPath.row <= 6) {
        return 3;
    }
    if (indexPath.row <= 7 && indexPath.row <= 10) {
        return 6;
    }
    else
    {
        return 9;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ //selectable cell Yes or NO
    if (indexPath.row <=2 ) { //first 0,1,2 is't selectable
        return nil;
    }
    else
    { //other is selectable
        return indexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowValue = self.year[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat: @"%@",rowValue ];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 60;
}




@end
