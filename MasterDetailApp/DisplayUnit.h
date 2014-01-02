//
//  DisplayUnit.h
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "File.h"
@interface DisplayUnit : NSObject

@property (nonatomic, strong) NSString *mainTitleDU;//Keyword for T&A and id for iM
@property (nonatomic, strong) NSString *titleDU; //Title for T&A
@property (nonatomic, strong) NSString *introDU; // For T&A
@property (nonatomic, strong) NSString *bodyDU; // For Both
@property (nonatomic, strong) NSString *conclusionDU; // For T&A
@property (nonatomic, strong) NSDate *dateDU; // For both
@property (nonatomic, strong) File *parentFile;
@property (nonatomic,strong) NSString *nextDU;// For Both
@property (nonatomic,strong) NSString *prevDU;// For Both

-(id) initWithAllData:(NSString *)maintTitleDU titleDU:(NSString *)titleDU introDU:(NSString *)introDU bodyDU:(NSString *)bodyDU conclusionDU:(NSString *)conclusionDU dateDU:(NSDate *)dateDU parentFile:(File *)parentFile nextDU:(NSString *)nextDU prevDU:(NSString *)prevDU;
@end
