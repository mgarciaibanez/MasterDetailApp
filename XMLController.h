//
//  XMLController.h
//  MasterDetailApp
//
//  Created by mgarciaibanez on 30/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "File.h"
#import "DisplayUnit.h"

@interface XMLController : NSObject
@property(nonatomic) File *file;
@property(nonatomic) DisplayUnit *displayUnit;

-(void)parseFile;
@end
