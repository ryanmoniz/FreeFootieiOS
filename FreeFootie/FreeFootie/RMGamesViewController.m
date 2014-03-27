//
//  RMFirstViewController.m
//  FreeFootie
//
//  Created by macmoniz on 2014-03-24.
//  Copyright (c) 2014 ryanmoniz. All rights reserved.
//

#import "RMGamesViewController.h"
#import "RMGameModel.h"
#import "RMTeamsModel.h"

@interface RMGamesViewController ()

@end

@implementation RMGamesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *cellIdentifier = @"GameCell";
	UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
   }

   cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

   NSNumber *homeNumber = [(RMGameModel *)[self.gamesArray objectAtIndex:indexPath.row] homeTeamIDNumber];
   NSNumber *awayNumber = [(RMGameModel *)[self.gamesArray objectAtIndex:indexPath.row] awayTeamIDNumber];

   cell.textLabel.text = [NSString stringWithFormat:@"%d vs. %d",[homeNumber intValue],[awayNumber intValue]];
   cell.detailTextLabel.text = @"";

   return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [self.gamesArray count];
}

@end
