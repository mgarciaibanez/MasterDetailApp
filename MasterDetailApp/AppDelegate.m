//
//  AppDelegate.m
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "XMLController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    XMLController *xmlCont = [[XMLController alloc] init];
    [xmlCont parseFile];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
        
        
        DetailViewController *detail = (DetailViewController *) navigationController.topViewController;
        UINavigationController *masterNavigationController = [splitViewController.viewControllers objectAtIndex:0];
        
        MasterViewController *masterViewContoller = (MasterViewController *) masterNavigationController.topViewController;
        
        masterViewContoller.tipsAndAdvices = [NSMutableArray arrayWithObjects: xmlCont.displayUnit, nil];
        masterViewContoller.detailViewController = detail;
        masterViewContoller.delegate = detail;
    }
    else{
        UINavigationController *navController = (UINavigationController *) self.window.rootViewController;
        MasterViewController *masterViewContoller = [navController.viewControllers objectAtIndex:0];
        masterViewContoller.tipsAndAdvices =  [NSMutableArray arrayWithObjects: xmlCont.displayUnit, nil];
    }
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
