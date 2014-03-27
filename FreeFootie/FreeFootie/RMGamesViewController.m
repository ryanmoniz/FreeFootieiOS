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

   self.gamesArray = [[NSMutableArray alloc] init];
   self.teamsArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
   [super viewWillAppear:animated];

   if ([self.gamesArray count] == 0) {
      //no games :(
      UILabel *nogamesLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)-125, CGRectGetMidY(self.view.frame)-100, 250, 100)];
      nogamesLabel.text = @"Sorry, no games scheduled";
      nogamesLabel.textAlignment = NSTextAlignmentCenter;
      nogamesLabel.textColor = [UIColor whiteColor];
      [self.view addSubview:nogamesLabel];
      [self.gamesTableView setHidden:YES];
   }
   else {
      [self.gamesTableView setHidden:NO];
      [self.gamesTableView reloadData];
   }
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

   NSString *homeString = @"";
   NSString *awayString = @"";

   for (RMTeamsModel *model in self.teamsArray) {
      if ([[model idNumber] isEqualToNumber:homeNumber]) {
         homeString = [model teamNameString];
      }
      else if ([[model idNumber] isEqualToNumber:awayNumber]) {
         awayString = [model teamNameString];
      }
      if (([homeString length] > 0) && ([awayString length] > 0)) {
         break;
      }
   }

   cell.textLabel.text = [NSString stringWithFormat:@"%@ vs. %@",homeString, awayString];

   return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [self.gamesArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   //should get the information about the game and either push a view to either show more info about the teams playing, the pool, location, status, etc.
}

@end
