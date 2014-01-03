//
//  TipCell.m
//  MasterDetailApp
//
//  Created by mgarciaibanez on 02/01/14.
//  Copyright (c) 2014 mgarciaibanez. All rights reserved.
//

#import "TipCell.h"
#import "DisplayUnit.h"

@implementation TipCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(TipCell *)customizeCell: (UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath data2Store:(NSMutableArray *)data2Store{
    static NSString *cellId = @"MyBasicCell";
    TipCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    DisplayUnit *displayUnit = data2Store[indexPath.row];
    cell = [self customizeCellLocal:cell displayUnit:displayUnit];
    return cell;
}

#pragma mark - Customize cell
- (TipCell *) customizeCellLocal:(TipCell *) cell displayUnit:(DisplayUnit *)displayUnit{
    TipCell *result = cell;
    
    //TitleLabel
    result.titleLabel.text = displayUnit.titleDU;
    //IntroLabel
    result.introLabel.text = displayUnit.introDU;
    
    //Keyword Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self.delegate action:@selector(keywordButtonTap:) forControlEvents:UIControlEventTouchDown];
    [button setTitle:displayUnit.mainTitleDU forState:UIControlStateNormal];
    button.frame = CGRectMake(-20,20,100,60);
    [[button layer] setBorderWidth:2.0f];
    [[button layer] setBorderColor:[UIColor blackColor].CGColor];
    [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
    button.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.transform = CGAffineTransformMakeRotation(-M_PI/2);
    [result addSubview:button];
    //End of keyword Button
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    result.dateLabel.text = [dateFormatter stringFromDate:displayUnit.dateDU];
    
    return result;
}


#pragma mark - button action
-(void)aMethod:(id)sender{
    NSLog(@"button tapped");
}

@end
