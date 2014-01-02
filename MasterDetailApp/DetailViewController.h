//
//  DetailViewController.h
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "DisplayUnit.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, DisplayUnitDelegate>
{
    
}
@property (strong, nonatomic) DisplayUnit *detailItem;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
