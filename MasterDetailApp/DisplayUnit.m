//
//  DisplayUnit.m
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import "DisplayUnit.h"

@implementation DisplayUnit
@synthesize mainTitleDU = _mainTitleDU;
@synthesize titleDU = _titleDU;
@synthesize introDU = _introDU;
@synthesize bodyDU = _bodyDU;
@synthesize conclusionDU = _conclusionDU;
@synthesize dateDU = _dateDU;
@synthesize parentFile = _parentFile;
@synthesize nextDU = _nextDU;
@synthesize prevDU = _prevDU;

-(id) initWithAllData:(NSString *)maintTitleDU titleDU:(NSString *)titleDU introDU:(NSString *)introDU bodyDU:(NSString *)bodyDU conclusionDU:(NSString *)conclusionDU dateDU:(NSDate *)dateDU parentFile:(File *)parentFile nextDU:(NSString *)nextDU prevDU:(NSString *)prevDU{
    
    if ((self = [super init])){
        self.mainTitleDU = maintTitleDU;
        self.titleDU = titleDU;
        self.introDU = introDU;
        self.bodyDU = bodyDU;
        self.conclusionDU = conclusionDU;
        if (!dateDU){
            self.dateDU =[NSDate date];
        } else {
            self.dateDU = dateDU;
        }
        self.parentFile = parentFile;
        self.nextDU = nextDU;
        self.prevDU = prevDU;
    }
    
    return self;
}
@end
