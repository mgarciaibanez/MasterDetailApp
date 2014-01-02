//
//  TipCell.h
//  MasterDetailApp
//
//  Created by mgarciaibanez on 02/01/14.
//  Copyright (c) 2014 mgarciaibanez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *introLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *keywordLabel;

@end
