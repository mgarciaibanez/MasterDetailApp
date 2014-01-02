//
//  MasterViewController.m
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DisplayUnit.h"
#import "TipCell.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController
@synthesize tipsAndAdvices = _tipsAndAdvices;
@synthesize xmlCont = _xmlCont;
- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

//Methods to reload data
/*
 [self.tableView reloadData];
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_xmlCont parseFile];
	// Do any additional setup after loading the view, typically from a nib.
    if (self.splitViewController)//We are in ipad
        self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tipsAndAdvices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MyBasicCell";
    TipCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    
    
    DisplayUnit *displayUnit = self.tipsAndAdvices[indexPath.row];
    cell.titleLabel.text = displayUnit.titleDU;
    cell.introLabel.text = displayUnit.introDU;
    cell.keywordLabel.transform = CGAffineTransformMakeRotation(-M_PI/2);//To rotate the text 90 degrees
    cell.keywordLabel.text = displayUnit.mainTitleDU;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    cell.dateLabel.text = [dateFormatter stringFromDate:displayUnit.dateDU];
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UINavigationController *detailNavigationController = self.splitViewController.viewControllers[1];
        id detail = detailNavigationController.topViewController;
        if ([detail isKindOfClass:[DetailViewController class]]){
            DisplayUnit *displayUnit = _tipsAndAdvices[indexPath.row];
            [self.detailViewController setDetailItem:displayUnit];
        }
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //As per Stanford
    if ([sender isKindOfClass:[UITableViewCell class]]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath){
            if ([segue.identifier isEqualToString:@"showDetail"]){
                if ([segue.destinationViewController isKindOfClass:[DetailViewController class]]){
                    DisplayUnit *displayUnit = _tipsAndAdvices[indexPath.row];
                    //TO SET THE BACK BUTTON TITLE NO EMPTY
                    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
                    [[segue destinationViewController] setDetailItem:displayUnit];
                }
            }
        }
    }
}

@end
