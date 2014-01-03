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
#import <QuartzCore/QuartzCore.h>

@interface MasterViewController ()

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
    //Here set up Slide controller
//    UIViewController *leftDrawer = [[UIViewController alloc] init];
//    MMDrawerController * drawerController = [[MMDrawerController alloc]
//                                             initWithCenterViewController:self
//                                             leftDrawerViewController:leftDrawer
//                                             rightDrawerViewController:nil];
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
    UITableViewCell *cell = [[[TipCell alloc] init] customizeCell:tableView cellForRowAtIndexPath:indexPath data2Store:self.tipsAndAdvices];
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

#pragma - mark TipcellDelegate
-(void) keywordButtonTap:(id)sender{
    NSLog(@"Button Tapped");
}
@end
