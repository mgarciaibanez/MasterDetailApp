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

@property (nonatomic, strong) NSString *mainTitleDU;
@property (nonatomic, strong) NSString *titleDU;
@property (nonatomic, strong) NSString *introDU;
@property (nonatomic, strong) NSString *bodyDU;
@property (nonatomic, strong) NSString *conclusionDU;
@property (nonatomic, strong) NSDate *dateDU;
@property (nonatomic, strong) File *parentFile;

@end
