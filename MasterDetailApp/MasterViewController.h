//
//  MasterViewController.h
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLController.h"
#import "TipCell.h"

@class DetailViewController;

@protocol  DisplayUnitDelegate <NSObject>

@end

@interface MasterViewController : UITableViewController <TipCellDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong) NSMutableArray *tipsAndAdvices;
@property (strong) XMLController *xmlCont;


//ADD this line
@property (strong, nonatomic) DetailViewController *mainDetailViewController;

@property (nonatomic,retain) id<DisplayUnitDelegate> delegate;
@end
